//
// Simple passthrough fragment shader
//
/*	
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

vec2 distort(vec2 r, float alpha)
{
    return r * -alpha * (1.0 - dot(r, r));
   
}

void main()
{
	vec2 uv = vec2(v_vTexcoord.x, v_vTexcoord.y);
    vec2 v = (uv - vec2(.5, .5));
    
    float amount = 0.1;
        
    uv = uv + distort(v,amount);
	gl_FragColor = v_vColour * texture2D(gm_BaseTexture,uv);
}
