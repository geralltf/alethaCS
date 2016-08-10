models/chunks/glass/glchunks
{
    qer_trans 0.5
    surfaceparm trans
    {
        map models/chunks/glass/glchunks.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen lightingDiffuse
        tcGen environment
        tcMod scale 3 3
    }
}

models/chunks/glass/glchunks_2
{
    qer_trans 0.5
    surfaceparm trans
    {
        map models/chunks/glass/glchunks_2.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen lightingDiffuse
        tcGen environment
        tcMod scale 3 3
    }
}

textures/test/target
{
    {
        map textures/test/target.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

textures/test/teststrobe
{
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/common/mirror1.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/voyager/pulse1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.25 0.25 0.25
        tcMod turb 0.2 0.2 0.1 1
        tcMod scale 0.25 0.25
        tcMod scroll -0.5 -1.2
    }
}

gfx/misc/borgeyeflare
{
    cull disable
    {
        map gfx/misc/borgeyeflare.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        alphaGen vertex
    }
}

gfx/misc/spark_or
{
    cull disable
    {
        map gfx/misc/ophaser.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        alphaGen vertex
    }
}

gfx/effects/electric_or
{
    cull disable
    {
        map gfx/effects/electric_or.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen vertex
        alphaGen vertex
    }
}

