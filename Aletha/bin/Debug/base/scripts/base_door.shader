//**********************************************************************//
//	base_door.shader created from scratch for Q3Radiant		//
//	by Eutectic - 19 Jan 2000					//
//									//
//	TOTAL SHADERS: 5						//
//	NO. OF BROKEN SHADERS/COMMENTED OUT: 2				//
//	NO. OF WORKING SHADERS WITH DUPLICATE ENTRIES: 0		//
//	NO. OF WORKING SHADERS THAT DIDN'T APPEAR IN EDITOR: 0		//
//	SHADERS THAT DIDN'T BELONG HERE AND MOVED TO PROPER FILE: 0	//
//	SHADERS THAT BELONGED HERE BUT WERE IN ANOTHER FILE: 5		//
//	textures/base_door/shinymetaldoor				//
//	textures/base_door/shinymetaldoor_outside			//
//	textures/base_door/shinymetaldoor_outside3a			//
//	textures/base_door/shinymetaldoor_outside3a2			//
//	textures/base_door/shinymetaldoor_outside3b			//
//**********************************************************************//

textures/base_door/shinymetaldoor
{

	{
		//map $lightmap
		map textures/base_wall/chrome_env.tga
                tcGen environment
		tcmod scale .25 .25 
		rgbGen identity   
	}

		
	{
		map textures/base_door/shinymetaldoor.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map textures/base_door/quake3sign.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}	
		
} 

textures/base_door/shinymetaldoor_outside
{

	{
		map textures/base_wall/chrome_env.tga
                tcGen environment
		tcmod scale .25 .25 
		rgbGen identity   
	}

		
	{
		map textures/base_door/shinymetaldoor_outside.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map textures/base_door/quake3sign_outside.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}	
		
} 

//******************************************************//
//	base_door/shinymetaldoor_outside3a		//
//	doesn't work: commented out 			//
//******************************************************//

//textures/base_door/shinymetaldoor_outside3a
//{
//
//	{
//		map textures/base_wall/chrome_env.tga
//                tcGen environment
//		tcmod scale .25 .25 
//		rgbGen identity   
//	}
//
//		
//	{
//		map textures/base_door/shinymetaldoor_outside3a.tga
//		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
//		rgbGen identity
//	}
//
//
//	{
//		map $lightmap
//		rgbgen identity
//		blendFunc GL_DST_COLOR GL_ZERO
//	}	
//		
//} 

textures/base_door/shinymetaldoor_outside3a2
{

	{
		map textures/base_wall/chrome_env.tga
                tcGen environment
		tcmod scale .25 .25 
		rgbGen identity   
	}

		
	{
		map textures/base_door/shinymetaldoor_outside3a2.tga
		blendFunc blend
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc filter
	}

	{
		map textures/base_door/shinymetaldoor_outside3glow.tga
		blendFunc add
		rgbGen wave sin .9 .1 0 5
	}
		
} 

//******************************************************//
//	base_door/shinymetaldoor_outside3b		//
//	doesn't work: commented out 			//
//******************************************************//

//textures/base_door/shinymetaldoor_outside3b
//{
//
//	{
//		map textures/base_wall/chrome_env.tga
//                tcGen environment
//		tcmod scale .25 .25 
//		rgbGen identity   
//	}
//
//		
//	{
//		map textures/base_door/shinymetaldoor_outside3b.tga
//		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
//		rgbGen identity
//	}
//
//
//	{
//		map $lightmap
//		rgbgen identity
//		blendFunc GL_DST_COLOR GL_ZERO
//	}	
//		
//} 

