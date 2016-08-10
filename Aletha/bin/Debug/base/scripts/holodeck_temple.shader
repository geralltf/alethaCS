textures/holodeck_temple/sky_light2
{
    q3map_lightimage textures/holodeck_temple/lightcyan.tga
    qer_editorimage textures/common/sky.tga
    q3map_surfacelight 200
    surfaceparm noimpact
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm sky
    q3map_sun 1 1 1 175 65 45
    skyParms env/stars 512 -
    {
        map textures/holodeck_temple/clouds.tga
        blendFunc GL_ONE GL_ONE
        tcMod scale 4 4
        tcMod scroll 0.015 0.01
    }
    {
        map textures/holodeck_temple/clouds2.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        tcMod scale 3 3
        tcMod scroll 0.035 0.025
    }
}

textures/holodeck_temple/sky_light
{
    q3map_lightimage textures/holodeck_temple/lightcyan.tga
    qer_editorimage textures/common/sky.tga
    q3map_surfacelight 500
    surfaceparm noimpact
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm sky
    q3map_sun 1 1 1 175 65 45
    skyParms env/stars 512 -
    {
        map textures/holodeck_temple/clouds.tga
        blendFunc GL_ONE GL_ONE
        tcMod scale 4 4
        tcMod scroll 0.015 0.01
    }
    {
        map textures/holodeck_temple/clouds2.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        tcMod scale 3 3
        tcMod scroll 0.035 0.025
    }
}

textures/holodeck_temple/daysky_light
{
    q3map_lightimage textures/holodeck_temple/lightcyan.tga
    qer_editorimage textures/common/sky.tga
    q3map_surfacelight 500
    surfaceparm noimpact
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm sky
    q3map_sun 1 1 1 175 65 45
    skyParms env/camelot 512 -
    {
        map textures/holodeck_temple/clouds.tga
        blendFunc GL_ONE GL_ONE
        tcMod scale 4 4
        tcMod scroll 0.015 0.01
    }
    {
        map textures/holodeck_temple/clouds2.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        tcMod scale 3 3
        tcMod scroll 0.005 0.025
    }
}

textures/holodeck_temple/crystal3
{
    q3map_surfacelight 4200
    surfaceparm nolightmap
    surfaceparm trans
    {
        map textures/holodeck_temple/crystal3.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale 6 6
    }
}

textures/holodeck_temple/crystal3_red
{
    q3map_surfacelight 4200
    surfaceparm nolightmap
    surfaceparm trans
    {
        map textures/holodeck_temple/crystal3_red.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale 6 6
    }
}

textures/holodeck_temple/water1f
{
    qer_trans 0.25
    surfaceparm nolightmap
    surfaceparm trans
    surfaceparm water
    surfaceparm pointlight
    deformVertexes wave 100 sin 0 4 0 0.75
    tessSize 192
    {
        map textures/holodeck_temple/water1f.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen vertex
        tcMod scroll 0.05 -0.03
    }
    {
        map textures/holodeck_temple/water1f.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen vertex
        tcMod scroll 0.045 0.05
    }
}

textures/holodeck_temple/water1f_2
{
    qer_editorimage textures/holodeck_temple/water1f.tga
    qer_trans 0.25
    surfaceparm nolightmap
    surfaceparm trans
    surfaceparm water
    surfaceparm pointlight
    cull disable
    deformVertexes wave 128 sin 0 2 0 0.75
    tessSize 48
    {
        map textures/holodeck_temple/water1f.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen vertex
        tcMod scroll 0.05 -0.03
    }
    {
        map textures/holodeck_temple/water1f.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen vertex
        tcMod scroll 0.045 0.05
    }
}

textures/holodeck_temple/3_6relfbrk1
{
    {
        map $lightmap
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
    {
        map textures/holodeck_temple/3_6relfbrk1.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/detail/stonerough.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcMod scale 3 3
    }
}

textures/holodeck_temple/healcrystal
{
    qer_editorimage textures/holodeck_temple/healcrystal.tga
    q3map_surfacelight 4200
    surfaceparm nolightmap
    surfaceparm trans
    {
        map textures/holodeck_temple/healcrystal.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale 6 6
    }
}

