#version 300 es
  precision mediump float;

uniform float u_time;
uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform sampler2D u_tex0;

// Source: http://gamedev.stackexchange.com/questions/23743/whats-the-most-efficient-way-to-find-barycentric-coordinates
vec3 bary(vec2 a, vec2 b, vec2 c, vec2 p) {
    vec2 v0 = b-a, v1 = c-a, v2 = p-a;
    float d00 = dot(v0,v0);
    float d01 = dot(v0,v1);
    float d11 = dot(v1,v1);
    float d20 = dot(v2,v0);
    float d21 = dot(v2,v1);
    float d = 1./(d00*d11-d01*d01);
    float v = (d11*d20-d01*d21)*d;
    float w = (d00*d21-d01*d20)*d;
    float u = 1.-v-w;
    return vec3(u,v,w);
}

//------------- interpolation ----------------//

float baryLerp(float a, float b, float c, vec3 x) {
    return a * x.x + b * x.y + c * x.z;
}

vec2 uvLerp(vec2 a, vec2 b, vec2 c, vec3 x) {
    return a * x.x + b * x.y + c * x.z;
}

//------------- transformations --------------//

mat4 perspective(float fovy, float aspect, float near, float far) {
    float thf = 1./tan(radians(fovy)*.5);
    float rng = far-near;
    mat4 m = mat4(1.);
    m[0][0] = thf/aspect;
    m[1][1] = thf;
    m[2][2] = -((far+near)/rng);
    m[2][3] = -1.;
    m[3][2] = -((2.*far*near)/rng);
    m[3][3] = 0.;
    return m;
}

mat4 translate(vec3 v) {
    mat4 m = mat4(1.);
    m[3][0] = v.x;
    m[3][1] = v.y;
    m[3][2] = v.z;
    return m;
}

mat4 rotateX(float angle) {
    float r = radians(angle), s = sin(r), c = cos(r);
    mat4 m = mat4(1.);
    float m10 = m[1][0], m20 = m[2][0];
    float m11 = m[1][1], m21 = m[2][1];
    float m12 = m[1][2], m22 = m[2][2];
    float m13 = m[1][3], m23 = m[2][3];
    m[1][0] = m10 * c - m20 * s;
	m[1][1] = m11 * c - m21 * s;
	m[1][2] = m12 * c - m22 * s;
	m[1][3] = m13 * c - m23 * s;
	m[2][0] = m10 * s + m20 * c;
	m[2][1] = m11 * s + m21 * c;
	m[2][2] = m12 * s + m22 * c;
	m[2][3] = m13 * s + m23 * c;
    return m;
}

mat4 rotateY(float angle) {
    float r = radians(angle), s = sin(r), c = cos(r);
    mat4 m = mat4(1.);
    float m00 = m[0][0], m20 = m[2][0];
    float m01 = m[0][1], m21 = m[2][1];
    float m02 = m[0][2], m22 = m[2][2];
    float m03 = m[0][3], m23 = m[2][3];
    m[0][0] = m00 * c - m20 * s;
	m[0][1] = m01 * c - m21 * s;
	m[0][2] = m02 * c - m22 * s;
	m[0][3] = m03 * c - m23 * s;
	m[2][0] = m00 * s + m20 * c;
	m[2][1] = m01 * s + m21 * c;
	m[2][2] = m02 * s + m22 * c;
	m[2][3] = m03 * s + m23 * c;
    return m;
}

#define VERTEX_COUNT 18

 vec3 vertices[VERTEX_COUNT] = vec3[VERTEX_COUNT] (
    vec3(-0.5, 0.0, -0.5),
    vec3( 0.5, 0.0, -0.5),
    vec3(-0.5, 0.0,  0.5),
    
    vec3(-0.5, 0.0,  0.5),
    vec3( 0.5, 0.0, -0.5),
    vec3( 0.5, 0.0,  0.5),
    
    vec3(-0.5, 0.0, -0.5),
    vec3( 0.5, 0.0, -0.5),
    vec3( 0.0, 1.0,  0.0),
    
    vec3(-0.5, 0.0,  0.5),
    vec3( 0.5, 0.0,  0.5),
    vec3( 0.0, 1.0,  0.0),
    
    vec3(-0.5, 0.0, -0.5),
    vec3(-0.5, 0.0,  0.5),
    vec3( 0.0, 1.0,  0.0),
    
    vec3( 0.5, 0.0, -0.5),
    vec3( 0.5, 0.0,  0.5),
    vec3( 0.0, 1.0,  0.0)
);

