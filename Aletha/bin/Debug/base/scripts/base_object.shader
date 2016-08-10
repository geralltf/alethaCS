//**********************************************************************//
//	base_object.shader sorted and cleaned up for Q3Radiant		//
//	by Eutectic - 20 Jan 2000					//
//									//
//	TOTAL SHADERS: 7						//
//	NO. OF BROKEN SHADERS/COMMENTED OUT: 5				//
//	NO. OF WORKING SHADERS WITH DUPLICATE ENTRIES: 0		//
//	NO. OF WORKING SHADERS THAT DIDN'T APPEAR IN EDITOR: 0		//
//	SHADERS THAT DIDN'T BELONG HERE AND MOVED TO PROPER FILE: 0	//
//	SHADERS THAT BELONGED HERE BUT WERE IN ANOTHER FILE: 0		//
//**********************************************************************//

//******************************************************//
//	base_object/boxQ3_1				//
//	base_object/boxQ3_2				//
//	don't work: commented out 			//
//******************************************************//

//textures/base_object/boxQ3_1
//{
//	// A green box with a specular map on it
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_object/boxQ3_1.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

//textures/base_object/boxQ3_2
//{
//	// A silver box with a specular and a lightglow map on it
//	
//	q3map_surfacelight 200
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_object/boxQ3_2.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//	{
//		map textures/base_object/boxQ3_2.blend.tga
//		blendFunc GL_ONE GL_ONE
//		rgbGen wave sin 0.5 0.5 0 .2
//	}
//}

textures/base_object/boxQ3_3
{
	//	A red box side with a specular map on it
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_object/boxQ3_3.tga
		rgbGen identity
		alphaGen lightingSpecular
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
	}
}

textures/base_object/boxq3_4
{
	//	A golden yellow box with a specular map on it
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_object/boxq3_4.tga
		rgbGen identity
		alphaGen lightingSpecular
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
	}
}

//******************************************************//
//	base_object/hastesign_1				//
//	base_object/plasmalogo_1			//
//	base_object/quadsign_1				//
//	don't work: commented out 			//
//******************************************************//

//textures/base_object/hastesign_1
//{
//	qer_editorimage base_object/hastesign1.tga
//	q3map_lightimage textures/base_object/hastesign1.blend.tga
//	//surfaceparm nomarks
//	q3map_surfacelight 1000
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_object/hastesign1.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_object/hastesign1.blend.tga
//		rgbGen wave triangle 0.5 0.5 0.5 0.15
//		blendfunc GL_ONE GL_ONE
//	}
//
//}

//textures/base_object/plasmalogo_1
//{
//	q3map_lightimage textures/base_object/plasmalogo.tga
//	//surfaceparm nomarks
//	q3map_surfacelight 1000
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_object/plasmalogo_1.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_object/plasmalogo.tga
//		rgbGen wave triangle 0.5 0.5 0.5 0.15
//		blendfunc GL_ONE GL_ONE
//	}
//
//}

//textures/base_object/quadsign_1
//{
//	qer_editorimage base_object/quadsign1.tga
//	q3map_lightimage textures/base_object/quadsign1.blend.tga
//	//surfaceparm nomarks
//	q3map_surfacelight 1000
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_object/quadsign1.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_object/quadsign1.blend.tga
//		rgbGen wave triangle 0.5 0.5 0.5 0.15
//		blendfunc GL_ONE GL_ONE
//	}
//
//}

