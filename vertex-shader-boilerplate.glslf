
Shader "Explorer/Mandelbrot"
{
    // required data for shader to function properly
    // there are 
    Properties
    {
        // 2D texture/image
        _MainTex("Texture", 2D) = "white" {}
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

        // render to screen
        // shader code down here
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            // struct for vertex shader
            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            // vertex shader function
            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }
            sampler2D _MainTex;

            }

            // fragment shader
            fixed4 frag(v2f i) : SV_Target
            {
                
                
                }                  
                return 0;
            }
            ENDCG
        }
    }
}