vec2 texCoords[VERTEX_COUNT] = vec2[VERTEX_COUNT] (
    vec2(0., 1.),
    vec2(1., 1.),
    vec2(0., 0.),
    
    vec2(0., 0.),
    vec2(1., 1.),
    vec2(1., 0.),
    
    vec2(0., 1.),
    vec2(1., 1.),
    vec2(.5, 0.),
    
    vec2(0., 1.),
    vec2(1., 1.),
    vec2(.5, 0.),
    
    vec2(0., 1.),
    vec2(1., 1.),
    vec2(.5, 0.),
    
    vec2(0., 1.),
    vec2(1., 1.),
    vec2(.5, 0.)
);

//-------- shaders -------/

vec4 vertexShader(in vec3 vertex, in mat4 transform) {
    // converts position into NDC
    return transform * vec4(vertex, 1.);
}

vec4 fragmentShader(in vec2 uv) {
    return texture(u_tex0, uv);
}

//-------- rasterizing -------//

const float fov  = 70.0;
const float near = 0.1;
const float far  = 10.;

const vec3 cameraPos = vec3(0., 0.3, 2.);

vec4 pixel(in vec2 ndc, in float aspect, inout float depth, in int vertexIndex) {

    float rotX = -25.;
    float rotY = 45. + u_time * 20.;
    
    if(u_mouse.xy != vec2(0.)) {
        rotX = -100. + (u_mouse.y * 1000.*150. / u_resolution.y);
        rotY = u_mouse.x * 360.*1000. / u_resolution.x;
    }
    

    // step 0: calculate projection matrix
    mat4 proj  = perspective(fov, aspect, near, far);
    mat4 view  = translate(-cameraPos);
    mat4 model = rotateX(rotX) * rotateY(rotY);
    
    mat4 mvp  = proj * view * model;

    // step 1: run vertex shader and get ndc of each vertex
    vec4 v0 = vertexShader(vertices[vertexIndex  ], mvp);
    vec4 v1 = vertexShader(vertices[vertexIndex+1], mvp);
    vec4 v2 = vertexShader(vertices[vertexIndex+2], mvp);
    
    // divide tex coords by w for perspective correctness
    vec2 t0 = texCoords[vertexIndex  ] / v0.w; float oow0 = 1. / v0.w;
    vec2 t1 = texCoords[vertexIndex+1] / v1.w; float oow1 = 1. / v1.w;
    vec2 t2 = texCoords[vertexIndex+2] / v2.w; float oow2 = 1. / v2.w;
    
    // step 2: do perspective division and calculate barycentric coordinates
    //         (and determine if we're even on the triangle)
    v0 /= v0.w;
    v1 /= v1.w;
    v2 /= v2.w;
    
    vec3 tri = bary(v0.xy, v1.xy, v2.xy, ndc);
    
    // if any of the coordinates aren't within [0,1], we're outside the triangle
    if(tri.x < 0. || tri.x > 1. || tri.y < 0. || tri.y > 1. || tri.z < 0. || tri.z > 1.) {
        return vec4(0.);
    }
    
    // step 3: perform depth testing and cull pixels outside the camera's Z range
    float triDepth = baryLerp(v0.z, v1.z, v2.z, tri);
    if(triDepth > depth || triDepth < -1. || triDepth > 1.) {
        return vec4(0.);
    }
    
    depth = triDepth; // write to depth buffer
    
    // step 3: run fragment shader to get pixel colour (and correct UVs)
    float oneOverW = baryLerp(oow0, oow1, oow2, tri);
    vec2 uv        = uvLerp(t0, t1, t2, tri) / oneOverW;
    return vec4(uv, 0., 1.);
    //return fragmentShader(uv);

}

//-------- main ---------//
out vec4 fragColor;
void main()
{
    vec2 ndc = ((gl_FragCoord.xy * 2.) / u_resolution.xy) - vec2(1.);
    //vec2 ndc = ((gl_FragCoord.xy * 2.) / vec2(800., 600.)) - vec2(1.);
    fragColor = vec4(ndc, 0., 1.);
    float aspect = u_resolution.x / u_resolution.y;
    //float aspect = 800. / 600.;
    vec3 outColor = vec3(.4,.6,.9);

    float depth = 1.0;
    for(int i = 0; i < VERTEX_COUNT; i += 3) {
        vec4 tri = pixel(ndc, aspect, depth, i);
        outColor = mix(outColor.rgb, tri.rgb, tri.a);
    }
    
    fragColor = vec4(outColor, 1.);
    //fragColor = vec4(0.5);
}