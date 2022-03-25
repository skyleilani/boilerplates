#ifdef GL_ES
precision highp float;
#endif
uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
float interpolate(float edge, float test)
{
float result=step(edge-0.0001,test)-step(edge+0.005,test);
return result;
}
void main()
{
    vec3 cols[9];
    cols[0]=vec3(0.800,1.000,0.696);
    cols[1]=vec3(1.000,0.885,0.816);
    cols[2]=vec3(1.000,0.723,0.526);
    cols[3]=vec3(1.0, 0.0, 0.0);
    cols[4]=vec3(0.9843, 1.0, 0.0);
    cols[5]=vec3(1.0, 0.5333, 0.0);
    cols[6]=vec3(1.0, 0.0, 0.0);
vec2 st=(gl_FragCoord.xy-0.5/u_resolution)/u_resolution;
vec2 
c=2.*(u_mouse/u_resolution);

vec2 z=st;
z*=3.;
z-=1.45;
//for over lays
float y[3];
y[0]=z.x;
y[1]=z.y;
int iter=0;
for(int i=0;i<100;i++)
{
    z=vec2(z.x*z.x - z.y*z.y+ c.x, 2. *z.x*z.y +c.y);
    if(length(z)>1.2)
    break;
    iter++;
}
float f=float(iter)/100.0;
vec3 bg_col=vec3(0.0, 0.0, 0.0);
vec3 col=bg_col+vec3(f);
if(f>=0. && f<=1./4.032)
cols[8]=cols[0];
if(f>1./3. && f<=1./2.)
cols[8]=cols[2];
if(f>1./2. && f<=1./1.)
cols[8]=cols[1];
col=mix(col,cols[8],f);

col+=interpolate(0.,y[0]);
col+=interpolate(0.,y[1]);
gl_FragColor=vec4(col,1);
}
