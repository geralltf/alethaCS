//**********************************************************************//
//	gothic_button.shader created from scratch for Q3Radiant		//
//	by Eutectic - 21 Jan 2000					//
//									//
//	TOTAL SHADERS: 1						//
//	NO. OF BROKEN SHADERS/COMMENTED OUT: 0				//
//	NO. OF WORKING SHADERS WITH DUPLICATE ENTRIES: 0		//
//	NO. OF WORKING SHADERS THAT DIDN'T APPEAR IN EDITOR: 0		//
//	SHADERS THAT DIDN'T BELONG HERE AND MOVED TO PROPER FILE: 0	//
//	SHADERS THAT BELONGED HERE BUT WERE IN ANOTHER FILE: 1		//
//	textures/gothic_button/timbutton				//
//**********************************************************************//

textures/gothic_button/timbutton
{
	q3map_lightimage textures/gothic_button/timbutton2.tga
	q3map_surfacelight 10
	//light 1

	{
		map textures/gothic_button/timbutton.tga
	}


	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbgen identity
	}

	{
		map textures/gothic_button/timbutton2.tga
		blendfunc gl_one gl_one
		rgbgen wave sin .5 .5 0 1
	}

}

