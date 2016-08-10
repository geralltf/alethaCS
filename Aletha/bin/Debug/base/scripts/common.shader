//**********************************************************************//
//	common.shader sorted and cleaned up for Q3Radiant		//
//	by Eutectic - 17 Jan 2000					//
//	Phase 2 update: 13 May 2000					//
//									//
//	TOTAL SHADERS: 38						//
//	NO. OF BROKEN SHADERS/COMMENTED OUT: 13				//
//	NO. OF WORKING SHADERS WITH DUPLICATE ENTRIES: 0		//
//	NO. OF WORKING SHADERS THAT DIDN'T APPEAR IN EDITOR: 0		//
//	SHADERS THAT DIDN'T BELONG HERE AND MOVED TO PROPER FILE: 0	//
//	SHADERS THAT BELONGED HERE BUT WERE IN ANOTHER FILE: 11		//
//	textures/common/nightsky					//
//	textures/common/nightsky2					//
//	textures/common/sky_30						//
//	textures/common/sky_100						//
//	textures/common/sky_1000					//
//	textures/common/sky_150						//
//	textures/common/sky_300						//
//	textures/common/sky_500						//
//	textures/common/sky_space					//
//	textures/common/sky_u2						//
//	textures/common/sky1						//
//	textures/common/transwater					//
//**********************************************************************//

//*****************************************
//**   I've reduced the transparency on most editor-only brushes here.
//**   If the transparent textures are still too pale for
//**   things like clip, hint, trigger, etc.,
//**   Please make an editorimage to suit your needs.
//******************************************

textures/common/areaportal
{
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm structural
	surfaceparm trans
	surfaceparm	nomarks
	surfaceparm areaportal
}

textures/common/caulk
{
	surfaceparm nodraw
	surfaceparm nomarks
        surfaceparm nolightmap
}

textures/common/clip
{
	qer_trans 0.40
	surfaceparm 	nolightmap
	surfaceparm nomarks
	surfaceparm nodraw
	surfaceparm nonsolid
        //surfaceparm 	nolightmap //proto_addition 11/08/99
	surfaceparm playerclip
	surfaceparm noimpact
}

//******************************************************//
//	common/clusterportal				//
//	Phase 2 cleanup					//
//	obsolete or inactive keywords commented out:	//
//	surfaceparm detail				//
//******************************************************//

//bot specific cluster portal
textures/common/clusterportal
{
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm	nomarks
//	surfaceparm detail
	surfaceparm clusterportal
}

textures/common/cushion
{
	qer_nocarve
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nomarks
	surfaceparm nodamage
	surfaceparm trans
}

//******************************************************//
//	common/donotenter				//
//	Phase 2 cleanup					//
//	obsolete or inactive keywords commented out:	//
//	surfaceparm detail				//
//******************************************************//

//bot specific "do not enter" brush
textures/common/donotenter
{
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm	nomarks
//	surfaceparm detail
	surfaceparm donotenter
}

textures/common/energypad
{
	qer_editorimage textures/common/bluegoal.tga
	surfaceparm nolightmap
	cull twosided
	{
		map textures/common/bluegoal.tga
		blendFunc GL_ONE GL_SRC_ALPHA
		tcGen environment
		tcMod turb 0 0.25 0 0.05
	}
}

textures/common/full_clip
{
	qer_trans 0.40
	surfaceparm nodraw
	surfaceparm playerclip
}

textures/common/hint
{
	qer_nocarve
	qer_trans 0.30
	surfaceparm hint
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm structural
	surfaceparm trans
	surfaceparm noimpact
}

