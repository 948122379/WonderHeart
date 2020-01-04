// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.28 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.28;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:33091,y:32684,varname:node_4013,prsc:2|diff-4165-OUT,spec-6548-OUT,normal-5094-OUT,emission-3908-OUT,voffset-9622-OUT;n:type:ShaderForge.SFN_Tex2d,id:6279,x:32485,y:32682,ptovrint:False,ptlb:node_6279,ptin:_node_6279,varname:node_6279,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:5097,x:31533,y:33155,varname:node_5097,prsc:2,uv:0;n:type:ShaderForge.SFN_Panner,id:1878,x:31713,y:33155,varname:node_1878,prsc:2,spu:0.25,spv:0|UVIN-5097-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:5940,x:31889,y:33155,varname:node_5940,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-1878-UVOUT;n:type:ShaderForge.SFN_Frac,id:4320,x:31598,y:32941,varname:node_4320,prsc:2|IN-5940-OUT;n:type:ShaderForge.SFN_Vector1,id:929,x:31729,y:33088,varname:node_929,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Subtract,id:2264,x:31810,y:32941,varname:node_2264,prsc:2|A-4320-OUT,B-929-OUT;n:type:ShaderForge.SFN_Abs,id:3923,x:31998,y:32941,varname:node_3923,prsc:2|IN-2264-OUT;n:type:ShaderForge.SFN_Vector1,id:2896,x:32050,y:33062,varname:node_2896,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:7322,x:32210,y:32941,varname:node_7322,prsc:2|A-3923-OUT,B-2896-OUT;n:type:ShaderForge.SFN_Vector1,id:7209,x:32026,y:33226,cmnt:Bulge Shape,varname:node_7209,prsc:2,v1:5;n:type:ShaderForge.SFN_Power,id:8381,x:32191,y:33170,varname:node_8381,prsc:2|VAL-7322-OUT,EXP-7209-OUT;n:type:ShaderForge.SFN_Lerp,id:2,x:32671,y:32971,varname:node_2,prsc:2|A-7258-RGB,B-5975-OUT,T-8381-OUT;n:type:ShaderForge.SFN_Tex2d,id:7258,x:32485,y:32872,ptovrint:False,ptlb:Normals,ptin:_Normals,varname:node_7258,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bbab0a6f7bae9cf42bf057d8ee2755f6,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Vector3,id:5975,x:32473,y:33044,varname:node_5975,prsc:2,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_Lerp,id:4165,x:32830,y:32759,varname:node_4165,prsc:2|A-6279-RGB,B-6122-OUT,T-8381-OUT;n:type:ShaderForge.SFN_Vector1,id:6122,x:32608,y:32815,varname:node_6122,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Vector1,id:6548,x:32840,y:32887,varname:node_6548,prsc:2,v1:1;n:type:ShaderForge.SFN_Normalize,id:5094,x:32864,y:32992,varname:node_5094,prsc:2|IN-2-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6324,x:32451,y:33371,ptovrint:False,ptlb:Glow Intensity,ptin:_GlowIntensity,varname:node_6324,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.2;n:type:ShaderForge.SFN_Relay,id:9928,x:32497,y:33448,varname:node_9928,prsc:2|IN-8381-OUT;n:type:ShaderForge.SFN_Color,id:4457,x:32451,y:33186,ptovrint:False,ptlb:Glow Color,ptin:_GlowColor,varname:node_4457,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.2,c3:0.1,c4:1;n:type:ShaderForge.SFN_Multiply,id:3908,x:32701,y:33266,varname:node_3908,prsc:2|A-4457-RGB,B-6324-OUT,C-9928-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9835,x:32658,y:33506,ptovrint:False,ptlb:BuglenScale,ptin:_BuglenScale,varname:node_9835,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.2;n:type:ShaderForge.SFN_NormalVector,id:2950,x:32658,y:33597,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:9622,x:32951,y:33473,varname:node_9622,prsc:2|A-9928-OUT,B-9835-OUT,C-2950-OUT;proporder:6279-7258-6324-4457-9835;pass:END;sub:END;*/

Shader "Hotline" {
    Properties {
        _node_6279 ("node_6279", 2D) = "white" {}
        _Normals ("Normals", 2D) = "bump" {}
        _GlowIntensity ("Glow Intensity", Float ) = 1.2
        _GlowColor ("Glow Color", Color) = (1,0.2,0.1,1)
        _BuglenScale ("BuglenScale", Float ) = 0.2
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
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _node_6279; uniform float4 _node_6279_ST;
            uniform sampler2D _Normals; uniform float4 _Normals_ST;
            uniform float _GlowIntensity;
            uniform float4 _GlowColor;
            uniform float _BuglenScale;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 node_7032 = _Time + _TimeEditor;
                float node_8381 = pow((abs((frac((o.uv0+node_7032.g*float2(0.25,0)).r)-0.5))*2.0),5.0);
                float node_9928 = node_8381;
                v.vertex.xyz += (node_9928*_BuglenScale*v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _Normals_var = UnpackNormal(tex2D(_Normals,TRANSFORM_TEX(i.uv0, _Normals)));
                float4 node_7032 = _Time + _TimeEditor;
                float node_8381 = pow((abs((frac((i.uv0+node_7032.g*float2(0.25,0)).r)-0.5))*2.0),5.0);
                float3 normalLocal = normalize(lerp(_Normals_var.rgb,float3(0,0,1),node_8381));
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float node_6548 = 1.0;
                float3 specularColor = float3(node_6548,node_6548,node_6548);
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _node_6279_var = tex2D(_node_6279,TRANSFORM_TEX(i.uv0, _node_6279));
                float node_6122 = 0.1;
                float3 diffuseColor = lerp(_node_6279_var.rgb,float3(node_6122,node_6122,node_6122),node_8381);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float node_9928 = node_8381;
                float3 emissive = (_GlowColor.rgb*_GlowIntensity*node_9928);
/// Final Color:
                float3 finalColor = diffuse + specular + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _node_6279; uniform float4 _node_6279_ST;
            uniform sampler2D _Normals; uniform float4 _Normals_ST;
            uniform float _GlowIntensity;
            uniform float4 _GlowColor;
            uniform float _BuglenScale;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 node_8530 = _Time + _TimeEditor;
                float node_8381 = pow((abs((frac((o.uv0+node_8530.g*float2(0.25,0)).r)-0.5))*2.0),5.0);
                float node_9928 = node_8381;
                v.vertex.xyz += (node_9928*_BuglenScale*v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _Normals_var = UnpackNormal(tex2D(_Normals,TRANSFORM_TEX(i.uv0, _Normals)));
                float4 node_8530 = _Time + _TimeEditor;
                float node_8381 = pow((abs((frac((i.uv0+node_8530.g*float2(0.25,0)).r)-0.5))*2.0),5.0);
                float3 normalLocal = normalize(lerp(_Normals_var.rgb,float3(0,0,1),node_8381));
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float node_6548 = 1.0;
                float3 specularColor = float3(node_6548,node_6548,node_6548);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _node_6279_var = tex2D(_node_6279,TRANSFORM_TEX(i.uv0, _node_6279));
                float node_6122 = 0.1;
                float3 diffuseColor = lerp(_node_6279_var.rgb,float3(node_6122,node_6122,node_6122),node_8381);
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float _BuglenScale;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_1179 = _Time + _TimeEditor;
                float node_8381 = pow((abs((frac((o.uv0+node_1179.g*float2(0.25,0)).r)-0.5))*2.0),5.0);
                float node_9928 = node_8381;
                v.vertex.xyz += (node_9928*_BuglenScale*v.normal);
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
