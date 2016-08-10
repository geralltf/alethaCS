
levelshots/sw_oasis_b3_cc_automap
{
	nopicmip
	nocompress
	nomipmaps
	{
		clampmap levelshots/sw_oasis_b3_cc.tga
		depthFunc equal
		rgbGen identity
	}
}

levelshots/sw_oasis_b3_cc_trans
{
	nopicmip
	nocompress
	nomipmaps
	{
		clampmap levelshots/sw_oasis_b3_cc.tga
		blendfunc blend
		rgbGen identity
		alphaGen vertex
	}
}

textures/sw_oasis/cm_tunneldoor_sign
{ 
   nopicmip 
   nocompress 
   nomipmaps 
   { 
      map textures/sw_oasis/tunneldoor_sign.tga 
      depthfunc equal 
      blendfunc blend 
      rgbGen vertex 
      alphaGen vertex 
   } 
}

textures/sfx/rivsflame1
{
	qer_editorimage textures/sfx/flame1.tga
//	q3map_surfacelight 1482
	cull none
	nofog
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm pointlight
	surfaceparm trans
	{
		animMap 10 textures/sfx/flame1.tga textures/sfx/flame2.tga textures/sfx/flame3.tga textures/sfx/flame4.tga textures/sfx/flame5.tga textures/sfx/flame6.tga textures/sfx/flame7.tga textures/sfx/flame8.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave inverseSawtooth 0 1 0 10
	}
	{
		animMap 10 textures/sfx/flame2.tga textures/sfx/flame3.tga textures/sfx/flame4.tga textures/sfx/flame5.tga textures/sfx/flame6.tga textures/sfx/flame7.tga textures/sfx/flame8.tga textures/sfx/flame1.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sawtooth 0 1 0 10
	}
	{
		map textures/sfx/flameball.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin .6 .2 0 .6
	}
}

textures/sw_oasis/zap_scroll
{
 //       q3map_surfacelight	300
        surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	
	{
		Map textures/sw_oasis/zap_scroll.tga
		blendFunc GL_ONE GL_ONE
                rgbgen wave triangle .8 2 0 7
                tcMod scroll 0 1
	}	
        {
		Map textures/sw_oasis/zap_scroll.tga
		blendFunc GL_ONE GL_ONE
                rgbgen wave triangle 1 1.4 0 5
                tcMod scale  -1 1
                tcMod scroll 0 1
	}	
        {
		Map textures/sw_oasis/zap_scroll2.tga
		blendFunc GL_ONE GL_ONE
                rgbgen wave triangle 1 1.4 0 6.3
                tcMod scale  -1 1
                tcMod scroll 2 1
	}	
        {
		Map textures/sw_oasis/zap_scroll2.tga
		blendFunc GL_ONE GL_ONE
                rgbgen wave triangle 1 1.4 0 7.7
                tcMod scroll -1.3 1
	}	
}