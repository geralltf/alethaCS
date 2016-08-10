////////////
////////////////////////////
//lights
////////////////////////////
///////////
textures/decals/light_flicker_white
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/light_flicker_white.tga
        blendFunc GL_DST_COLOR GL_ONE
        rgbGen wave random 0 1 0 0.2
    }
}

textures/decals/light_flicker_red
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/light_flicker_red.tga
        blendFunc GL_DST_COLOR GL_ONE
        rgbGen wave random 0 1 0 0.2
    }
}

textures/decals/light_flicker_cyan
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/light_flicker_cyan.tga
        blendFunc GL_DST_COLOR GL_ONE
        rgbGen wave random 0 1 0 0.2
    }
}

textures/decals/dam2
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/dam2.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/dam3
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/dam3.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/dam4
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/dam4.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/dam5
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/dam5.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/dam6
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/dam6.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/dam7
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/dam7.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/imperial
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/imperial.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/bloodsplatter
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/bloodsplatter.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/noescape
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/noescape.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/oilspots
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/oilspots.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/oilspots2
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/oilspots2.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/tics
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/tics.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/ahope-1
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/ahope-1.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/bullet_hole
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/bullet_hole.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/helpme
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/helpme.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/kbloods
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/kbloods.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/klingon_decal
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/klingon_decal.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/cards
{
    surfaceparm nomarks
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/cards.tga
        alphaFunc GE128
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        depthFunc equal
        rgbGen identity
    }
}

textures/decals/burnmark1
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/burnmark1.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/burnmark3
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/burnmark3.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/burnmark4
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/burnmark4.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/burnmark5
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/burnmark5.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/burnmark6
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/burnmark6.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/burnmark7
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/burnmark7.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/burnmark8
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/burnmark8.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/bloodmark
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/bloodmark.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/bloodmark2
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/bloodmark2.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/bloodmark3
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/bloodmark3.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/empire
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/empire.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/empire2
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/empire2.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/empire3
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/empire3.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/empire4
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/empire4.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/empire5
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/empire5.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/empire5_dam
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/empire5_dam.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/gun1
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/gun1.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/gun2
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/gun2.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/klingon_bloodmark
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/klingon_bloodmark.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/klingon_bloodmark2
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/klingon_bloodmark2.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/bullethole_maj
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/bullethole_maj.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/bulletmark2
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/bulletmark2.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/bulletmarks
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/bulletmarks.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/empire_blue
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/empire_blue.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/empire_blue_dam
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/empire_blue_dam.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/bloodystuff
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/bloodystuff.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/bulletmark3
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/bulletmark3.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/bulletmark5
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/bulletmark5.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/twirlburn
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/twirlburn.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/bulletmark4
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/bulletmark4.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/bulletmark6
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/bulletmark6.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/meltmark
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/meltmark.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/meltmark2
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/meltmark2.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/mainengineering
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/mainengineering.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/voydam_1
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/voydam_1.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/voydam_2
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/voydam_2.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/voydam_3
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/voydam_3.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/voydam_6
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/voydam_6.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/turbolift
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/turbolift.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen identity
    }
}

textures/decals/jeffries_conpanel
{
    surfaceparm noimpact
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/jeffries_conpanel.tga
        alphaFunc GT0
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
}