textures/common/invisible
{
	surfaceparm nolightmap			
        {
                map textures/common/invisible.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
}

//******************************************************//
//	common/mirror1					//
//	Phase 2 cleanup					//
//	changed qer_editorimage	to mirror1.tga		//
//	to avoid shader/texture confusion		//
//******************************************************//

textures/common/mirror1
{
	qer_editorimage textures/common/mirror1.tga
	surfaceparm nolightmap
	portal
  
	{
		map textures/common/mirror1.tga
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite
	}
       
        

}

textures/common/mirror2
{
	qer_editorimage textures/common/qer_mirror.tga
	surfaceparm nolightmap
	portal
	{
		map textures/common/mirror1.tga
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite
	}
        {
               map textures/sfx/mirror.tga
	       blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
        }

}

textures/common/missileclip
{
	qer_trans 0.40
	surfaceparm nodamage
	surfaceparm nomarks
	surfaceparm nodraw
	//surfaceparm nonsolid
	surfaceparm playerclip
}

//******************************************************//
//	common/nightsky					//
//	common/nightsky2				//
//	were moved from sky.shader to this file		//
//	none of these work: commented out 		//
//******************************************************//

//textures/common/nightsky
//{
//	surfaceparm sky
//	surfaceparm noimpact
//	surfaceparm nolightmap
//
//	sky env/blue
//	cloudparms 192 full
//
//	{
//		map textures/bwhtest/tileclouds.tga
//		blendfunc GL_ONE GL_ONE
//		tcMod scroll 0.02 0.02
//		tcMod scale 2 2
//	}
//}

//textures/common/nightsky2
//{
//	surfaceparm sky
//	surfaceparm noimpact
//	surfaceparm nolightmap
//
//	q3map_surfacelight 30
//	sky env/night
//	cloudparms 192
//
//	{
//		map env/purpleclouds.tga
//		blendfunc GL_ONE GL_ONE
//		tcMod scroll 0.01 0.01
//		tcMod scale 2 2
//	}
//
//	{
//		map env/clouds.tga
//		blendfunc GL_DST_COLOR GL_ZERO
//		tcMod scroll 0.05 0.05
//		tcMod scale 3 3
//	}
//}

textures/common/nodraw
{
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm nomarks
}

textures/common/nodrawnonsolid
{
	surfaceparm	nonsolid
	surfaceparm	nodraw
}

textures/common/nodrop
{
	qer_nocarve
	qer_trans	0.5
	surfaceparm 	trans
	surfaceparm	nonsolid
	surfaceparm	nomarks
	surfaceparm     nodrop
	surfaceparm 	nolightmap
	surfaceparm 	nodraw
	cull		disable
}

textures/common/noimpact
{
	surfaceparm noimpact
}

textures/common/nolightmap
{
	surfaceparm nolightmap
}

textures/common/origin
{
	qer_nocarve
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm origin
}

//******************************************************//
//	common/portal					//
//	Phase 2 cleanup					//
//	changed qer_editorimage	to portal.tga		//
//	to avoid shader/texture confusion		//
//******************************************************//

textures/common/portal
{
	qer_editorimage textures/common/portal.tga
	surfaceparm nolightmap
	portal
	{
		map textures/common/mirror1.tga
//		map textures/common/portal.tga
		tcMod turb 0 0.25 0 0.05
//		blendFunc GL_ONE GL_SRC_ALPHA
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite

	}
}

//******************************************************//
//	common/skip					//
//	Phase 2 cleanup					//
//	doesn't work: commented out	 		//
//******************************************************//

//textures/common/skip
//{
//qer_nocarve
//qer_trans 0.40
//surfaceparm nodraw
//surfaceparm nonsolid
//surfaceparm structural
//surfaceparm trans
//}

//******************************************************//
//	common/sky1					//
//	common/sky_100					//
//	common/sky_1000					//
//	common/sky_150					//
//	common/sky_30					//
//	common/sky_300					//
//	common/sky_500					//
//	common/sky_space				//
//	common/sky_u2					//
//	were moved from sky.shader to this file		//
//	none of these work: commented out 		//
//******************************************************//

//textures/common/sky1
//{
//	surfaceparm sky
//	surfaceparm noimpact
//	q3map_surfacelight 50
//	surfaceparm nolightmap
//	sky	env/unit1
//}

//textures/common/sky_100
//{
//	surfaceparm sky
//	surfaceparm noimpact
//	surfaceparm nolightmap
//	q3map_surfacelight 100
//	sky	env/unit1
//}

//textures/common/sky_1000
//{
//	surfaceparm sky
//	surfaceparm noimpact
//	surfaceparm nolightmap
//	q3map_surfacelight 1000
//	sky	env/unit1
//}

//textures/common/sky_150
//{
//	surfaceparm sky
//	surfaceparm noimpact
//	surfaceparm nolightmap
//	q3map_surfacelight 150
//	sky	env/unit1
//}

//textures/common/sky_30
//{
//	surfaceparm sky
//	surfaceparm noimpact
//	q3map_surfacelight 30
//	surfaceparm nolightmap
//	sky	env/unit1
//}

//textures/common/sky_300
//{
//	surfaceparm sky
//	surfaceparm noimpact
//	q3map_surfacelight 300
//	surfaceparm nolightmap
//	sky	env/unit1
//}

//textures/common/sky_500
//{
//	surfaceparm sky
//	surfaceparm noimpact
//	q3map_surfacelight 500
//	surfaceparm nolightmap
//	sky	env/unit1
//}

//textures/common/sky_space
//{
//	surfaceparm sky
//	surfaceparm noimpact
//	q3map_surfacelight 50
//	surfaceparm nolightmap
//	sky	env/space1
//}

//textures/common/sky_u2
//{
//	surfaceparm sky
//	surfaceparm noimpact
//	q3map_surfacelight 50
//	surfaceparm nolightmap
//	sky	env/unit2
//}

textures/common/slick
{
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nomarks
	surfaceparm trans
	surfaceparm slick
}

//******************************************************//
//	common/teleporter				//
//	doesn't work: commented out	 		//
//******************************************************//

//textures/common/teleporter
//{
//	surfaceparm nolightmap
//	surfaceparm noimpact
//	q3map_lightimage textures/sfx/powerupshit.tga	
//	q3map_surfacelight 800
//	{
//		map textures/sfx/powerupshit.tga
//		tcGen environment
////		tcMod scale 5 5
//		tcMod turb 0 0.015 0 0.3
//	}
//}

//******************************************************//
//	common/timportal				//
//	Phase 2 cleanup					//
//	This shader does exactly the same thing		//
//	common/portal but since portal.tga is NOT	//
//      included in id's pak0.pk3 file, this shader	//
//	will be broken for the players who don't have	//
//	mapmedia.pk3. Therefore, if you use this shader	//
//	it is essential to include portal.tga inside	//
//	the pk3 file in which you distribute your map.	//
//******************************************************//

textures/common/timportal
{
	qer_editorimage textures/common/qer_portal.tga
	portal
	surfaceparm nolightmap
	{
		map textures/common/portal.tga
		tcMod turb 0 0.25 0 0.05
		blendFunc GL_ONE GL_SRC_ALPHA
		depthWrite
	}
}

//******************************************************//
//	Phase 2 cleanup					//
//	common/transwater				//
//	was moved from test.shader to this file		//
//	doesn't work: commented out 			//
//******************************************************//

//textures/common/transwater
//{
//	surfaceparm trans
//	surfaceparm nonsolid
//	surfaceparm water
//	surfaceparm nolightmap
//
//	cull disable
//	
//	tesssize 34
//	deformVertexes wave 100 sin 0 2 0 0.1
//	{
//	map textures/common/water1.tga
//	blendFunc GL_DST_COLOR GL_ZERO
//	}
//}

textures/common/trigger
{
	qer_trans 0.50
	qer_nocarve
	surfaceparm nodraw
}

textures/common/weapclip
{
	qer_trans 0.40
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nodraw
}

