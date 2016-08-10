//**********************************************************************//
//	gothic_wall.shader sorted and cleaned up for Q3Radiant		//
//	by Eutectic - 22 Jan 2000					//
//	Phase 2 update: 13 May 2000					//
//									//
//	TOTAL SHADERS: 24						//
//	NO. OF BROKEN SHADERS/COMMENTED OUT: 18				//
//	NO. OF WORKING SHADERS WITH DUPLICATE ENTRIES: 0		//
//	NO. OF WORKING SHADERS THAT DIDN'T APPEAR IN EDITOR: 0		//
//	SHADERS THAT DIDN'T BELONG HERE AND MOVED TO PROPER FILE: 1	//
//	textures/gothic_door/door02_i_ornate5_fin			//
//	SHADERS THAT BELONGED HERE BUT WERE IN ANOTHER FILE: 1		//
//	textures/gothic_wall/window_evil6a				//
//**********************************************************************//

//******************************************************//
//	gothic_wall/glass_stained1			//
//	gothic_wall/iron01_f				//
//	gothic_wall/iron01_f2				//
//	gothic_wall/iron01_k				//
//	gothic_wall/iron01_l				//
//	gothic_wall/iron01_l2				//
//	gothic_wall/iron01_l4				//
//	don't work: commented out 			//
//******************************************************//

//textures/gothic_wall/glass_stained1
//
//{
//
//	surfaceparm trans
//	qer_editorimage	textures/gothic_wall/glass_stained1.tga
//
//	
//	
//
//	{
//		map textures/gothic_wall/glass_stained1.tga
//		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		rgbGen identity
//	}
//	
//
//}

//textures/gothic_wall/iron01_f
//{
//	qer_editorimage textures/gothic_wall/iron01_f.tga
//	{
//		map $lightmap
//		rgbgen identity      
//	}
//	
//	{
//		map textures/gothic_wall/iron01_f.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

//textures/gothic_wall/iron01_f2
//{
//	qer_editorimage textures/gothic_wall/iron01_f2.tga
//	{
//		map $lightmap
//		rgbgen identity      
//	}
//	
//	{
//		map textures/gothic_wall/iron01_f2.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

//textures/gothic_wall/iron01_k
//{
//	qer_editorimage textures/gothic_wall/iron01_k.tga
//	{
//		map $lightmap
//		rgbgen identity      
//	}
//	
//	{
//		map textures/gothic_wall/iron01_k.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

//textures/gothic_wall/iron01_l
//{
//	qer_editorimage textures/gothic_wall/iron01_l.tga
//	{
//		map $lightmap
//		rgbgen identity      
//	}
//	
//	{
//		map textures/gothic_wall/iron01_l.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

//textures/gothic_wall/iron01_l2
//{
//	qer_editorimage textures/gothic_wall/iron01_l2.tga
//	{
//		map $lightmap
//		rgbgen identity      
//	}
//	
//	{
//		map textures/gothic_wall/iron01_l2.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

//textures/gothic_wall/iron01_l4
//{
//	qer_editorimage textures/gothic_wall/iron01_l4.tga
//	{
//		map $lightmap
//		rgbgen identity      
//	}
//	
//	{
//		map textures/gothic_wall/iron01_l4.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

