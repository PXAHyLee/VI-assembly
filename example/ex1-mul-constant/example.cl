__kernel void example(const global float4* in, global float4* out)
{
    float4 i = in[get_global_id(0)];

    float4 s = (1.0f - i) * 5.0f + i * 30.f;
    float4 x = (1.0f - i) * 1.0f + i * 100.f;

    out[get_global_id(0)] = s + x;
}
