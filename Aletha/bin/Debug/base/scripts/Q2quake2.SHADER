textures/quake2/qdm/teleport
{
	surfaceparm	nonsolid
	surfaceparm	nolightmap
	q3map_surfacelight 600
	tesssize	128
	{
		map textures/quake2/qdm/teleport.tga
		blendfunc GL_ONE GL_ZERO
		tcMod turb 10 5 1 0.5
		rgbGen Identity
	}
}

textures/quake2/e1u1/wndow1_2
{
	surfaceparm nolightmap
	{
		map textures/quake2/e1u1/wndow1_2.tga
		blendfunc GL_ONE GL_SRC_ALPHA
	}
}

textures/quake2/e1u1/wndow0_1
{
	surfaceparm nolightmap
	{
		map textures/quake2/e1u1/wndow0_1.tga
		blendfunc GL_ONE GL_SRC_ALPHA
	}
}

textures/quake2/e1u2/wndow1_2
{
	surfaceparm nolightmap
	{
		map textures/quake2/e1u2/wndow1_2.tga
		blendfunc GL_ONE GL_SRC_ALPHA
	}
}

textures/quake2/e2u3/wndow1_2
{
	surfaceparm nolightmap
	{
		map textures/quake2/e2u3/wndow1_2.tga
		blendfunc GL_ONE GL_SRC_ALPHA
	}
}

textures/quake2/clearwater
{
		qer_editorimage textures/liquids/pool3d_3.tga
		qer_trans .5
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water

		cull disable
		deformVertexes wave 64 sin .5 .5 0 .5	
	
		
		{ 
			map textures/liquids/pool3d_5.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 1.5 0 1.5 1 1 2
			tcmod scroll -.05 .001
		}
	
		{ 
			map textures/liquids/pool3d_6.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 0 1.5 1 1.5 2 1
			tcmod scroll .025 -.001
		}

		{ 
			map textures/liquids/pool3d_3.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .25 .5
			tcmod scroll .001 .025
		}	


	}
textures/skies/justspace
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
      q3map_lightimage textures/skies/stars.tga
	q3map_sun	1 1 1 100 -58 58
	q3map_surfacelight 400

skyparms env/space1 - -
	}

textures/common/ladderclip
{
	qer_trans 0.40
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm playerclip
	surfaceparm noimpact
	surfaceparm ladder
}