textures/gothic_wall/iron01_m
{
	qer_editorimage textures/gothic_wall/iron01_m.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_m.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

//******************************************************//
//	gothic_wall/iron01_m2				//
//	gothic_wall/iron01_m3				//
//	gothic_wall/iron01_m_circles			//
//	gothic_wall/iron01_mtech2			//
//	gothic_wall/iron01_mthin			//
//	gothic_wall/iron01_n				//
//	gothic_wall/iron01_n_circles			//
//	don't work: commented out 			//
//******************************************************//

//textures/gothic_wall/iron01_m2
//{
//	qer_editorimage textures/gothic_wall/iron01_m2.tga
//	{
//		map $lightmap
//		rgbgen identity      
//	}
//	
//	{
//		map textures/gothic_wall/iron01_m2.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

//textures/gothic_wall/iron01_m3
//{
//	qer_editorimage textures/gothic_wall/iron01_m3.tga
//	{
//		map $lightmap
//		rgbgen identity      
//	}
//	
//	{
//		map textures/gothic_wall/iron01_m3.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

//textures/gothic_wall/iron01_m_circles
//{
//	qer_editorimage textures/gothic_wall/iron01_m_circles.tga
//	{
//		map $lightmap
//		rgbgen identity      
//	}
//	
//	{
//		map textures/gothic_wall/iron01_m_circles.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

//textures/gothic_wall/iron01_mtech2
//{
//	qer_editorimage textures/gothic_wall/iron01_mtech2.tga
//	{
//		map $lightmap
//		rgbgen identity      
//	}
//	
//	{
//		map textures/gothic_wall/iron01_mtech2.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

//textures/gothic_wall/iron01_mthin
//{
//	qer_editorimage textures/gothic_wall/iron01_mthin.tga
//	{
//		map $lightmap
//		rgbgen identity      
//	}
//	
//	{
//		map ttextures/gothic_wall/iron01_mthin.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

//textures/gothic_wall/iron01_n
//{
//	qer_editorimage textures/gothic_wall/iron01_n.tga
//	{
//		map $lightmap
//		rgbgen identity      
//	}
//	
//	{
//		map textures/gothic_wall/iron01_n.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

//textures/gothic_wall/iron01_n_circles
//{
//	qer_editorimage textures/gothic_wall/iron01_n_circles.tga
//	{
//		map $lightmap
//		rgbgen identity      
//	}
//	
//	{
//		map textures/gothic_wall/iron01_n_circles.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

textures/gothic_wall/iron01_ndark
{
	qer_editorimage textures/gothic_wall/iron01_ndark.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_ndark.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

//******************************************************//
//	gothic_wall/iron01_ndark_circles		//
//	gothic_wall/iron01_ntech			//
//	gothic_wall/iron01_ntech2			//
//	don't work: commented out 			//
//******************************************************//

//textures/gothic_wall/iron01_ndark_circles
//{
//	qer_editorimage textures/gothic_wall/iron01_ndark_circles.tga
//	{
//		map $lightmap
//		rgbgen identity      
//	}
//	
//	{
//		map textures/gothic_wall/iron01_ndark_circles.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

//textures/gothic_wall/iron01_ntech
//{
//	qer_editorimage textures/gothic_wall/iron01_ntech.tga
//	{
//		map $lightmap
//		rgbgen identity      
//	}
//	
//	{
//		map textures/gothic_wall/iron01_ntech.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

//textures/gothic_wall/iron01_ntech2
//{
//	qer_editorimage textures/gothic_wall/iron01_ntech2.tga
//	{
//		map $lightmap
//		rgbgen identity      
//	}
//	
//	{
//		map textures/gothic_wall/iron01_ntech2.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

//******************************************************//
//	gothic_wall/streetbricks10_shiny		//
//	was showing no texmap: added qer_editorimage	//
//	Phase 2 cleanup					//
//	obsolete or inactive keywords commented out:	//
//	tcmod turb sin .1 .1 0 0			//
//******************************************************//

textures/gothic_wall/streetbricks10_shiny
{
	qer_editorimage textures/gothic_wall/streetbricks11.tga
	q3map_globaltexture
	sort opaque

	{
		map $lightmap 
//		tcmod turb sin .1 .1 0 0
		tcmod scale 2 2
		rgbgen identity
	}

	{
		map textures/gothic_wall/streetbricks11.tga
		rgbGen identity
		blendfunc gl_one gl_src_color
	}
	
	{
		map $lightmap 
		blendfunc gl_dst_color gl_zero
		rgbgen identity
	}


}

textures/gothic_wall/window_evil6a

{
	q3map_lightimage textures/gothic_wall/window_evil6a_glow.tga
	q3map_surfacelight 50
	//light 1

	{
		map $lightmap
		rgbGen identity
	}
	
	{
		map textures/gothic_wall/window_evil6a.tga
		blendfunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	{
		map textures/gothic_wall/window_evil6a_glow.tga
		blendfunc GL_ONE GL_ONE
		rgbGen identity
	}
	
}

//******************************************************//
//	gothic_wall/window_evil7			//
//	doesn't work: commented out 			//
//******************************************************//

//textures/gothic_wall/window_evil7
//
//{
//	q3map_lightimage textures/gothic_wall/window_evil7_glow.tga
//	q3map_surfacelight 300
//	//light 1
//
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	
//	{
//		map textures/gothic_wall/window_evil7.tga
//		blendfunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//
//	{
//		map textures/gothic_wall/window_evil7_glow.tga
//		blendfunc GL_ONE GL_ONE
//		rgbGen identity
//	}
//	
//}

textures/gothic_wall/xoct20c_shiney
{
	qer_editorimage textures/gothic_wall/xoct20c_shiney.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/xoct20c_shiney.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/xpipecolumn_gray_shiny
{   
 
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/gothic_wall/xpipecolumn_gray_shiny.tga
                blendFunc blend
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

