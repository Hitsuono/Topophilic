#version 300 es
precision mediump float;

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
uniform sampler2D u_tex0;

// To find barycentric coordinates, first translate with a as the origin.
// Then we can describe v2 as a combination of v0 and v1: v2 = u*v0 + v*v1.
// Doing do product by v0 and v1, we get two equations, giving the matrix equation
// (<v0, v0> <v0, v1>) (u) = (<v0, v2>)
// (<v1, v0> <v1, v1>) (v) = (<v1, v2>)
// Denoted A (u,v) = B.
// Cramer's rule then is used to solve for u, v.
// I.e., if A1 is A with first column substituted by B and A2 similarly, then
// u = det A1 / det A, v = det A2 / det A.
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
    // w is the a coefficient, u the b, v the c
    return vec3(w, u, v);
}

float barycentricLerp(vec3 x, float a, float b, float c){
    return a * x.x + b * x.y + c * x.z;
}

float depthLerp(float depth, vec3 triCoords, float c0, float c1, float c2, vec4 v0, vec4 v1, vec4 v2){
    return depth * (triCoords.x * c0 / v0.z 
                    + triCoords.y * c1 / v1.z 
                    + triCoords.z * c2 / v2.z);
}
vec2 depthLerp(float depth, vec3 triCoords, vec2 c0, vec2 c1, vec2 c2, vec4 v0, vec4 v1, vec4 v2){
    return depth * (triCoords.x * c0 / v0.z 
                    + triCoords.y * c1 / v1.z 
                    + triCoords.z * c2 / v2.z);
}
vec3 depthLerp(float depth, vec3 triCoords, vec3 c0, vec3 c1, vec3 c2, vec4 v0, vec4 v1, vec4 v2){
    return depth * (triCoords.x * c0 / v0.z 
                    + triCoords.y * c1 / v1.z 
                    + triCoords.z * c2 / v2.z);
}

//-------- Matrices -------//

// For some reason ROW_MAJOR has some visual bugs
#define COLUMN_MAJOR true

mat4 translate(vec3 t){
    mat4 m = mat4(1.);
    m[0][3] = t.x;
    m[1][3] = t.y;
    m[2][3] = t.z;
    
    if(COLUMN_MAJOR)
        return m;
    else
        return transpose(m);
}

mat4 rotX(float angle);
vec3 rotX(vec3 v, float angle);
mat4 rotY(float angle);

mat4 rotX(float angle){
    float r = radians(angle);
    float c = cos(r), s = sin(r);
    mat4 m = mat4(1.);
    m[1][1] = c;
    m[1][2] = -s;
    m[2][1] = s;
    m[2][2] = c;
    
    if(COLUMN_MAJOR)
        return m;
    else
        return transpose(m);
}

vec3 rotX(vec3 v, float angle){
    if(COLUMN_MAJOR){
        return (vec4(v, 0.) * rotX(angle)).xyz;
    }
    return (rotX(angle) * vec4(v, 0.)).xyz;
}

mat4 rotY(float angle){
    float r = radians(angle);
    float c = cos(r), s = sin(r);
    mat4 m = mat4(1.);
    m[0][0] = c;
    m[0][2] = -s;
    m[2][0] = s;
    m[2][2] = c;
    
    if(COLUMN_MAJOR)
        return m;
    else
        return transpose(m);
}

mat4 perspective(float far, float near, float right, float left, float top, float bottom);
mat4 perspective(float fovy, float aspect, float far, float near);

mat4 perspective(float fovy, float aspect, float far, float near){
    float top = tan(radians(fovy) * 0.5) * near;
    float bottom = -top;
    float right = top * aspect;
    float left = -right;
    return perspective(far, near, right, left, top, bottom);
}

mat4 perspective(float far, float near, float right, float left, float top, float bottom){
    mat4 m = mat4(0.);
    float fmn = 1. / (far - near);
    float rml = 1. / (right - left);
    float tmb = 1. / (top - bottom);
    m[0][0] = 2. * near * rml;    
    m[0][2] = (right + left) * rml;    
    m[1][1] = 2. * near * tmb;
    m[1][2] = (top + bottom) * tmb;
    m[2][2] = - (far + near) * fmn;
    m[2][3] = - 2. * far * near * fmn;    
    m[3][2] = - 1.;
    
    if(COLUMN_MAJOR)
        return m;
    else
        return transpose(m);    
}


//-------- Meshes -------//
// Dynamic meshes that can be simultaneously rendered.
// As they are dinamically created, don't make them too large!

#define MAX_VERTEX_COUNT 63