textures/decals/arrow
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/arrow.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/hazardous
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/hazardous.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/hazardous_upper
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/hazardous_upper.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/hazardous_lower
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/hazardous_lower.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/deck11
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/deck11.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/deck12
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/deck12.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/deck8
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/deck8.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/dam_borg
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/dam_borg.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/dam_borg2
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/dam_borg2.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/dam_borg3
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/dam_borg3.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/deck9
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/deck9.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/delta
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/delta.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/deck10
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/deck10.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/eliteetch
{
    qer_editorimage textures/decals/eliteetch.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/eliteetch.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/deck2
{
    qer_editorimage textures/decals/deck2.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/deck2.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/lmunro
{
    qer_editorimage textures/decals/lockermunro.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/lockermunro.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/lbiess
{
    qer_editorimage textures/decals/lockerbiess.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/lockerbiess.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/lchang
{
    qer_editorimage textures/decals/lockerchang.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/lockerchang.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/lchell
{
    qer_editorimage textures/decals/lockerchell.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/lockerchell.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/lchellchump
{
    qer_editorimage textures/decals/lockerchellchump.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/lockerchellchump.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/lfoster
{
    qer_editorimage textures/decals/lockerfoster.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/lockerfoster.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/lmurphy
{
    qer_editorimage textures/decals/lockermurphy.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/lockermurphy.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/ljurot
{
    qer_editorimage textures/decals/lockerjurot.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/lockerjurot.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/llathrop
{
    qer_editorimage textures/decals/lockerlathrop.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/lockerlathrop.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/lodell
{
    qer_editorimage textures/decals/lockerodell.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/lockerodell.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/loviedo
{
    qer_editorimage textures/decals/lockeroviedo.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/lockeroviedo.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/lcstalos
{
    qer_editorimage textures/decals/lockercsatlos.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/lockercsatlos.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/ljaworski
{
    qer_editorimage textures/decals/lockerjaworski.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/lockerjaworski.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/lnelson
{
    qer_editorimage textures/decals/lockernelson.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/lockernelson.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/llaird
{
    qer_editorimage textures/decals/lockerlaird.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/lockerlaird.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/lockermunro
{
    qer_editorimage textures/decals/lockermunro.tga
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/decals/lockermunro.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/decals/lockerbiess
{
    qer_editorimage textures/decals/lockerbiess2.tga
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/decals/lockerbiess2.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/decals/lockerchang
{
    qer_editorimage textures/decals/lockerchang.tga
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/decals/lockerchang.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/decals/lockerchell
{
    qer_editorimage textures/decals/lockerchell.tga
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/decals/lockerchell.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/decals/lockerfoster
{
    qer_editorimage textures/decals/lockerfoster.tga
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/decals/lockerfoster.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/decals/lockermurphy
{
    qer_editorimage textures/decals/lockermurphy.tga
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/decals/lockermurphy.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/decals/lockerjurot
{
    qer_editorimage textures/decals/lockerjurot.tga
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/decals/lockerjurot.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/decals/lockerlathrop
{
    qer_editorimage textures/decals/lockerlathrop.tga
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/decals/lockerlathrop.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/decals/lockerodell
{
    qer_editorimage textures/decals/lockerodell.tga
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/decals/lockerodell.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/decals/lockeroviedo
{
    qer_editorimage textures/decals/lockeroviedo.tga
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/decals/lockeroviedo.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/decals/lockerbiess2
{
    qer_editorimage textures/decals/lockerbiess2.tga
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/decals/lockerbiess2.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/decals/lockercsatlos
{
    qer_editorimage textures/decals/lockercsatlos.tga
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/decals/lockercsatlos.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/decals/lockerjaworski
{
    qer_editorimage textures/decals/lockerjaworski.tga
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/decals/lockerjaworski.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/decals/lockernelson
{
    qer_editorimage textures/decals/lockernelson.tga
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/decals/lockernelson.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/decals/lockerlaird
{
    qer_editorimage textures/decals/lockerlaird.tga
    surfaceparm nolightmap
    polygonOffset
    {
        map textures/decals/lockerlaird.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/decals/holodeck_sim2
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/holodeck_sim2.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/yellowline
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/yellowline.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/whiteline
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/whiteline.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/deck3
{
    qer_editorimage textures/decals/deck3.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/deck3.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/deck1
{
    qer_editorimage textures/decals/deck1.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/deck1.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/deck4
{
    qer_editorimage textures/decals/deck4.tga
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/deck4.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/holodeck_sim3
{
    qer_editorimage textures/decals/holodeck_sim3.tga
    surfaceparm alphashadow
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/holodeck_sim3.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/bunker_roof
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/bunker_roof.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/floorlights
{
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/floorlights.tga
        alphaFunc GT0
        blendFunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
    }
}

textures/decals/slashmark
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/slashmark.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/slashmark2
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/slashmark2.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

textures/decals/bposter
{
    surfaceparm nolightmap
    surfaceparm pointlight
    polygonOffset
    {
        map textures/decals/bposter.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen vertex
    }
}

textures/decals/paristrack
{
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm trans
    polygonOffset
    {
        map textures/decals/paristrack.tga
        alphaFunc GT0
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
}

