// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/Digital matrix" {
	Properties {
_Resolution ("Resolution", Range(1, 50)) = 5
_numbertex ("number tex", 2D) = "black" {}
}
SubShader {
Tags {
"RenderType"="Opaque"
}
Pass {
Name "FORWARD"
Tags {
"LightMode"="ForwardBase"
}


CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#define UNITY_PASS_FORWARDBASE
#include "UnityCG.cginc"
#pragma multi_compile_fwdbase_fullshadows
#pragma multi_compile_fog
#pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
#pragma target 3.0
uniform float _Resolution;
uniform sampler2D _numbertex; uniform float4 _numbertex_ST;
struct VertexInput {
float4 vertex : POSITION;
float2 texcoord0 : TEXCOORD0;
};
struct VertexOutput {
float4 pos : SV_POSITION;
float2 uv0 : TEXCOORD0;
UNITY_FOG_COORDS(1)
};
VertexOutput vert (VertexInput v) {
VertexOutput o = (VertexOutput)0;
o.uv0 = v.texcoord0;
o.pos = UnityObjectToClipPos(v.vertex);
UNITY_TRANSFER_FOG(o,o.pos);
return o;
}
float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
////// Lighting:
////// Emissive:
float2 node_9110 = ceil((i.uv0*_Resolution));
float2 node_622_skew = node_9110 + 0.2127+node_9110.x*0.3713*node_9110.y;
float2 node_622_rnd = 4.789*sin(489.123*(node_622_skew));
float node_622 = frac(node_622_rnd.x*node_622_rnd.y*(1+node_622_skew.x));
float node_3190 = 10.0;
float node_3640 = floor((node_622*node_3190));
float node_4157 = (node_3640/node_3190);
float2 node_7946 = (_Resolution*float2((i.uv0.r/10.0),i.uv0.g));
float2 node_9286 = (float2(node_4157,node_3640)+node_7946);
float node_4905 = 10.0;
float2 node_1673 = float2((node_9286.r-(floor((node_7946.r*node_4905))/node_4905)),node_9286.g);
float4 _numbertex_var = tex2D(_numbertex,TRANSFORM_TEX(node_1673, _numbertex));
float3 emissive = saturate((node_4157*_numbertex_var.rgb));
float3 finalColor = emissive;
fixed4 finalRGBA = fixed4(finalColor,1);
UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
return finalRGBA;
}
ENDCG
}
}
FallBack "Diffuse"


}