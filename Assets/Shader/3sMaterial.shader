Shader "Unlit/3s"
{
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0
	struct appdata
	{
              float4 vertex : POSITION;
              float2 uv : TEXCOORD0;
              float3 normal:NORMAL;
	};
 
	struct v2f
	{
              float2 uv : TEXCOORD0;
              float4 screenUV:TEXCOORD1;
              float3 lightDir:TEXCOORD2;
              float3 viewDir:TEXCOORD3;
              float3 normal:TEXCOORD4;
              float4 grabUV:TEXCOORD5;
              UNITY_FOG_COORDS(1)
              float4 vertex : SV_POSITION;
	};
 
	sampler2D _MainTex;
	float4 _MainTex_ST;
	sampler2D _GrabTexture;
	sampler2D _BackDepthTex;
	float4 _AttenuationC;
	float4 _Color;
	float _Shininess;
	float _ScatteringFactor;
	float _Wrap;
 
	struct LightingInput {
              float3 Albedo;
              float3 Normal;
              float Gloss;
              float Specular;
              float Alpha;
	};
 
	float4 CalculateLighting (LightingInput i, float3 lightDir, float3 viewDir, float atten, float3 scattering)
	{
              float3 h = normalize (lightDir + viewDir);
             
              float diff = (dot (i.Normal, lightDir)+_Wrap)/(1+_Wrap);
              diff = saturate (diff);
             
              float nh = (dot (i.Normal, h)+_Wrap)/(1+_Wrap);
              nh = saturate(nh);
              float spec = pow (nh, i.Specular*128.0) * i.Gloss;
             
              float4 c;
              c.rgb = (i.Albedo * _LightColor0.rgb * diff *scattering + _LightColor0.rgb * _SpecColor.rgb * spec) * (atten * 2);
              c.a = i.Alpha + _SpecColor.a * spec * atten;
 
              return c;
	}
 
	v2f vert (appdata v)
	{
              v2f o;
              o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
              o.uv = TRANSFORM_TEX(v.uv, _MainTex);
              o.screenUV = ComputeScreenPos(o.vertex);
              o.lightDir = ObjSpaceLightDir(v.vertex);
              o.viewDir = ObjSpaceViewDir(v.vertex);
              o.normal = v.normal;
              o.grabUV = ComputeGrabScreenPos(o.vertex);
              UNITY_TRANSFER_FOG(o,o.vertex);
              return o;
	}
 
	float4 frag (v2f i) : SV_Target
	{
              // sample the texture
              float4 col = tex2D(_MainTex, i.uv);
              //
              float frontDepth = LinearEyeDepth( i.screenUV.z/i.screenUV.w );
              //
              float2 backDepthUV = i.screenUV.xy/i.screenUV.w;
              float4 backDepthColor = tex2D(_BackDepthTex, backDepthUV);
              float backDepth = LinearEyeDepth(DecodeFloatRGBA(backDepthColor));
              //do scattering
              float depth = backDepth-frontDepth;
              float3 scattering = exp(-_AttenuationC.xyz*depth);
              //do lighting
              LightingInput lightVar;
              lightVar.Albedo = col.rgb * _Color.rgb;
              lightVar.Gloss = col.a;
              lightVar.Alpha = col.a * _Color.a;
              lightVar.Specular = _Shininess;
              lightVar.Normal = i.normal;
 
              col = CalculateLighting (lightVar, i.lightDir, i.viewDir, _LightColor0.a, scattering);
              //blend
              //col.xyz = col.a*col.rgb + (1-col.a)*tex2D(_GrabTexture, i.grabUV.xy/i.grabUV.w);
              col.xyz = lerp(tex2D(_GrabTexture, i.grabUV.xy/i.grabUV.w), col.rgb, col.a);
              // apply fog
              UNITY_APPLY_FOG(i.fogCoord, col);
              return col;
	}
}
}