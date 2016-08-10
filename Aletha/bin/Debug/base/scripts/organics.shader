//**********************************************************************//
//	organics.shader sorted and cleaned up for Q3Radiant		//
//	by Eutectic - 22 Jan 2000					//
//	Phase 2 update: 13 May 2000					//
//									//
//	TOTAL SHADERS: 3						//
//	NO. OF BROKEN SHADERS/COMMENTED OUT: 1				//
//	NO. OF WORKING SHADERS WITH DUPLICATE ENTRIES: 0		//
//	NO. OF WORKING SHADERS THAT DIDN'T APPEAR IN EDITOR: 0		//
//	SHADERS THAT DIDN'T BELONG HERE AND MOVED TO PROPER FILE: 0	//
//	SHADERS THAT BELONGED HERE BUT WERE IN ANOTHER FILE: 1		//
//	textures/organics/dirt_trans					//
//**********************************************************************//

textures/organics/dirt_trans
{
	qer_editorimage textures/organics/dirt.tga
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	
	}
	{
		map textures/organics/dirt.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO

	
	}
}

//******************************************************//
//	organics/wire02_f2				//
//	doesn't work: commented out 			//
//******************************************************//

//textures/organics/wire02_f2	
//{
//	light 1	
//q3map_surfacelight 400
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/organics/wire02_f2.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//}

//******************************************************//
//	Phase 2 cleanup					//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/organics/wire02a_f	
{
//	light 1	
	q3map_surfacelight 200
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/organics/wire02a_f.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