struct Mesh{
    int count;
    vec3[MAX_VERTEX_COUNT] vertices;
    vec2[MAX_VERTEX_COUNT] texCoords;
};

Mesh makeDelta3(){
    vec3 v0 = vec3(0., 0., 0.);
    vec3 v1 = vec3(1., 0., 0.);
    vec3 v2 = vec3(0., 1., 0.);
    vec3 v3 = vec3(0., 0., 1.);
    
    vec3[MAX_VERTEX_COUNT] vertices;
    // [v1, v2, v3]
    vertices[0] = v1;
    vertices[1] = v2;
    vertices[2] = v3;
    
    // -[v0,v2,v3]
    vertices[3] = v0;
    vertices[4] = v3;
    vertices[5] = v2;
    
    // [v0, v1, v3]
    vertices[6] = v0;
    vertices[7] = v1;
    vertices[8] = v3;
    
    // -[v0, v1, v2]
    vertices[9] = v0;
    vertices[10] = v2;
    vertices[11] = v1;
    
    vec2[MAX_VERTEX_COUNT] uvs;
    uvs[0] = vec2(0., 1.);
    uvs[1] = vec2(1., 1.);
    uvs[2] = vec2(0., 0.);
    
    uvs[3] = vec2(0., 0.);
    uvs[4] = vec2(1., 1.);
    uvs[5] = vec2(1., 0.);
    
    uvs[6] = vec2(0., 1.);
    uvs[7] = vec2(1., 1.);
    uvs[8] = vec2(.5, 0.);
    
    uvs[9] = vec2(0., 1.);
    uvs[10] = vec2(1., 1.);
    uvs[11] = vec2(.5, 0.);

    return Mesh(12, vertices, uvs);
}

Mesh makePyramid(){
    vec3 v0 = vec3(0.5, 0.0,  0.5);
    vec3 v1 = vec3(-0.5, 0.0,  0.5);
    vec3 v2 = vec3( 0.5, 0.0, -0.5);
    vec3 v3 = vec3(-0.5, 0.0, -0.5);
    vec3 v4 = vec3(0.0, 1.0,  0.0);
    
    vec3[MAX_VERTEX_COUNT] vertices;
    vertices[0] = v3;
    vertices[1] = v2;
    vertices[2] = v1;
    
    vertices[3] = v1;
    vertices[4] = v2;
    vertices[5] = v0;
    
    vertices[6] = v3;
    vertices[7] = v2;
    vertices[8] = v4;
    
    vertices[9] = v1;
    vertices[10] = v0;
    vertices[11] = v4;
    
    vertices[12] = v3;
    vertices[13] = v1;
    vertices[14] = v4;
    
    vertices[15] = v2;
    vertices[16] = v0;
    vertices[17] = v4;
    
    vec2[MAX_VERTEX_COUNT] uvs;
    uvs[0] = vec2(0., 1.);
    uvs[1] = vec2(1., 1.);
    uvs[2] = vec2(0., 0.);
    
    uvs[3] = vec2(0., 0.);
    uvs[4] = vec2(1., 1.);
    uvs[5] = vec2(1., 0.);
    
    uvs[6] = vec2(0., 1.);
    uvs[7] = vec2(1., 1.);
    uvs[8] = vec2(.5, 0.);
    
    uvs[9] = vec2(0., 1.);
    uvs[10] = vec2(1., 1.);
    uvs[11] = vec2(.5, 0.);
    
    uvs[12] = vec2(0., 1.);
    uvs[13] = vec2(1., 1.);
    uvs[14] = vec2(.5, 0.);
    
    uvs[15] = vec2(0., 1.);
    uvs[16] = vec2(1., 1.);
    uvs[17] = vec2(.5, 0.);
  
    return Mesh(18, vertices, uvs);
}

