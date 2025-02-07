#version 300 es 

precision mediump float;


uniform vec2 u_resolution;

vec3 barycentric(vec2 p, vec2 a, vec2 b, vec2 c){
    vec2 v0 = b - a, v1 = c - a, v2 = p - a;
    float a00 = dot(v0, v0);
    float a11 = dot(v1, v1);
    float a01 = dot(v0, v1);
    float b0 = dot(v0, v2);
    float b1 = dot(v1, v2);
    float detA = a00 * a11 - a01 * a01;
    float detA1 = b0 * a11 - b1 * a01;
    float detA2 = a00 * b1 - a01 * b0;
    float u = detA1 / detA;
    float v = detA2 / detA;
    float w = 1. - u - v;
    return vec3(u, v, w);
}


bool rng(float r){ return r < 0. || r > 1.;}

out vec4 fragColor;
void main()
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = gl_FragCoord.xy/u_resolution.xy;

    vec2 v0 = vec2(0.1,0.1);
    vec2 v1 = vec2(0.5,.9);
    vec2 v2 = vec2(.9,0.1);
    vec3 bar = barycentric(uv, v0, v1, v2);
    if(rng(bar.x) || rng(bar.y) || rng(bar.z)){ bar=vec3(0.);}
    fragColor = vec4(bar.xyz, 1.0);
}