// Author: sky leilani
// Title: mandelbrot based fuck lol 

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
uniform int maxiter;

void main() {
    
  vec2 c = (gl_FragCoord.xy/u_resolution.y - 0.5);
    c.x -= 1.25;
    
    vec2 z = c;
    vec2 zn;
    
    float t = u_time;
    
    for(float i=0.0; i< 2048.0; i+=1.0){
        if(zn.x*zn.x + zn.y * zn.y > 4.0) { 
        gl_FragColor=vec4(
        (1.0 + sin(z.x + t*.2))/.8,
        (1.0+cos(z.y - t*0.))/.000005,
        (1.0+sin(i*1.0 - t*0.9))/2.0,
            1.0);
            break;
        } else {
            zn.x = z.x * z.x - z.y*z.y + c.x;
            zn.y = 1.5 * z.x  * z.y + c.y;
            z = zn + vec2(1500);
        }
    }
}


