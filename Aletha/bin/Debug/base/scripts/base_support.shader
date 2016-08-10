//**********************************************************************//
//	base_support.shader sorted and cleaned up for Q3Radiant		//
//	by Eutectic - 20 Jan 2000					//
//	Phase 2 update: 13 May 2000					//
//									//
//	TOTAL SHADERS: 14						//
//	NO. OF BROKEN SHADERS/COMMENTED OUT: 4				//
//	NO. OF WORKING SHADERS WITH DUPLICATE ENTRIES: 0		//
//	NO. OF WORKING SHADERS THAT DIDN'T APPEAR IN EDITOR: 1		//
//	textures/base_support/support1rust				//
//	SHADERS THAT DIDN'T BELONG HERE AND MOVED TO PROPER FILE: 0	//
//	SHADERS THAT BELONGED HERE BUT WERE IN ANOTHER FILE: 0		//
//**********************************************************************//

textures/base_support/cable_trans
{
	
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	
	}
	{
		map textures/base_support/cable_trans.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO

	
	}
}

textures/base_support/grate1_3
{

	{
		map $lightmap
		rgbgen identity      
	}

	{
		map textures/base_support/grate1_3.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		alphaGen lightingSpecular
		rgbGen identity
	}
				
}

//******************************************************//
//	base_support/metal1_5				//
//	doesn't work: commented out 			//
//******************************************************//

//textures/base_support/metal1_5
//{
//	surfaceparm	metalsteps
//}

//******************************************************//
//	base_support/pj_metal14_1			//
//	was showing no texmap:				//
//	added qer_editorimage metal14_1.tga		//
//******************************************************//

textures/base_support/pj_metal14_1
//Paul Jaquays uses this on the tops of metal frameworks
{
	qer_editorimage textures/base_support/metal14_1.tga
	surfaceparm	metalsteps		

	// metal that makes metalsteps sound
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_support/metal14_1.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

//******************************************************//
//	base_support/shinysupport1			//
//	base_support/shinysupport2			//
//	don't work: commented out 			//
//******************************************************//

//textures/base_support/shinysupport1
//{
//
//	{
//		map $lightmap
//		tcgen environment
//		tcmod scale .25 .25
//		rgbgen identity      
//	}
//		
//	
//	{
//		map textures/base_support/shinysupport1.tga
//		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
//		rgbGen identity
//	}
//
//
//	{
//		map $lightmap
//    		rgbgen identity
//		blendFunc GL_DST_COLOR GL_ZERO
//	}
//
//			
//}

//textures/base_support/shinysupport2
//{
//
//	{
//		map textures/base_wall/chrome_env.tga
//		rgbgen identity      
//	}
//
//	{
//		map textures/base_support/shinysupport2.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		alphaGen lightingSpecular
//		rgbGen identity
//	}
//
//	{
//		map $lightmap
//		blendfunc gl_dst_color gl_zero
//		rgbgen identity      
//	}
//
//				
//}

textures/base_support/support1rust
{
	//deformVertexes wave 100 sin 3 2 .1 3
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_support/support1rust.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_trim/tinfx.tga
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
       
        {
		map textures/base_support/support1rust.tga
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/base_support/support1shiny
{   
    
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/base_support/support1shiny.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

//******************************************************//
//	base_support/support2rust			//
//	qer_editorimage keyword was "robbing"		//
//	support1rust.tga texmap from sourcename		//
//	shader base_support/support1rust: this	 	//
//	prevented it from loading in Q3R shader window	//
//	changed qer_editorimage	to custom image		//
//	support1rust_qer.tga				//
//	Phase 2 cleanup					//
//	texture robbing issues solved in Build189	//
//	support1rust_qer.tga no longer needed		//
//	changed qer_editorimage				//
//	back to support1rust.tga			//
//******************************************************//

textures/base_support/support2rust
{
	qer_editorimage textures/base_support/support1rust.tga
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_support/support1rust.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/base_support/x_support
{
	surfaceparm	metalsteps	
	surfaceparm trans	
	surfaceparm alphashadow
    surfaceparm nomarks	
	cull none
        nopicmip
	{
		map textures/base_support/x_support.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/base_support/x_support2
{
	surfaceparm	metalsteps	
    	surfaceparm trans	
	surfaceparm alphashadow
	surfaceparm playerclip
   	surfaceparm nonsolid
	surfaceparm nomarks	
	cull none
        nopicmip
	{
		map textures/base_support/x_support2.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/base_support/x_support3
{
	surfaceparm	metalsteps	
	surfaceparm trans	
	surfaceparm alphashadow
    surfaceparm nomarks	
	cull none
        nopicmip
	{
		map textures/base_support/x_support3.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

//******************************************************//
//	base_support/x_support4				//
//	doesn't work: commented out 			//
//******************************************************//

//textures/base_support/x_support4
//{
//	surfaceparm	metalsteps	
//	surfaceparm trans	
//	surfaceparm alphashadow
//    surfaceparm nomarks	
//	cull none
//        nopicmip
//	{
//		map textures/base_support/x_support4.tga
//		blendFunc GL_ONE GL_ZERO
//		alphaFunc GE128
//		depthWrite
//		rgbGen identity
//	}
//	{
//		map $lightmap
//		rgbGen identity
//		blendFunc GL_DST_COLOR GL_ZERO
//		depthFunc equal
//	}
//}

textures/base_support/z_support
{
	surfaceparm	metalsteps	
    surfaceparm trans	
	surfaceparm alphashadow
    surfaceparm nomarks	
	cull none
        nopicmip
	{
		map textures/base_support/z_support.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

