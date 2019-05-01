#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
//#define DEBUG
#define TEST
uniform vec2 resolution;
uniform vec2 cameraAddent;
uniform mat2 cameraOrientation;
uniform samplerExternalOES cameraBack;
uniform float time;
uniform vec2 touch;
uniform vec3 pointers[10];
vec3 grey = vec3(0.5);
//vec3 grey = vec3(0.1,0.7,0.78);
float g = 13.;

vec3 bg(vec2 st) {
	return vec3(texture2D(cameraBack, st).rgb);
}

vec3 bw(vec3 col){
	 return vec3(col.r+col.g+col.b) /3.;
}

vec3 degrade(vec3 col){
	vec3 nc;
	if(col.r<0.4)
	  nc=vec3(0.);
	 else if(col.r<.65)
	  nc= grey;
	 else
	 	nc=vec3(1.);

	return nc;
}

vec3 pixelate(vec2 uv){
		float dx= g/resolution.x;
		float dy= g/resolution.y;
		float x= dx*floor(uv.x/dx);
		float y= dy*floor(uv.y/dy);

		vec2 k = vec2(x,y);
		vec2 p = cameraAddent + k * cameraOrientation;
		return bg(p);

}

void main(void) {
	vec2 uv = gl_FragCoord.xy / resolution.xy;
	vec2 st = cameraAddent + uv * cameraOrientation;
	vec3 col=pixelate(uv);
  col = degrade(bw(col));

#ifdef DEBUG
if(st.x>0.33 && st.x<0.66) col = bg(st);
if(st.x>0.66) col = bw(bg(st));
#endif
//if(col==grey){
//	col.b = mix(0.0,0.7,1.0-length(st.xy))
//}


	 gl_FragColor =vec4(col,1.);
}