Mesh makeTorus() {
    vec2[MAX_VERTEX_COUNT] uvs;
    for(int i=0;i<MAX_VERTEX_COUNT;i++){
        int m = i%3;
        if(m == 0)
            uvs[i] = vec2(0., 0.);
        else if(m == 1)
            uvs[i] = vec2(1., 0.);
        else
            uvs[i] = vec2(0., 1.);
    }

    vec3 v0 = vec3(0., 0., 1.);
    vec3 v1 = vec3(1., 0., 1. + sqrt(3.));
    vec3 v2 = vec3(-1., 0., 1. + sqrt(3.));
     
    vec3 v3 = rotX(v0, 120.);
    vec3 v4 = rotX(v1, 120.);
    vec3 v5 = rotX(v2, 120.);

    vec3 v6 = rotX(v0, 240.);
    vec3 v7 = rotX(v1, 240.);
    vec3 v8 = rotX(v2, 240.);
    
    
    vec3[MAX_VERTEX_COUNT] vertices;
    
    // First three triangles
    vertices[0] = v0;
    vertices[1] = v1;
    vertices[2] = v2;
    
    vertices[3] = v3;
    vertices[4] = v5;
    vertices[5] = v4;
    
    vertices[6] = v6;
    vertices[7] = v7;
    vertices[8] = v8;
    
    // Connecting triangle1 and triangle2
    // Front half
    //Small
    vertices[9] = v0;
    vertices[10] = v3;
    vertices[11] = v2;
    //Large
    vertices[12] = v3;
    vertices[13] = v5;
    vertices[14] = v2;
    
    // Front half
    vertices[15] = v0;
    vertices[16] = v1;
    vertices[17] = v3;
    
    vertices[18] = v3;
    vertices[19] = v1;
    vertices[20] = v4;

    // Connecting triangle1 and triangle3
    // Front half
    //Small
    vertices[21] = v2;
    vertices[22] = v6;
    vertices[23] = v0;
    //Large
    vertices[24] = v8;
    vertices[25] = v6;
    vertices[26] = v2;
    
    // Front half
    vertices[27] = v6;
    vertices[28] = v1;
    vertices[29] = v0;
    
    vertices[30] = v6;
    vertices[31] = v7;
    vertices[32] = v1;
    
    // Connecting triangle2 and triangle3
    // Front half
    //Small
    vertices[33] = v3;
    vertices[34] = v6;
    vertices[35] = v5;
    //Large
    vertices[36] = v6;
    vertices[37] = v8;
    vertices[38] = v5;
    
    // Front half
    vertices[39] = v3;
    vertices[40] = v4;
    vertices[41] = v6;
    
    vertices[42] = v6;
    vertices[43] = v4;
    vertices[44] = v7;

    // Back faces
    // t1 and t2
    vertices[45] = v1;
    vertices[46] = v5;
    vertices[47] = v4;
    
    vertices[48] = v1;
    vertices[49] = v2;
    vertices[50] = v5;
    
    // t1 and t3
    vertices[51] = v7;
    vertices[52] = v2;
    vertices[53] = v1;
    
    vertices[54] = v7;
    vertices[55] = v8;
    vertices[56] = v2;
    
    // t2 and t3
    vertices[57] = v4;
    vertices[58] = v5;
    vertices[59] = v7;
    
    vertices[60] = v5;
    vertices[61] = v8;
    vertices[62] = v7;

    return Mesh(63, vertices, uvs);
}

Mesh makeCylinder(){
    vec3[MAX_VERTEX_COUNT] vertices;
    vertices[0] = vec3(0., 0., 0.);
    vertices[1] = vec3(-1., 0., 0.);
    vertices[2] = vec3(0., 1., 0.);
    
    vertices[3] = vec3(-1., 0., 0.);
    vertices[4] = vec3(-1., 1., 0.);
    vertices[5] = vec3(0., 1., 0.);
    
    vertices[6] = vec3(0., 0., 1.);
    vertices[7] = vec3(-1., 0., 1.);
    vertices[8] = vec3(0., 1., 1.);
    
    vertices[9] = vec3(-1., 0., 1.);
    vertices[10] = vec3(-1., 1., 1.);
    vertices[11] = vec3(0., 1., 1.);
    
    vertices[12] = vec3(0., 0., 0.);
    vertices[13] = vec3(-1., 0, 1.);
    vertices[14] = vec3(0., 0., 1.);
    
    vertices[15] = vec3(0., 0., 0.);
    vertices[16] = vec3(-1., 0, 1.);
    vertices[17] = vec3(-1., 0., 0.);
    
    vertices[18] = vec3(0., 1., 0.);
    vertices[19] = vec3(-1., 1, 1.);
    vertices[20] = vec3(0., 1., 1.);
    
    vertices[21] = vec3(0., 1., 0.);
    vertices[22] = vec3(-1., 1, 1.);
    vertices[23] = vec3(-1., 1., 0.);
    
    vec2[MAX_VERTEX_COUNT] uvs;
    uvs[0] = vec2(0., 0.);
    uvs[1] = vec2(1., 0.);
    uvs[2] = vec2(0., 1.);
    
    uvs[3] = vec2(0., 0.);
    uvs[4] = vec2(1., 0.);
    uvs[5] = vec2(0., 1.);
    
    uvs[6] = vec2(0., 0.);
    uvs[7] = vec2(1., 0.);
    uvs[8] = vec2(0., 1.);
    
    uvs[9] = vec2(0., 0.);
    uvs[10] = vec2(1., 0.);
    uvs[11] = vec2(0., 1.);
    
    uvs[12] = vec2(0., 0.);
    uvs[13] = vec2(1., 0.);
    uvs[14] = vec2(0., 1.);
    
    uvs[15] = vec2(0., 0.);
    uvs[16] = vec2(1., 0.);
    uvs[17] = vec2(0., 1.);
    
    uvs[18] = vec2(0., 0.);
    uvs[19] = vec2(1., 0.);
    uvs[20] = vec2(0., 1.);
    
    uvs[21] = vec2(0., 0.);
    uvs[22] = vec2(1., 0.);
    uvs[23] = vec2(0., 1.);
    
    
    return Mesh(24, vertices, uvs);
}

