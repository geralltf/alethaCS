//*************************************************
//* 		   THE START OF		        *
//* 		THE TRANSPORTER ROOM SHADERS	*
//*************************************************
textures/transporter/backglass1
{
    q3map_surfacelight 612
    surfaceparm nolightmap
    {
        map textures/transporter/backglass1.tga
    }
    {
        map textures/transporter/panelmult.tga
        blendFunc GL_DST_COLOR GL_ZERO
        tcMod scale 1 0.25
        tcMod scroll 0.02 0.15
    }
}

textures/transporter/light1
{
    q3map_surfacelight 4200
    surfaceparm nolightmap
    {
        map textures/transporter/light1.tga
    }
}

textures/transporter/light_basic
{
    q3map_surfacelight 3500
    surfaceparm nolightmap
    {
        map textures/transporter/light_basic.tga
    }
}

textures/transporter/transpadtop
{
    q3map_surfacelight 1400
    surfaceparm nolightmap
    {
        map textures/transporter/transpadtop.tga
    }
}

textures/transporter/transpad
{
    surfaceparm nolightmap
    portal
    {
        map textures/transporter/transpad.tga
        blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
        depthWrite
    }
    {
        map textures/transporter/transpad.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    }
}

textures/transporter/panel
{
    surfaceparm nolightmap
    surfaceparm pointlight
    {
        map textures/detail/gleam2.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
        tcGen environment
        tcMod scale 3 3
    }
    {
        map textures/transporter/panel.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen vertex
    }
    {
        map textures/transporter/panel.tga
        blendFunc GL_ONE GL_ONE
        rgbGen vertex
    }
}

textures/transporter/panel2
{
    surfaceparm nolightmap
    surfaceparm pointlight
    {
        map textures/detail/gleam2.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
        tcGen environment
        tcMod scale 3 3
    }
    {
        map textures/transporter/panel2.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen vertex
    }
    {
        map textures/transporter/panel2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen vertex
    }
}

textures/transporter/panelsmall
{
    surfaceparm nolightmap
    surfaceparm pointlight
    {
        map textures/detail/gleam2.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
        tcGen environment
        tcMod scale 3 3
    }
    {
        map textures/transporter/panelsmall.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen vertex
    }
}

textures/transporter/tranpan
{
    surfaceparm nolightmap
    surfaceparm pointlight
    {
        map textures/detail/gleam2.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
        tcGen environment
        tcMod scale 3 3
    }
    {
        map textures/transporter/tranpanb.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen vertex
    }
    {
        map textures/transporter/tranpanb.tga
        blendFunc GL_ONE GL_ONE
        rgbGen vertex
    }
}

textures/transporter/glassedge
{
    q3map_surfacelight 2800
    surfaceparm nolightmap
    surfaceparm trans
    {
        map textures/transporter/glassedge.tga
    }
    {
        map textures/engineering/glass1.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale 3 3
    }
}

textures/transporter/transpad_b
{
    surfaceparm nolightmap
    surfaceparm pointlight
    {
        map textures/detail/gleam2.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
        tcGen environment
    }
    {
        map textures/transporter/transpad_b.tga
        blendFunc GL_ONE GL_ONE
        rgbGen vertex
    }
}

textures/transporter/transpad2
{
    surfaceparm nolightmap
    surfaceparm pointlight
    {
        map textures/detail/gleam2.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
        tcGen environment
    }
    {
        map textures/transporter/transpad2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen identity
    }
}

