#version 300 es 

precision mediump float;

uniform float u_time;
uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform sampler2D u_tex0;

out vec4 fragColor;

void main(){
    vec3 cols[3] = vec3[3]( vec3(1.), vec3(0.), vec3(0.5));
    //vec3 cols[3];
    //cols[0] = vec3(1.);
    //cols[1] = vec3(0.);
    //cols[2] = vec3(0.5);
    vec3 col;
    for(int i=0;i<3;i++){
        col = cols[i];
    }
    fragColor = vec4(col, 1.);
}