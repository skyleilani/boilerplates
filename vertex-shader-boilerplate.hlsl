Shader "SMO/NewImageEffectShader"
{
    // required data for shader to function
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

        // redraws screen 
        Pass
        {
            CGPROGRAM

            // define shaders
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            // used to pass data from Unity to vertex shader
            struct appdata
            {
                float4 vertex : POSITION; // vertex positions
                float2 uv : TEXCOORD0; // texture coords 
            };

            // used to passvertex shaders output to fragment shader
            // also contains vertex pos and texture coords, which may be different
            // from the appdata versions since theyve been processed by vertex shader
            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            // vertex shader function
            v2f vert (appdata v)
            {
                v2f o;

                // from UnityCG.cginc
                o.vertex = UnityObjectToClipPos(v.vertex); //transforms input vertices defined in the Unity world space, to the screen clip space
                
                o.uv = v.uv;
                return o;
            }
             

            // you need to create an instance of any properties you set
            sampler2D _MainTex; 

            // we havent defined this but you could have made: 
            // _MainText_ST which also contains scaling and UV offset data for the texture


            // fragment pixel shader 
            // runs once for each pixel of object
            // output is fixed4 RGBA
            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                // just invert the colors
                col.rgb = 1 - col.rgb;
                return col;
            }
            ENDCG
        }
    }
}
