//
//  Shader.metal
//  TakAppHighLights
//
//  Created by Demian Nezhdanov on 06/08/2023.
//

#include <metal_stdlib>
using namespace metal;






float3 highlight(float3 color, float intensity)
{
    const float a = 1.357697966704323E-01;
    const float b = 1.006045552016985E+00;
    const float c = 4.674339906510876E-01;
    const float d = 8.029414702292208E-01;
    const float e = 1.127806558508491E-01;
    
    float maxx = max(color.r, max(color.g, color.b));
    float minx = min(color.r, min(color.g, color.b));
    float lum = 0.5 * (maxx + minx);
    float x1 = abs(intensity);
    float x2 = lum;
    float lum_new =  lum < 0.5 ? lum : lum + a * sign(intensity) * exp(-0.5 * (((x1-b)/c)*((x1-b)/c) + ((x2-d)/e)*((x2-d)/e)));
    return color * lum_new / lum;
}


fragment float4 draw_fragment(VertexOut fragmentIn [[stage_in]],
//                              array<texture2d<float, access::sample>, 15> brush [[texture(12)]],
                              texture2d<float, access::sample> img [[texture(1)]],
                             
                              constant BufferData &highlightsBuffer [[buffer(13)]],
                              ) {
    float2 uv = fragmentIn.textureCoorinates;
    
   
    float3 c  = mix(color.rgb, float4(highlight(color, 0.8), 1.0f).rgb * 2.0 -dsark* 2.0 , highlightsBuffer.intensity );
    

    
    return float4(c,1.0);
}

