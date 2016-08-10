electricalExplosionFast
{
    cull disable
    sort additive
    {
        animMap 12 gfx/misc/exp01_1.tga gfx/misc/exp01_2.tga gfx/misc/exp01_3.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave inversesawtooth 0 1 0 12
    }
    {
        animMap 12 gfx/misc/exp01_2.tga gfx/misc/exp01_3.tga gfx/colors/black.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave sawtooth 0 1 0 12
    }
}

electricalExplosionSlow
{
    cull disable
    sort additive
    {
        animMap 6 gfx/misc/exp01_1.tga gfx/misc/exp01_2.tga gfx/misc/exp01_3.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave inversesawtooth 0 1 0 6
    }
    {
        animMap 6 gfx/misc/exp01_2.tga gfx/misc/exp01_3.tga gfx/colors/black.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave sawtooth 0 1 0 6
    }
}

surfaceExplosion
{
    cull disable
    sort additive
    {
        animMap 4 gfx/misc/exp02_1.tga gfx/misc/exp02_2.tga gfx/misc/exp02_3.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave inversesawtooth 0 1 0 4
    }
    {
        animMap 4 gfx/misc/exp02_2.tga gfx/misc/exp02_3.tga gfx/colors/black.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave sawtooth 0 1 0 4
    }
}

borgShield
{
    cull disable
    sort additive
    {
        animMap 5 gfx/misc/exp03_1.tga gfx/misc/exp03_2.tga gfx/misc/exp03_3.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave inversesawtooth 0 1 0 5
    }
    {
        animMap 5 gfx/misc/exp03_2.tga gfx/misc/exp03_3.tga gfx/colors/black.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave sawtooth 0 1 0 53
    }
}

scavExplosion
{
    cull disable
    sort additive
    {
        animMap 4 gfx/misc/exp04_1.tga gfx/misc/exp04_2.tga gfx/misc/exp04_3.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave inversesawtooth 0 1 0 4
    }
    {
        animMap 4 gfx/misc/exp04_2.tga gfx/misc/exp04_3.tga gfx/colors/black.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave sawtooth 0 1 0 4
    }
}

scavExplosionSlow
{
    cull disable
    sort additive
    {
        animMap 4.4 gfx/misc/exp04_1.tga gfx/misc/exp04_2.tga gfx/misc/exp04_3.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave inversesawtooth 0 1 0 4.4
    }
    {
        animMap 4.4 gfx/misc/exp04_2.tga gfx/misc/exp04_3.tga gfx/colors/black.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave sawtooth 0 1 0 4.4
    }
}

scavExplosionFast
{
    cull disable
    sort additive
    {
        animMap 7.5 gfx/misc/exp04_1.tga gfx/misc/exp04_2.tga gfx/misc/exp04_3.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave inversesawtooth 0 1 0 7.5
    }
    {
        animMap 7.5 gfx/misc/exp04_2.tga gfx/misc/exp04_3.tga gfx/colors/black.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave sawtooth 0 1 0 7.5
    }
}

quantumHit
{
    cull disable
    sort additive
    {
        map gfx/misc/bigshock1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen oneMinusEntity
    }
    {
        map gfx/misc/bigshock.tga
        blendFunc GL_ONE GL_ONE
    }
}

quantumAltExplosion
{
    cull disable
    sort additive
    {
        animMap 15 gfx/misc/bigboom.tga gfx/misc/bigshock1.tga gfx/misc/bigshock.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave inversesawtooth 0 1 0 15
    }
    {
        animMap 15 gfx/misc/bigshock1.tga gfx/misc/bigshock.tga gfx/colors/black.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave sawtooth 0 1 0 15
    }
}

quantumExplosion
{
    cull disable
    sort additive
    {
        animMap 4 gfx/misc/ypuff1.tga gfx/misc/ypuff2.tga gfx/misc/ypuff3.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave inversesawtooth 0 1 0 4
    }
    {
        animMap 4 gfx/misc/ypuff2.tga gfx/misc/ypuff3.tga gfx/colors/black.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave sawtooth 0 1 0 4
    }
}

imodexplosion
{
    cull disable
    sort additive
    {
        animMap 17.5 gfx/misc/iboom1.tga gfx/misc/iboom2.tga gfx/misc/iboom3.tga gfx/misc/iboom4.tga gfx/misc/iboom5.tga gfx/misc/iboom6.tga gfx/misc/iboom7.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave inversesawtooth 0 1 0 17.5
    }
    {
        animMap 17.5 gfx/misc/iboom2.tga gfx/misc/iboom3.tga gfx/misc/iboom4.tga gfx/misc/iboom5.tga gfx/misc/iboom6.tga gfx/misc/iboom7.tga gfx/colors/black.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen wave sawtooth 0 1 0 17.5
    }
}

yellowflash
{
    cull disable
    sort additive
    {
        animMap 6.75 gfx/misc/qflare.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave inversesawtooth 0 1 0 6.75
	}
    {
        animMap 6.75 gfx/colors/black.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sawtooth 0 1 0 6.75
    }
}

gfx/misc/exp11_1
{
    cull disable
    sort additive
    {
        map gfx/misc/brool1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen oneMinusEntity
    }
    {
        map gfx/misc/brool2.tga
        blendFunc GL_ONE GL_ONE
    }
}

gfx/misc/exp11_2
{
    cull disable
    sort additive
    {
        map gfx/misc/brool2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen oneMinusEntity
    }
    {
        map gfx/misc/brool3.tga
        blendFunc GL_ONE GL_ONE
    }
}

gfx/misc/exp11_3
{
    cull disable
    sort additive
    {
        map gfx/misc/brool3.tga
        blendFunc GL_ONE GL_ONE
        rgbGen oneMinusEntity
    }
    {
        map gfx/misc/brool4.tga
        blendFunc GL_ONE GL_ONE
    }
}

gfx/misc/exp11_4
{
    cull disable
    sort additive
    {
        map gfx/misc/brool4.tga
        blendFunc GL_ONE GL_ONE
        rgbGen oneMinusEntity
    }
    {
        map gfx/misc/brool5.tga
        blendFunc GL_ONE GL_ONE
    }
}

gfx/misc/exp11_5
{
    cull disable
    sort additive
    {
        map gfx/misc/brool5.tga
        blendFunc GL_ONE GL_ONE
        rgbGen oneMinusEntity
    }
    {
        map gfx/misc/brool6.tga
        blendFunc GL_ONE GL_ONE
    }
}

gfx/misc/exp11_6
{
    cull disable
    sort additive
    {
        map gfx/misc/brool6.tga
        blendFunc GL_ONE GL_ONE
        rgbGen oneMinusEntity
    }
}

models/weaphits/nuke1
{
    cull disable
    sort additive
    {
        map models/weaphits/nuke1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen oneMinusEntity
    }
}

models/weaphits/nuke2
{
    cull disable
    sort additive
    {
        map models/weaphits/nuke2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen oneMinusEntity
    }
}

models/weaphits/nuke3
{
    cull disable
    sort additive
    {
        map models/weaphits/nuke3.tga
        blendFunc GL_ONE GL_ONE
        rgbGen oneMinusEntity
        tcMod scroll 1 0
    }
}

models/weaphits/nuke4
{
    cull disable
    sort additive
    {
        map models/weaphits/nuke4.tga
        blendFunc GL_ONE GL_ONE
        rgbGen oneMinusEntity
        tcMod scroll -2 0
    }
}