//-------- Lights -------//
#define LIGHTS_COUNT 3

struct LightArray{
    int count;
    vec3[LIGHTS_COUNT] lights;
    float[LIGHTS_COUNT] intensities;
    vec3[LIGHTS_COUNT] colors;
};

LightArray sceneLights(){
    vec3[LIGHTS_COUNT] lights;
    lights[0] = vec3(0.);
    lights[1] = vec3(2.);
    lights[2] = vec3(-2.);
    
    float[LIGHTS_COUNT] intensities;
    intensities[0] = 3.;
    intensities[1] = 2.;
    intensities[2] = 1.;
    
    vec3[LIGHTS_COUNT] colors;
    colors[0] = vec3(1., 0., 0.);
    colors[1] = vec3(0., 1., 0.);
    colors[2] = vec3(0., 0., 1.);

    return LightArray(3, lights, intensities, colors);
}

#define ADD_EDGES true
#define JUST_EDGES false
#define EDGE_LEN 0.04
#define RETURN_Z_BUFFER false
#define Z_BUFFER_CONTRAST 50.
#define RETURN_RASTER_TRIANGLES false
#define RETURN_ORIENTATIONS true
#define RETURN_UV true
#define RETURN_NORMAL false
#define RETURN_SHADES false
#define RETURN_TEXTURIZED false

#define SHOW_TORUS true

vec4 vertexShader(vec3 vertex, mat4 transform){
    if(COLUMN_MAJOR)
        return vec4(vertex, 1.) * transform;
    else
        return transform * vec4(vertex, 1.);
}

vec4 fragmentShader(sampler2D tex, vec2 uv){
    return texture(tex, uv);
}

#define CAM_DIST 3.
const float fovy = 70.;
const float near = 0.05;
const float far = 10.;
const vec3 cameraPos = vec3(0., 0., 2.);

bool outRng(vec3 tri){
    return tri.x < 0. || tri.x > 1. || tri.y < 0. || tri.y > 1. || tri.z < 0. || tri.z > 1.;
}

vec3 shading(LightArray lights, in vec3 normal, in vec3 p0, in vec3 p1, in vec3 p2,
              in float depth, in vec3 triCoords, in vec4 v0, in vec4 v1, in vec4 v2){
    vec3 shades = vec3(0.);
    
    for(int i=0;i<lights.count;i++){
        vec3 light = lights.lights[i];
        float intensity = lights.intensities[i];
        vec3 color = lights.colors[i];
        
        // p02l = p0 to light
        vec3 p02l = light - p0;
        vec3 p12l = light - p1;
        vec3 p22l = light - p2;
        
        shades += color * intensity * max(0., depthLerp(depth, triCoords,
                                dot(normalize(p02l), normal) / (length(p02l) + 1e-5), 
                                dot(normalize(p12l), normal) / (length(p12l) + 1e-5),
                                dot(normalize(p22l), normal) / (length(p22l) + 1e-5),
                                v0, v1, v2));
    }
    return shades;
}

