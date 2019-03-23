Shader "Unlit/start"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}

        _Color("Color", color) = (1, 1, 1, 1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work

            fixed4 _Color;

            //使用结构体来定义顶点着色器的输入
            struct a2v
            {
                //POSITION语义告诉Unity, 用模型空间顶点坐标填充vertex变量
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 texcoord : TEXCOORD0;
            };

            struct v2f {
                //SV_POSITION语义告诉unity, pos里面包含了顶点在剪裁空间在的位置信息
                float4 pos : SV_POSITION;

                fixed3 color : COLOR0;
            };

            v2f vert(a2v v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos( v.vertex);

                //v.normal 包含了顶点的发现方向，其分量范围在[-1.0，1.0]
                //下面的代码吧分量范围映射到了[0.0，1.0]，并储存到o.color中传递给片源着色器
                o.color = v.normal * 0.5 + fixed3(0.5, 0.5, 0.5);
                return o;

            }


            fixed4 frag(v2f i ) : SV_Target
            {
                float3 c = i.color;
                c*= _Color.rgb;
            //将插值后的i.color 显示到屏幕
                return fixed4(c, 1.0);
            }


            #include "UnityCG.cginc"



            ENDCG
        }
    }
}
