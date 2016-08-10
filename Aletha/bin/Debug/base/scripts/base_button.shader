//**********************************************************************//
//	sky.shader sorted and cleaned up for Q3Radiant			//
//	by Eutectic - 18 Jan 2000					//
//	Phase 2 update: 13 May 2000					//
//									//
//	TOTAL SHADERS: 1						//
//	NO. OF BROKEN SHADERS/COMMENTED OUT: 0				//
//	NO. OF WORKING SHADERS WITH DUPLICATE ENTRIES: 0		//
//	NO. OF WORKING SHADERS THAT DIDN'T APPEAR IN EDITOR: 0		//
//	SHADERS THAT DIDN'T BELONG HERE AND MOVED TO PROPER FILE: 1	//
//	textures/base_light/btactmach0					//
//	SHADERS THAT BELONGED HERE BUT WERE IN ANOTHER FILE: 0		//
//**********************************************************************//

//******************************************************//
//	base_button/shootme2				//
//	was using inexistent TGA for editorimage	//
//	changed qer_editorimage	to more accurate	//
//	custom image: metal3_3_shootme.tga		//
//	Phase 2 cleanup					//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_button/shootme2
{
	qer_editorimage textures/base_button/metal3_3_shootme.tga
	q3map_lightimage textures/base_button/shootme_glow.tga
	q3map_surfacelight 1000
//	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_support/metal3_3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_button/shootme_glow.tga
		rgbGen wave sin 0.5 1.0 0 .3
		blendFunc GL_ONE GL_ONE
	}
}
