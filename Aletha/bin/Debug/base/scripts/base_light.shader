//**********************************************************************//
//	base_light.shader sorted and cleaned up for Q3Radiant		//
//	by Eutectic - 18 Jan 2000					//
//	Phase 2 update: 13 May 2000					//
//									//
//	TOTAL SHADERS: 114						//
//	NO. OF BROKEN SHADERS/COMMENTED OUT: 35				//
//	NO. OF WORKING SHADERS WITH DUPLICATE ENTRIES: 0		//
//	NO. OF WORKING SHADERS THAT DIDN'T APPEAR IN EDITOR: 9		//
//	textures/base_light/border11light				//
//	textures/base_light/ceil1_22a					//
//	textures/base_light/ceil1_30					//
//	textures/base_light/ceil1_34					//
//	textures/base_light/ceil1_38					//
//	textures/base_light/ceil1_39					//
//	textures/base_light/patch10_pj_lite2				//
//	textures/base_light/proto_light					//
//	textures/base_light/proto_lightred				//
//	SHADERS THAT DIDN'T BELONG HERE AND MOVED TO PROPER FILE: 0	//
//	SHADERS THAT BELONGED HERE BUT WERE IN ANOTHER FILE: 1		//
//	textures/base_light/btactmach0					//
//**********************************************************************//

//******************************************************//
//	base_light/baslt3_1_2K				//
//	doesn't work: commented out 			//
//******************************************************//

//textures/base_light/baslt3_1_2K
//{
//	qer_editorimage textures/base_light/baslt3_1.tga
//	surfaceparm nomarks
//	q3map_surfacelight 2000
//	//light 1
//
//	// Fluorescent light from Q2
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/baslt3_1.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/baslt3_1.blend.tga
//		blendfunc GL_ONE GL_ONE
//	}
//}