vec4 pixel(in vec2 ndc, in float aspect, out float depth, in Mesh mesh, in int vertexIdx,
           in sampler2D tex, LightArray lights){
    float xRot = 25.;
    float yRot = 45.+ u_time * 20.;
    if(u_mouse.xy != vec2(0.)) {
        xRot = -100. + (u_mouse.y * 150. / u_resolution.y);
        yRot = u_mouse.x * 360. / u_resolution.x;
    }

    mat4 proj = perspective(fovy, aspect, far, near);
    mat4 view = translate(-CAM_DIST * cameraPos);
    
    mat4 rot;
    if(COLUMN_MAJOR)
        rot = rotX(xRot) * rotY(yRot);
    else
        rot = rotX(xRot) * rotY(yRot);

    mat4 transf;
    if(COLUMN_MAJOR)
        transf = rot * view * proj;
    else
        transf = proj * view * rot;    
    
    vec3 p0 = mesh.vertices[vertexIdx];
    vec3 p1 = mesh.vertices[vertexIdx + 1];
    vec3 p2 = mesh.vertices[vertexIdx + 2];
    
    vec4 v0 = vertexShader(p0, transf);
    vec4 v1 = vertexShader(p1, transf);
    vec4 v2 = vertexShader(p2, transf);
    
    vec2 t0 = mesh.texCoords[vertexIdx];
    vec2 t1 = mesh.texCoords[vertexIdx + 1];
    vec2 t2 = mesh.texCoords[vertexIdx + 2];

    // Go back to cartesian coordinates (view and rot don't change w,
    // but proj does, so that this is neccessary):
    v0 /= v0.w;
    v1 /= v1.w;
    v2 /= v2.w;
    
    vec3 triCoords = barycentric(ndc, v0.xy/v0.z, v1.xy/v1.z, v2.xy/v2.z);
    if (outRng(triCoords)) 
        return vec4(0.);
    
    float opz = triCoords.x / v0.z + triCoords.y / v1.z + triCoords.z / v2.z;
    float correctDepth = 1./opz; 
    if(correctDepth > depth || correctDepth < -1. || correctDepth > 1.)
        return vec4(0.);    
    
    depth = correctDepth;
    
    vec3 correctTriCoords = depthLerp(depth, triCoords, 
                                        vec3(1.,0.,0.), vec3(0,1.,0.), vec3(0.,0.,1.),
                                        v0, v1, v2);
    vec2 uv = depthLerp(depth, triCoords, t0, t1, t2, v0, v1, v2);
    vec3 normal = normalize(cross(p1 - p0, p2 - p0));
    vec3 shades = shading(lights, normal, p0, p1, p2,
                           depth, triCoords, v0, v1, v2);
            
    if(ADD_EDGES){
        //if(triCoords.x < EDGE_LEN || triCoords.y < EDGE_LEN || triCoords.z < EDGE_LEN )
        if(correctTriCoords.x < EDGE_LEN || correctTriCoords.y < EDGE_LEN || correctTriCoords.z < EDGE_LEN )
            // If you put alpha equal to 1 here, no matter EDGE_LEN nothing
            // will show if the edges are black. If edges aren't black, it works fine.
            // It also worked with const vertices and uvs, but not with meshe structs. 
            // Don't ask me why.
            return vec4(0.,0.,0., 0.999); 
        if(JUST_EDGES)
            return vec4(0.);
    }
    if(RETURN_Z_BUFFER)
        return vec4(vec3(pow(depth, Z_BUFFER_CONTRAST)), 1.);
    if(RETURN_RASTER_TRIANGLES)
        return vec4(triCoords, 1.);
    if(RETURN_ORIENTATIONS)
        return vec4(correctTriCoords, 1.);
    if(RETURN_UV)
        return vec4(uv, 0., 1.);
    if(RETURN_NORMAL)
        return vec4(normal, 1.);
    if(RETURN_SHADES)
        return vec4(vec3(shades), 1.);
        
    vec4 frag = fragmentShader(tex, uv);
    if(RETURN_TEXTURIZED)
        return frag;
    return vec4(fragmentShader(tex, uv).xyz*shades, 1.);
}

void renderMesh(in vec2 ndc, in float aspect, out vec3 outCol, out float depth, in Mesh mesh,
                in sampler2D tex, LightArray lights){
    for(int i=0; i < mesh.count; i+=3){
      vec4 triCol = pixel(ndc, aspect, depth, mesh, i, tex, lights);
      outCol = mix(outCol.rgb, triCol.rgb, triCol.a);
     }
}

const vec3 backgroundCol = vec3(.4,.6,.9);

out vec4 fragColor;
void main()
{
    vec2 ndc = 2.*gl_FragCoord.xy/u_resolution.xy - vec2(1);
    float aspect = u_resolution.x / u_resolution.y;
    vec3 outCol = backgroundCol;
    
    float depth = 1000.;
    LightArray lights = sceneLights();
    
    if(SHOW_TORUS)
        renderMesh(ndc, aspect, outCol, depth, makeTorus(), u_tex0, lights);
    else
        renderMesh(ndc, aspect, outCol, depth, makeDelta3(), u_tex0, lights);
    
    fragColor = vec4(outCol, 1.);
}