textures/base_light/baslt4_1_2k
{
	qer_editorimage textures/base_light/baslt4_1.tga
	surfaceparm nomarks
	q3map_surfacelight 2000
	//light 1

	// New Fluorescent light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/baslt4_1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/baslt4_1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/baslt4_1_4k
{
	qer_editorimage textures/base_light/baslt4_1.tga
	surfaceparm nomarks
	q3map_surfacelight 4000
	//light 1

	// New Fluorescent light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/baslt4_1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/baslt4_1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/border11light
{
	q3map_surfacelight 500	
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/border11light.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/border11light.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/border11light_300			//
//	qer_editorimage keyword was "robbing"		//
//	border11light.tga texmap from sourcename	//
//	shader base_light/border11light: this	 	//
//	prevented it from loading in Q3R shader window	//
//	changed qer_editorimage	to custom image		//
//	border11light_qer.tga				//
//	Phase 2 cleanup					//
//	texture robbing issues solved in Build189	//
//	border11light_qer.tga no longer needed		//
//	changed qer_editorimage				//
//	back to border11light.tga			//
//******************************************************//

textures/base_light/border11light_300
{
	qer_editorimage textures/base_light/border11light.tga
	q3map_lightimage textures/base_light/border11light.blend.tga

	q3map_surfacelight 235	
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/border11light.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/border11light.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/border7_ceil50
{
	qer_editorimage textures/base_light/border7_ceil50.tga
	q3map_surfacelight 100
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/border7_ceil50.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/border7_ceil50glow.tga
		blendfunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/btactmach0				//
//	base_light/ceil1_2				//
//	don't work: commented out 			//
//******************************************************//

//textures/base_light/btactmach0
//{
//	q3map_surfacelight 1000
//	light 1
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/btactmach0.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/btactmach0.blend.tga
//		rgbGen wave sin 0.5 0.5 0 .2
//		blendFunc GL_ONE GL_ONE
//	}
//}

//textures/base_light/ceil1_2
//{
//	surfaceparm nomarks
//	q3map_surfacelight 10000
//	light 1
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/ceil1_2.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/ceil1_2.blend.tga
//		blendfunc GL_ONE GL_ONE
//	}
//}

//******************************************************//
//	base_light/ceil1_22a				//
//	Phase 2 cleanup					//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/ceil1_22a
{
	surfaceparm nomarks
	q3map_surfacelight 10000
//	light 1
	//	A red-orange ceiling light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/ceil1_22a_8k				//
//	base_light/ceil1_22a_trans			//
//	qer_editorimage keyword was "robbing"		//
//	ceil1_22a.tga texmap from sourcename		//
//	shader base_light/ceil1_22a: this	 	//
//	prevented it from loading in Q3R shader window	//
//	changed qer_editorimage	to custom image		//
//	ceil1_22a_qer.tga				//
//	Phase 2 cleanup					//
//	texture robbing issues solved in Build189	//
//	ceil1_22a_qer.tga no longer needed		//
//	changed qer_editorimage				//
//	back to ceil1_22a.tga				//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/ceil1_22a_8k
{
	surfaceparm nomarks
	qer_editorimage textures/base_light/ceil1_22a.tga
	q3map_surfacelight 8000
//	light 1
	//	A red-orange ceiling light (wattage 8k)
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_22a_trans
{
	qer_editorimage textures/base_light/ceil1_22a.tga
	surfaceparm nomarks
	surfaceparm nonsolid
	q3map_surfacelight 10000
//	light 1
	//	A red-orange ceiling light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/ceil1_26				//
//	base_light/ceil1_28				//
//	base_light/ceil1_3				//
//	don't work: commented out 			//
//******************************************************//

//textures/base_light/ceil1_26
//{
//	surfaceparm nomarks
//	q3map_surfacelight 10000
//	light1
//}

//textures/base_light/ceil1_28
//{
//	surfaceparm nomarks
//	q3map_surfacelight 10000
//	light1
//}

//textures/base_light/ceil1_3
//{
//	surfaceparm nomarks
//	q3map_surfacelight 10000
//	light 1
//	//	A red ceiling light
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/ceil1_3.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/ceil1_3.blend.tga
//		blendfunc GL_ONE GL_ONE
//	}
//}

//******************************************************//
//	base_light/ceil1_30				//
//	Phase 2 cleanup					//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/ceil1_30
{
	surfaceparm nomarks
	q3map_surfacelight 10000
//	light 1
	// Square rich blue light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/ceil1_30_8k				//
//	base_light/ceil1_30_trans			//
//	qer_editorimage keyword was "robbing"		//
//	ceil1_30.tga texmap from sourcename		//
//	shader base_light/ceil1_30: this	 	//
//	prevented it from loading in Q3R shader window	//
//	changed qer_editorimage	to custom image		//
//	ceil1_30_qer.tga				//
//	Phase 2 cleanup					//
//	texture robbing issues solved in Build189	//
//	ceil1_30_qer.tga no longer needed		//
//	changed qer_editorimage				//
//	back to ceil1_30.tga				//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/ceil1_30_8k
{
	surfaceparm nomarks
	qer_editorimage textures/base_light/ceil1_30.tga
	q3map_surfacelight 8000
//	light 1
	// Square rich blue light (8k light wattage
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_30_trans
{
	qer_editorimage textures/base_light/ceil1_30.tga
	surfaceparm nomarks
	surfaceparm nonsolid
	q3map_surfacelight 10000
//	light 1
	// Square rich blue light non-solid
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/ceil1_31				//
//	base_light/ceil1_32				//
//	base_light/ceil1_33				//
//	don't work: commented out 			//
//******************************************************//

//textures/base_light/ceil1_31
//{
//	surfaceparm nomarks
//	q3map_surfacelight 10000
//	light 1
//	// Square magenta light
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/ceil1_31.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/ceil1_31.blend.tga
//		blendfunc GL_ONE GL_ONE
//	}
//}

//textures/base_light/ceil1_32
//{
//	surfaceparm nomarks
//	q3map_surfacelight 10000
//	light 1
//	// Square violet light
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/ceil1_32.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/ceil1_32.blend.tga
//		blendfunc GL_ONE GL_ONE
//	}
//}

//textures/base_light/ceil1_33
//{
//	surfaceparm nomarks
//	q3map_surfacelight 10000
//	light 1
//	// Square golden yellow light
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/ceil1_33.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/ceil1_33.blend.tga
//		blendfunc GL_ONE GL_ONE
//	}
//}

//******************************************************//
//	base_light/ceil1_34				//
//	Phase 2 cleanup					//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/ceil1_34
{
	surfaceparm nomarks
	q3map_surfacelight 10000
//	light 1
	// Square tourquoise light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/ceil1_34_10k				//
//	base_light/ceil1_34_1k				//
//	base_light/ceil1_34_2k				//
//	base_light/ceil1_34_5k				//
//	qer_editorimage keyword was "robbing"		//
//	ceil1_34.tga texmap from sourcename		//
//	shader base_light/ceil1_34: this	 	//
//	prevented it from loading in Q3R shader window	//
//	changed qer_editorimage	to custom image		//
//	ceil1_34_qer.tga				//
//	Phase 2 cleanup					//
//	texture robbing issues solved in Build189	//
//	ceil1_34_qer.tga no longer needed		//
//	changed qer_editorimage				//
//	back to ceil1_34.tga				//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/ceil1_34_10k
{
	qer_editorimage textures/base_light/ceil1_34.tga
	surfaceparm nomarks
	q3map_surfacelight 10000
//	light 1
	// Square tourquoise light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_34_1k
{
	qer_editorimage textures/base_light/ceil1_34.tga
	q3map_lightimage textures/base_light/ceil1_34.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 1000
//	light 1
	// Square tourquoise light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_34_2k
{
	qer_editorimage textures/base_light/ceil1_34.tga
	q3map_lightimage textures/base_light/ceil1_34.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 2000
//	light 1
	// Square tourquoise light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_34_5k
{
	qer_editorimage textures/base_light/ceil1_34.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
//	light 1
	// Square tourquoise light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/ceil1_35				//
//	doesn't work: commented out 			//
//******************************************************//

//textures/base_light/ceil1_35
//{
//	surfaceparm nomarks
//	q3map_surfacelight 10000
//	light 1
//	// Square green light
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/ceil1_35.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/ceil1_35.blend.tga
//		blendfunc GL_ONE GL_ONE
//	}
//}

//******************************************************//
//	base_light/ceil1_37				//
//	base_light/ceil1_38				//
//	Phase 2 cleanup					//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/ceil1_37
{
	surfaceparm nomarks
	q3map_surfacelight 10000
//	light 1
	// Modified light blue ceil light from Q2
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_37.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_37.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38
{
	surfaceparm nomarks
	q3map_surfacelight 2500
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/ceil1_38_10k				//
//	base_light/ceil1_38_20k				//
//	base_light/ceil1_38_30k				//
//	base_light/ceil1_38_40k				//
//	base_light/ceil1_38_50k				//
//	base_light/ceil1_38_70k				//
//	base_light/ceil1_38_90k				//
//	qer_editorimage keyword was "robbing"		//
//	ceil1_38.tga texmap from sourcename		//
//	shader base_light/ceil1_38: this	 	//
//	prevented it from loading in Q3R shader window	//
//	changed qer_editorimage	to custom image		//
//	ceil1_38_qer.tga				//
//	Phase 2 cleanup					//
//	texture robbing issues solved in Build189	//
//	ceil1_38_qer.tga no longer needed		//
//	changed qer_editorimage				//
//	back to ceil1_38.tga				//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/ceil1_38_10k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 10000
//	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38_20k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 20000
//	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38_30k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 30000
//	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38_40k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 40000
//	light 1
	// Square dirty white light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38_50k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 50000
//	light 1
	// Square dirty white light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38_70k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 70000
//	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38_90k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 90000
//	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/ceil1_39				//
//	base_light/ceil1_4				//
//	Phase 2 cleanup					//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/ceil1_39
{
	surfaceparm nomarks
	q3map_surfacelight 7500
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_4
{
	surfaceparm nomarks
	q3map_surfacelight 10000
//	light 1
	//	A yellow ceiling light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_4.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_4.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/ceil1_6				//
//	doesn't work: commented out 			//
//******************************************************//

//textures/base_light/ceil1_6
//{
//	surfaceparm nomarks
//	q3map_surfacelight 10000
//	light1
//}

//******************************************************//
//	base_light/ceil_white5k				//
//	qer_editorimage keyword was "robbing"		//
//	ceil1_38.tga texmap from sourcename		//
//	shader base_light/ceil1_38: this	 	//
//	prevented it from loading in Q3R shader window	//
//	changed qer_editorimage	to custom image		//
//	ceil1_38_qer.tga				//
//	Phase 2 cleanup					//
//	texture robbing issues solved in Build189	//
//	ceil1_38_qer.tga no longer needed		//
//	changed qer_editorimage				//
//	back to ceil1_38.tga				//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/ceil_white5k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
//	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/cornerlight
{
	q3map_lightimage textures/base_light/cornerlight.glow.tga
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map textures/base_light/cornerlight.tga
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}

		
	{	
		map textures/base_light/cornerlight.glow.tga
		blendfunc GL_one gl_one
		rgbgen wave sawtooth .6 .1 0 7
	}		
}

//******************************************************//
//	base_light/dm18twr				//
//	doesn't work: commented out 			//
//******************************************************//

//textures/base_light/dm18twr
//{
//	q3map_lightimage textures/base_light/dm18twr_glow.tga
//	surfaceparm nomarks
//	q3map_surfacelight 4000
//	light 1
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/dm18twr.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//        {
//		map textures/base_light/dm18twr_glow.tga
//		blendFunc add
//		rgbgen wave sin .575 .025 0 10
//	}
//	
//}

//******************************************************//
//	base_light/geolight				//
//	Phase 2 cleanup					//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/geolight
{
	q3map_lightimage textures/base_light/geolight_glow.tga
	surfaceparm nomarks
	q3map_surfacelight 4000
//	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/geolight.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_light/geolight_glow.tga
		blendFunc add
		rgbgen wave sin .575 .025 0 10
	}
	
}

//******************************************************//
//	base_light/invisi_light1			//
//	base_light/jaildr01_3				//
//	base_light/jaildr02_3				//
//	don't work: commented out 			//
//******************************************************//

//textures/base_light/invisi_light1
//{
//	qer_editorimage base_light/ceil1_30.tga
//	qer_trans 50
//	//surfaceparm nodraw
//	surfaceparm nomarks
//	q3map_surfacelight 50000
//	light 1
//	// Square blue light
//	
//}

//textures/base_light/jaildr01_3
//{
//	surfaceparm nomarks
//	q3map_surfacelight 1000
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/jaildr01_3.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/jaildr01_3.blend.tga
//		rgbGen wave sin 0.5 0.5 1 1
//		blendfunc GL_ONE GL_ONE
//	}
//}

//textures/base_light/jaildr02_3
//{
//	surfaceparm nomarks
//	q3map_surfacelight 1000
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/jaildr02_3.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/jaildr02_3.blend.tga
//		rgbGen wave sin 0.5 0.5 1 1
//		blendfunc GL_ONE GL_ONE
//	}
//}

textures/base_light/jaildr03_1
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/jaildr03_1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/jaildr03_1.tga
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/jaildr03_2
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/jaildr03_2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/jaildr03_2.blend.tga
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}

}

textures/base_light/jaildr1_3
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/jaildr1_3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/jaildr1_3.blend.tga
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/jaildr2_3				//
//	doesn't work: commented out 			//
//******************************************************//

//textures/base_light/jaildr2_3
//{
//	surfaceparm nomarks
//	q3map_surfacelight 1000
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/jaildr2_3.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/jaildr2_3.blend.tga
////		rgbGen wave sin 0.5 0.5 1 1
//		blendfunc GL_ONE GL_ONE
//	}
//}

//******************************************************//
//	Phase 2 cleanup					//
//	base_light/light1_1500				//
//	base_light/light1_3000				//
//	base_light/light1_5000				//
//	base_light/light1blue_1500			//
//	base_light/light1blue_2000			//
//	base_light/light1blue_5000			//
//	base_light/light1blue_800			//
//	base_light/light1dark				//
//	base_light/light1red_2000			//
//	base_light/light1red_5000			//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/light1_1500
{
	qer_editorimage textures/base_light/light1.tga
//	light 1
	surfaceparm nomarks
	q3map_surfacelight 1500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1.blend.tga
		//rgbGen wave sin 0.5 0.5 0 3
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/light1_3000
{
	qer_editorimage textures/base_light/light1.tga
//	light 1
	surfaceparm nomarks
	q3map_surfacelight 1500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1.blend.tga
		//rgbGen wave sin 0.5 0.5 0 3
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/light1_5000
{
	qer_editorimage textures/base_light/light1.tga
	q3map_lightimage textures/base_light/light1.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
//	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1blue_1500
{
	qer_editorimage textures/base_light/light1blue.tga
	q3map_lightimage textures/base_light/light1blue.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 1500
//	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1blue.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1blue_2000
{
	qer_editorimage textures/base_light/light1blue.tga
	q3map_lightimage textures/base_light/light1blue.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 2000
//	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1blue.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1blue_5000
{
	qer_editorimage textures/base_light/light1blue.tga
	q3map_lightimage textures/base_light/light1blue.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
//	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1blue.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1blue_800
{
	qer_editorimage textures/base_light/light1blue.tga
	q3map_lightimage textures/base_light/light1blue.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 800
//	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1blue.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1dark
{
	qer_editorimage textures/base_light/light1.tga
	q3map_lightimage textures/base_light/light1.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 6000
//	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1red_2000
{
	qer_editorimage textures/base_light/light1red.tga
	q3map_lightimage textures/base_light/light1red.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 2000
//	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1red.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1red.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1red_5000
{
	qer_editorimage textures/base_light/light1red.tga
	q3map_lightimage textures/base_light/light1red.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
//	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1red.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1red.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/light2blue_2500			//
//	base_light/light3b_2500				//
//	base_light/light4_2500				//
//	don't work: commented out 			//
//******************************************************//

//textures/base_light/light2blue_2500
//{
//	qer_editorimage textures/base_light/light1blue.tga
//	q3map_lightimage textures/base_light/light1blue1.blend.tga
//	surfaceparm nomarks
//	q3map_surfacelight 2500
//	light 1
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/light1blue.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{	
//		map textures/base_light/light1blue1.blend.tga
//		blendfunc GL_ONE GL_ONE
//	}
//}

//textures/base_light/light3b_2500
//{
//	qer_editorimage textures/base_light/light3b.tga
//	light 1
//	surfaceparm nomarks
//	q3map_surfacelight 2500
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/light3b.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/light3b.blend.tga
//		blendFunc GL_ONE GL_ONE
//	}
//}

//textures/base_light/light4_2500
//{
//	qer_editorimage textures/base_light/light4.tga
//	light 1
//	surfaceparm nomarks
//	q3map_surfacelight 2500
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/light4.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/light4.blend.tga
//		rgbGen wave sin 0.5 0.5 0 3
//		blendFunc GL_ONE GL_ONE
//	}
//}

//******************************************************//
//	Phase 2 cleanup					//
//	base_light/light5_10k				//
//	base_light/light5_15k				//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/light5_10k
{
	qer_editorimage textures/base_light/light5.tga
	q3map_lightimage textures/base_light/xlight5.blend.tga
//	light 1
	surfaceparm nomarks
	q3map_surfacelight 10000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/xlight5.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/xlight5.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/light5_15k
{
	qer_editorimage textures/base_light/light5.tga
	q3map_lightimage textures/base_light/light5.blend.tga
//	light 1
	surfaceparm nomarks
	q3map_surfacelight 15000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light5.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light5.tga
		blendFunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/light5_20k				//
//	doesn't work: commented out 			//
//******************************************************//

//textures/base_light/light5_20k
//{
//	qer_editorimage textures/base_light/light5.tga
//	light 1
//	surfaceparm nomarks
//	q3map_surfacelight 20000
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/light5.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/light5.blend.tga
//		blendFunc GL_ONE GL_ONE
//	}
//}

//******************************************************//
//	Phase 2 cleanup					//
//	base_light/light5_3000				//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/light5_3000
{
	qer_editorimage textures/base_light/light5.tga
//	light 1
	surfaceparm nomarks
	q3map_surfacelight 3000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/xlight5.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/xlight5.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	Phase 2 cleanup					//
//	base_light/light5_5k				//
//	obsolete or inactive keywords commented out:	//
//	q3map_backsplash 0 0				//
//******************************************************//

textures/base_light/light5_5k
{
	qer_editorimage textures/base_light/light5.tga
	//light 1
	surfaceparm nomarks
	surfaceparm nolightmap
//	q3map_backsplash 0 0
	q3map_surfacelight 5000
	{
		map textures/base_light/light5.tga
		rgbGen identity
	}
//	{
//		map textures/base_light/light5.blend.tga
//		blendFunc GL_ONE GL_ONE
//	}
}

//******************************************************//
//	base_light/light6_2500				//
//	base_light/lightflare_500			//
//	base_light/lightflare_wht500			//
//	don't work: commented out 			//
//******************************************************//

//textures/base_light/light6_2500
//{
//	qer_editorimage textures/base_light/light6.tga
//	light 1
//	surfaceparm nomarks
//	q3map_surfacelight 2500
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/light6.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/light6.blend.tga
//		blendFunc GL_ONE GL_ONE
//	}
//}

//textures/base_light/lightflare_500
//{
//	qer_editorimage textures/base_light/light_flare.tga
//	deformVertexes autoSprite
//	q3map_surfacelight	500
//	surfaceparm	trans
//	surfaceparm nomarks
//	surfaceparm nolightmap
//	cull none
//	
//	{
//		Map textures/base_light/light_flare.tga
//		blendFunc GL_ONE GL_ONE
//	}	
//	
//}

//textures/base_light/lightflare_wht500
//{
//	qer_editorimage textures/base_light/light_flare.tga
//	q3map_lightimage textures/base_light/light1.blend.tga 
//	deformVertexes autoSprite
//	q3map_surfacelight	500
//	surfaceparm	trans
//	surfaceparm nomarks
//	surfaceparm nolightmap
//	cull none
//	
//	{
//		Map textures/base_light/light_flare.tga
//		blendFunc GL_ONE GL_ONE
//	}	
//	
//}

//******************************************************//
//	Phase 2 cleanup					//
//	base_light/lt2_2000				//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/lt2_2000
{
	qer_editorimage textures/base_light/light2.tga
//	light 1
	surfaceparm nomarks
	q3map_surfacelight 2000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light2.blend.tga
		rgbGen wave sin 0.6 0.1 .1 .1
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/lt2_4000
{
	qer_editorimage textures/base_light/light2.tga
	//light 1
	surfaceparm nomarks
	q3map_surfacelight 4000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light2.blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendFunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	Phase 2 cleanup					//
//	base_light/lt2_8000				//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/lt2_8000
{
	qer_editorimage textures/base_light/light2.tga
//	light 1
	surfaceparm nomarks
	q3map_surfacelight 8000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light2.blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendFunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/lt6_2500				//
//	base_light/lt6_2p5k				//
//	don't work: commented out 			//
//******************************************************//

//textures/base_light/lt6_2500
//{
//	qer_editorimage textures/base_light/light6.tga
//	light 1
//	surfaceparm nomarks
//	q3map_surfacelight 2500
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/light6.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/light6.blend.tga
//		blendFunc GL_ONE GL_ONE
//	}
//}

//textures/base_light/lt6_2p5k
//{
//	qer_editorimage textures/base_light/light6.tga
//	light 1
//	surfaceparm nomarks
//	q3map_surfacelight 5000
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/light6.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/light6.blend.tga
//		blendFunc GL_ONE GL_ONE
//	}
//}

//******************************************************//
//	Phase 2 cleanup					//
//	base_light/patch10_pj_lite			//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/patch10_pj_lite
{
	q3map_surfacelight 2500
	surfaceparm nomarks
//	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/patch10_pj_lite2
{
	q3map_surfacelight 2000
	surfaceparm nomarks
	//light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite2.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/patch10_pj_lite2_1000		//
//	qer_editorimage keyword was "robbing"		//
//	patch10_pj_lite2.tga texmap from sourcename	//
//	shader base_light/patch10_pj_lite2: this	//
//	prevented it from loading in Q3R shader window	//
//	changed qer_editorimage	to custom image		//
//	patch10_pj_lite2_qer.tga			//
//	Phase 2 cleanup					//
//	texture robbing issues solved in Build189	//
//	patch10_pj_lite2_qer.tga no longer needed	//
//	changed qer_editorimage				//
//	back to patch10_pj_lite2.tga			//
//******************************************************//

textures/base_light/patch10_pj_lite2_1000
{
	qer_editorimage textures/base_light/patch10_pj_lite2.tga
	q3map_surfacelight 1000
	surfaceparm nomarks
	//light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite2.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/pj_wstlt1_3k				//
//	doesn't work: commented out 			//
//******************************************************//

//textures/base_light/pj_wstlt1_3k
//{
//	qer_editorimage textures/base_light/wstlt1_5.tga
//	q3map_lightimage textures/base_light/wstlt1_5.blend.tga
//	q3map_surfacelight 3000
//	surfaceparm nomarks
//	light 1
//
//	// older wall lamp
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/wstlt1_5.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/wstlt1_5.blend.tga
//		blendfunc GL_ONE GL_ONE
//	}
//}

//******************************************************//
//	base_light/pjceil1_39_1K			//
//	base_light/pjceil1_39_1p5k			//
//	qer_editorimage keyword was "robbing"		//
//	ceil1_39.tga texmap from sourcename		//
//	shader base_light/ceil1_39: this	 	//
//	prevented it from loading in Q3R shader window	//
//	changed qer_editorimage	to custom image		//
//	ceil1_39_qer.tga				//
//	Phase 2 cleanup					//
//	texture robbing issues solved in Build189	//
//	ceil1_39_qer.tga no longer needed		//
//	changed qer_editorimage				//
//	back to ceil1_39.tga				//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/pjceil1_39_1K
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 1000
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/pjceil1_39_1p5k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 1500
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/proto_bulb				//
//	doesn't work: commented out 			//
//******************************************************//

//textures/base_light/proto_bulb
//{
//    deformVertexes autoSprite2
//    surfaceparm	trans
//	surfaceparm nomarks
//	surfaceparm nolightmap
//	cull none
//    
//        {
//                map textures/base_light/proto_bulb.tga
//                blendFunc GL_ONE GL_ONE
//                
//        }
//
//
//}

//******************************************************//
//	base_light/proto_light				//
//	Phase 2 cleanup					//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/proto_light
{
	q3map_lightimage textures/base_light/proto_lightmap.tga
	surfaceparm nomarks
	q3map_surfacelight 1000
//	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_light.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/proto_lightmap.tga
		blendfunc GL_ONE GL_ONE
                rgbGen wave sin .5 0.5 1 .1
	}
        {	
		map textures/base_light/proto_light2.tga
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 5 1 3
	}
        {	
		map textures/base_light/proto_light2.tga
		blendfunc GL_ONE GL_ONE
                tcmod scale -1 -1
                 rgbgen wave triangle 1 2 0 7
	}
}

//******************************************************//
//	base_light/proto_light_2k			//
//	qer_editorimage keyword was "robbing"		//
//	proto_light.tga texmap from sourcename		//
//	shader base_light/proto_light: this	 	//
//	prevented it from loading in Q3R shader window	//
//	changed qer_editorimage	to custom image		//
//	proto_light_qer.tga				//
//	Phase 2 cleanup					//
//	texture robbing issues solved in Build189	//
//	proto_light_qer.tga no longer needed		//
//	changed qer_editorimage				//
//	back to proto_light.tga				//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/proto_light_2k
{
	qer_editorimage textures/base_light/proto_light.tga
	q3map_lightimage textures/base_light/proto_lightmap.tga
	surfaceparm nomarks
	q3map_surfacelight 2000
//	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_light.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/proto_lightmap.tga
		blendfunc GL_ONE GL_ONE
                rgbGen wave sin .5 0.5 1 .1
	}
        {	
		map textures/base_light/proto_light2.tga
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 5 1 3
	}
        {	
		map textures/base_light/proto_light2.tga
		blendfunc GL_ONE GL_ONE
                tcmod scale -1 -1
                 rgbgen wave triangle 1 2 0 7
	}
}

//******************************************************//
//	base_light/proto_lightgreen			//
//	doesn't work: commented out 			//
//******************************************************//

//textures/base_light/proto_lightgreen
//{
//	q3map_lightimage textures/base_light/proto_lightgreen.tga
//	surfaceparm nomarks
//	q3map_surfacelight 300
//	light 1
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/proto_lightgreen.tga
//		blendFunc filter
//		rgbGen identity
//	}
//        {
//		map textures/base_light/proto_lightgreen.tga
//		blendFunc add
//	}
//	
//}

//******************************************************//
//	base_light/proto_lightred			//
//	Phase 2 cleanup					//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/proto_lightred
{
	q3map_lightimage textures/base_light/proto_lightred.tga
	surfaceparm nomarks
	q3map_surfacelight 300
//	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_lightred.tga
		blendFunc filter
		rgbGen identity
	}
        {
		map textures/base_light/proto_lightred.tga
		blendFunc add
	}
	
}

//******************************************************//
//	base_light/proto_lightred2			//
//	qer_editorimage keyword was "robbing"		//
//	proto_lightred.tga texmap from sourcename	//
//	shader base_light/proto_lightred: this	 	//
//	prevented it from loading in Q3R shader window	//
//	changed qer_editorimage	to custom image		//
//	proto_lightred_qer.tga				//
//	Phase 2 cleanup					//
//	texture robbing issues solved in Build189	//
//	proto_lightred_qer.tga no longer needed		//
//	changed qer_editorimage				//
//	back to proto_lightred.tga			//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/proto_lightred2
{
	q3map_lightimage textures/base_light/proto_lightred.tga
	qer_editorimage textures/base_light/proto_lightred.tga
	surfaceparm nomarks
	q3map_surfacelight 1000
//	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_lightred.tga
		blendFunc filter
		rgbGen identity
	}
        {
		map textures/base_light/proto_lightred.tga
		blendFunc add
		rgbGen wave square .5 .5 0 1
	}
	
}

textures/base_light/runway
{
	q3map_lightimage textures/base_light/runway_glow.tga
	surfaceparm nomarks
	q3map_surfacelight 400
	{
		map textures/base_light/runway_glow.tga
		tcmod scale 1 .25
		rgbgen wave square -1 2 .5 8
		tcmod scroll 0 .5
	}	

	{
		map textures/base_light/runway.tga
		blendFunc blend
		rgbGen identity
	}
        
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/base_light/runwayb.tga
		blendFunc add
		rgbGen identity
	}

	
}

//******************************************************//
//	base_light/s_proto_light			//
//	was showing no texmap: added custom		//
//	qer_editorimage proto_light_qer			//
//	Phase 2 cleanup					//
//	texture robbing issues solved in Build189	//
//	proto_light_qer.tga no longer needed		//
//	changed qer_editorimage				//
//	back to proto_light.tga				//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/s_proto_light
{
	q3map_lightimage textures/base_light/s_proto_lightmap.tga
	qer_editorimage textures/base_light/proto_light.tga
	surfaceparm nomarks
	q3map_surfacelight 100
//	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_light.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/proto_lightmap.tga
		blendfunc GL_ONE GL_ONE
                rgbGen wave sin .5 0.5 1 .1
	}
        {	
		map textures/base_light/proto_light2.tga
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 5 1 3
	}
        {	
		map textures/base_light/proto_light2.tga
		blendfunc GL_ONE GL_ONE
                tcmod scale -1 -1
                 rgbgen wave triangle 1 2 0 7
	}
}

textures/base_light/scrolllight
{
	q3map_lightimage textures/sfx/scrolllight2.tga
	q3map_surfacelight 100
	
        {
		map $lightmap
		rgbGen identity
	}
        {
		Map textures/base_light/scrolllight.tga
		blendfunc gl_dst_color gl_zero
                rgbGen identity
	}	
        {    
		Map textures/base_light/scrolllight2.tga
		blendFunc GL_ONE GL_ONE
                tcmod scroll -1 0
	}	
        {    
      	        Map textures/base_light/scrolllight2.tga
      	        blendFunc GL_ONE GL_ONE
                tcmod scroll -2 0
        }	
    
	
}

//******************************************************//
//	base_light/shi					//
//	base_light/sm_light1blue			//
//	base_light/sm_light1red				//
//	base_light/steedmetallight			//
//	base_light/tlight05				//
//	don't work: commented out 			//
//******************************************************//

//textures/base_light/shi
//{
//        surfaceparm	trans
//	surfaceparm nomarks
//	surfaceparm nolightmap
//	cull disable
//	{
//		map textures/base_light/shi.tga
//		blendFunc GL_ONE GL_ONE
//                tcmod scale .5 .5
//		rgbgen wave triangle 1 5.1 1 3
//	}
//	
//        {	
//		map textures/base_light/shi.tga
//		blendfunc GL_ONE GL_ONE
//                tcmod scale .5 .5
//                rgbgen wave triangle 1 2 0 7.3
//	}
//}

//textures/base_light/sm_light1blue
//{
//	light 1
//	surfaceparm nomarks
//	q3map_surfacelight 2500
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/sm_light1blue.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/sm_light1blue.blend.tga
//		blendFunc GL_ONE GL_ONE
//	}
//}

//textures/base_light/sm_light1red
//{
//	light 1
//	surfaceparm nomarks
//	q3map_surfacelight 2500
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/sm_light1red.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/sm_light1red.blend.tga
//		blendFunc GL_ONE GL_ONE
//	}
//}

//textures/base_light/steedmetallight
//{
//	q3map_surfacelight 2000	
//	light 1
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/steedmetallight.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/steedmetallight.blend.tga
//		rgbGen wave sin 0.5 0.5 0 .2
//		blendFunc GL_ONE GL_ONE
//	}
//}

//textures/base_light/tlight05
//{
//	surfaceparm nomarks
//	q3map_surfacelight 5000
//	light1
//}

textures/base_light/trianglelight
{
	q3map_lightimage textures/base_light/trianglelight.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map textures/base_light/trianglelight.tga
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}

		
	{	
		map textures/base_light/trianglelight.blend.tga
		blendfunc GL_one gl_one
		rgbgen wave sawtooth .6 .1 0 7
	}

		
}

//******************************************************//
//	base_light/wstlt1_5				//
//	doesn't work: commented out 			//
//******************************************************//

//textures/base_light/wstlt1_5
//{
//	q3map_surfacelight 2000
//	surfaceparm nomarks
//	light 1
//
//	// older wall lamp
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/wstlt1_5.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/wstlt1_5.blend.tga
//		blendfunc GL_ONE GL_ONE
//	}
//}

textures/base_light/wsupprt1_12
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	//light1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/wsupprt1_12.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/wsupprt1_12.blend.tga
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}

//******************************************************//
//	base_light/wsupprt1_12h				//
//	doesn't work: commented out 			//
//******************************************************//

//textures/base_light/wsupprt1_12h
//{
//	surfaceparm nomarks
//	q3map_surfacelight 1000
//	//light1
//	{
//		map $lightmap
//		rgbGen identity
//	}
//	{
//		map textures/base_light/wsupprt1_12h.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		rgbGen identity
//	}
//	{
//		map textures/base_light/wsupprt1_12h.blend.tga
//		rgbGen wave sin 0.5 0.5 1 1
//		blendfunc GL_ONE GL_ONE
//	}
//}

//******************************************************//
//	base_light/xceil1_39				//
//	base_light/xceil1_39_1				//
//	base_light/xceil1_39_10k			//
//	base_light/xceil1_39_110k			//
//	base_light/xceil1_39_15k			//
//	base_light/xceil1_39_20k			//
//	base_light/xceil1_39_2k				//
//	base_light/xceil1_39_30k			//
//	base_light/xceil1_39_500k			//
//	base_light/xceil1_39_50k			//
//	base_light/xceil1_39_5k				//
//	base_light/xceil1_39_70k			//
//	base_light/xceil1_39_90k			//
//	base_light/xceil1_39_a				//
//	base_light/xceil1_39_b				//
//	qer_editorimage keyword was "robbing"		//
//	ceil1_39.tga texmap from sourcename		//
//	shader base_light/ceil1_39: this	 	//
//	prevented it from loading in Q3R shader window	//
//	changed qer_editorimage	to custom image		//
//	ceil1_39_qer.tga				//
//	Phase 2 cleanup					//
//	texture robbing issues solved in Build189	//
//	ceil1_39_qer.tga no longer needed		//
//	changed qer_editorimage				//
//	back to ceil1_39.tga				//
//	obsolete or inactive keywords commented out:	//
//	light 1						//
//******************************************************//

textures/base_light/xceil1_39
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 20000
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_1
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 10000
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_10k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 10000
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_110k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 110000
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_15k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 15000
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_20k
{
//	q3map_backsplash 0 0
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 20000
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_2k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 2000
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_30k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 30000
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_500k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 500000
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_50k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 50000
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_5k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_70k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 70000
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_90k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 90000
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_a
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 30000
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_b
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 40000
//	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
