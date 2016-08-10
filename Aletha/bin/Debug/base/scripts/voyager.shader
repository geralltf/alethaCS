textures/voyager/liftlights_light
{
    qer_editorimage textures/voyager/liftlights.tga
    {
        map textures/voyager/liftlight_gradiant.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
        tcMod scroll 0 -2
    }
    {
        map textures/voyager/liftlights.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen identity
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/voyager/jeflight
{
    qer_editorimage textures/engineering/elight1.tga
    q3map_surfacelight 700
    surfaceparm nolightmap
    {
        map textures/engineering/elight1.tga
    }
}

textures/voyager/segment
{
    {
        map $lightmap
    }
    {
        map textures/voyager/segment.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/pulse1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.25 0.25 0.25 0.25
        tcMod scale 0.25 0.25
        tcMod scroll -0.5 -1.2
        tcMod turb 0.2 0.2 0.1 1
    }
    {
        map textures/voyager/pulse2.tga
        blendFunc GL_DST_COLOR GL_ONE
        tcMod scale 0.25 0.25
        tcMod scroll 0.5 1.5
        tcMod turb 0.2 0.2 0.1 1
    }
}

textures/voyager/stationlights
{
    q3map_surfacelight 1050
    surfaceparm nolightmap
    {
        map textures/voyager/stationlights.tga
    }
}

textures/voyager/stationlights_bright
{
    qer_editorimage textures/voyager/stationlights.tga
    q3map_surfacelight 2625
    surfaceparm nolightmap
    {
        map textures/voyager/stationlights.tga
    }
}

textures/voyager/tac3
{
    q3map_surfacelight 700
    surfaceparm nolightmap
    {
        map textures/voyager/tac3.tga
    }
}

textures/voyager/tac2
{
    q3map_surfacelight 700
    surfaceparm nolightmap
    {
        map textures/voyager/tac2.tga
    }
}

textures/voyager/tac1
{
    q3map_surfacelight 700
    surfaceparm nolightmap
    {
        map textures/voyager/tac1.tga
    }
}

textures/voyager/light_basic_dim
{
    qer_editorimage textures/voyager/light_basic.tga
    surfaceparm nolightmap
    {
        map textures/voyager/light_basic.tga
    }
}

textures/voyager/light_basic
{
    q3map_surfacelight 175
    surfaceparm nolightmap
    {
        map textures/voyager/light_basic.tga
    }
}

textures/voyager/roundlight
{
    {
        map $lightmap
        rgbGen identity
    }
    {
        map textures/voyager/roundlight.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

//textures/Voyager/divisionpanel
//{
//{
//map $lightmap
//}
//{
//map textures/Voyager/divisionpanel.tga
//blendFunc GL_DST_COLOR GL_ZERO
//}
//{
//map textures/Voyager/divisionpanel.glow.tga
//blendFunc GL_ONE GL_ONE
//rgbGen wave square 0.000000 1.000000 0.000000 0.800000
//}
//}
//textures/Voyager/runnerlights
//{
//{
//map $lightmap
//}
//{
//map textures/Voyager/runnerlights.tga
//blendFunc GL_DST_COLOR GL_ZERO
//}
//{
//map textures/Voyager/runnerlights.glow.tga
//blendFunc GL_ONE GL_ONE
//rgbGen wave square 0.000000 1.000000 0.000000 0.800000
//}
//}
textures/voyager/centerpanel
{
    q3map_surfacelight 7000
    surfaceparm nolightmap
    surfaceparm pointlight
    {
        map textures/voyager/centerpanel.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/centerpanelglow.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/voyager/centerpanelglow2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.5
    }
}

textures/voyager/tactical_base
{
    q3map_surfacelight 700
    surfaceparm nolightmap
    {
        map textures/voyager/tactical_base.tga
    }
}

textures/voyager/controlpn
{
    qer_editorimage textures/voyager/controlpn.tga
    q3map_surfacelight 700
    surfaceparm nolightmap
    {
        map textures/voyager/controlpn.tga
    }
    {
        map textures/voyager/controlpn1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 0.5 0 0.4
    }
    {
        map textures/voyager/controlpn2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 0.5 2 0.2
    }
}

textures/voyager/backpanel
{
    q3map_surfacelight 7000
    surfaceparm nolightmap
    {
        map textures/voyager/backpanel.tga
    }
    {
        map textures/engineering/glass1.tga
        blendFunc GL_ONE GL_ONE
        detail
        tcGen environment
        tcMod scale 3 3
    }
}

textures/voyager/screen_light1
{
    surfaceparm nolightmap
    {
        map textures/voyager/screen_light1.tga
        tcMod scale 2 1
        tcMod scroll -0.2 0
    }
}

textures/voyager/ceilinglight2
{
    light 1
    surfaceparm nolightmap
    {
        map textures/voyager/ceilinglight2.tga
    }
}

textures/voyager/ceilinglight
{
    light 1
    surfaceparm nolightmap
    {
        map textures/voyager/ceilinglight.tga
    }
}

textures/voyager/doorpanel_light
{
    q3map_surfacelight 7000
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
        map textures/voyager/doorpanel_light.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen vertex
    }
}

textures/voyager/panel_on
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
        map textures/voyager/panel_on.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen vertex
    }
}

textures/voyager/panel_onb
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
        map textures/voyager/panel_onb.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen vertex
    }
}

textures/voyager/doorpanel_light_ra
{
    q3map_surfacelight 7000
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
        map textures/voyager/doorpanel_light_ra.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen vertex
    }
}

textures/voyager/shippanelleft
{
    q3map_surfacelight 700
    surfaceparm nolightmap
    {
        map textures/voyager/shippanelleft.tga
    }
    {
        map textures/detail/gleam2.tga
        blendFunc GL_ONE GL_ONE
        detail
        tcGen environment
        tcMod scale 3 3
    }
}

textures/voyager/shippanelright
{
    q3map_surfacelight 700
    surfaceparm nolightmap
    {
        map textures/voyager/shippanelright.tga
    }
    {
        map textures/detail/gleam2.tga
        blendFunc GL_ONE GL_ONE
        detail
        tcGen environment
        tcMod scale 3 3
    }
}

textures/voyager/shippanel_wide
{
    q3map_surfacelight 700
    surfaceparm nolightmap
    {
        map textures/voyager/shippanel_wide.tga
    }
    {
        map textures/detail/gleam2.tga
        blendFunc GL_ONE GL_ONE
        detail
        tcGen environment
        tcMod scale 3 3
    }
}

textures/voyager/shippanel256_1
{
    q3map_surfacelight 700
    surfaceparm nolightmap
    {
        map textures/voyager/shippanel256_1.tga
    }
}

textures/voyager/shippanel256_2
{
    q3map_surfacelight 700
    surfaceparm nolightmap
    {
        map textures/voyager/shippanel256_2.tga
    }
}

textures/voyager/shippanel256_3
{
    q3map_surfacelight 700
    surfaceparm nolightmap
    {
        map textures/voyager/shippanel256_3.tga
    }
}

textures/voyager/shippanel256_4
{
    q3map_surfacelight 700
    surfaceparm nolightmap
    {
        map textures/voyager/shippanel256_4.tga
    }
}

textures/voyager/baseboard_bls
{
    q3map_surfacelight 14000
    surfaceparm nolightmap
    {
        map textures/voyager/baseboard_bls.tga
    }
}

textures/voyager/bluedesign
{
    surfaceparm nolightmap
    {
        map textures/voyager/bluedesign.tga
    }
}

textures/voyager/bridge_lightpanel
{
    q3map_surfacelight 175
    surfaceparm nolightmap
    {
        map textures/voyager/bridge_lightpanel.tga
    }
}

textures/voyager/bridge_lightpanel2
{
    q3map_surfacelight 7000
    surfaceparm nolightmap
    {
        map textures/voyager/bridge_lightpanel2.tga
    }
}

textures/voyager/bridge_lightpanel3
{
    surfaceparm nolightmap
    {
        map textures/voyager/bridge_lightpanel3.tga
    }
}

textures/voyager/light_floor
{
    q3map_surfacelight 11375
    light 1
    surfaceparm nolightmap
    {
        map textures/voyager/light_floor.tga
    }
}

//textures/Voyager/turbowall2
//{
//{
//map $lightmap
//}
//{
//map textures/Voyager/turbowall2.tga
//blendFunc GL_DST_COLOR GL_ZERO
//}
//{
//map textures/Voyager/turbowall2.glow.tga
//blendFunc GL_ONE GL_ONE
//rgbGen wave square 0.000000 1.000000 0.000000 0.800000
//}
//}
textures/voyager/turbowall3
{
    {
        map $lightmap
    }
    {
        map textures/voyager/turbowall3.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/turbowall3.glow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.8
    }
}

textures/voyager/hall_ceiling
{
    q3map_surfacelight 350
    surfaceparm nolightmap
    {
        map textures/voyager/hall_ceiling.tga
    }
}

textures/voyager/diagram1
{
    surfaceparm nolightmap
    {
        map textures/voyager/diagram1.tga
        rgbGen identity
    }
    {
        map textures/voyager/diagram1.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/voyager/diagram1shader1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 0.5 0 0.5
    }
    {
        map textures/voyager/diagram1shader2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.5
    }
    {
        map textures/voyager/diagram1shader3.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 0.2 0 4.5
    }
}

textures/voyager/forgedisplay
{
    surfaceparm nolightmap
    {
        map textures/voyager/forgedisplay.tga
        rgbGen identity
    }
    {
        map textures/voyager/forgedisplay.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/voyager/forgedisplay1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 2 3 0.2
    }
    {
        map textures/voyager/forgedisplay2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 -1 0 0.1
    }
    {
        map textures/voyager/forgedisplay3.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.1
    }
}

textures/voyager/scavdisplay
{
    surfaceparm nolightmap
    {
        map textures/voyager/scavdisplay.tga
        rgbGen identity
    }
    {
        map textures/voyager/scavdisplay.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/voyager/scavdisplay1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.2
    }
    {
        map textures/voyager/scavdisplay2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 -1 0 0.2
    }
}

textures/voyager/gundisplay
{
    surfaceparm nolightmap
    {
        map textures/voyager/gundisplay.tga
        rgbGen identity
    }
    {
        map textures/voyager/gundisplay.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/voyager/gundisplay2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.2
    }
    {
        map textures/voyager/gundisplay1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 -1 0 0.2
    }
    {
        map textures/voyager/gundisplay5.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave triangle 0 1 2 0.5
    }
}

textures/voyager/stasisdisplay
{
    qer_editorimage textures/voyager/stasisdisplay.tga
    surfaceparm nolightmap
    {
        map textures/voyager/stasisdisplayfiller.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
        tcMod scroll 0 0.2
    }
    {
        map textures/voyager/stasisdisplay.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen identity
        alphaGen identity
    }
    {
        map textures/voyager/stasisdisplay1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 1 0 0.5
    }
    {
        map textures/voyager/stasisdisplay2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 1 0 1
    }
}

textures/voyager/scavaliendisplay4
{
    surfaceparm nolightmap
    {
        map textures/voyager/scavaliendisplay4.tga
    }
    {
        map textures/voyager/scavaliendisplay4a.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.5
    }
    {
        map textures/voyager/scavaliendisplay4b.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 -1 0 0.1
    }
}

textures/voyager/scavaliendisplay2
{
    surfaceparm nolightmap
    {
        map textures/voyager/scavaliendisplay2.tga
    }
    {
        map textures/voyager/scavaliendisplay2_a.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 -1 0 0.5
    }
    {
        map textures/voyager/scavaliendisplay2_b.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 1
    }
}

textures/voyager/scavaliendisplay3
{
    surfaceparm nolightmap
    {
        map textures/voyager/scavaliendisplay3.tga
    }
    {
        map textures/voyager/scavaliendisplay3_a.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 -1 0 0.5
    }
    {
        map textures/voyager/scavaliendisplay3_b.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.5
    }
}

textures/voyager/scavaliendisplay
{
    surfaceparm nolightmap
    {
        map textures/voyager/scavaliendisplay.tga
    }
    {
        map textures/voyager/scavaliendisplay_a.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 -1 0 0.5
    }
    {
        map textures/voyager/scavaliendisplay_b.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.25
    }
}

textures/voyager/isodisplay
{
    surfaceparm nolightmap
    {
        map textures/voyager/isodisplay.tga
    }
}

textures/voyager/gundisplayc
{
    surfaceparm nolightmap
    {
        animMap 2 textures/voyager/gundisplayc1.tga textures/voyager/gundisplayc2.tga textures/voyager/gundisplayc3.tga textures/voyager/gundisplayc4.tga 
    }
}

textures/voyager/systemsanalysis
{
    surfaceparm nolightmap
    {
        map textures/voyager/systemsanalysis.tga
    }
    {
        map textures/engineering/glass1.tga
        blendFunc GL_ONE GL_ONE
        detail
        tcGen environment
        tcMod scale 3 3
    }
}

textures/voyager/biopak
{
    {
        map $lightmap
    }
    {
        map textures/voyager/biopak.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/biopakglow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 0.4 1 0.2
    }
}

textures/voyager/field_activation
{
    {
        map $lightmap
    }
    {
        map textures/voyager/field_activation.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/field_activation1.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/voyager/field_activation1a.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 1 0 0.75
    }
}

textures/voyager/field_activation2
{
    qer_editorimage textures/voyager/field_activation.tga
    {
        map $lightmap
    }
    {
        map textures/voyager/field_activation.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/field_activation2.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/voyager/field_activation2a.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.75
    }
}

textures/voyager/field_activation3
{
    qer_editorimage textures/voyager/field_activation.tga
    {
        map $lightmap
    }
    {
        map textures/voyager/field_activation.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/field_activation3.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/voyager/field_activation3a.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 1 0 1
    }
}

textures/voyager/systemsanalysisbusted
{
    {
        map $lightmap
    }
    {
        map textures/voyager/systemsanalysisbusted.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/systemsanalysisbusted1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 0.5 0 3
    }
    {
        map textures/voyager/systemsanalysisbusted1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sawtooth 0 1 0 4
    }
}

textures/voyager/datashunt1
{
    qer_editorimage textures/voyager/datashunt1.tga
    {
        map $lightmap
    }
    {
        map textures/voyager/field_activation.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/datashunt1.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/voyager/field_activation1a.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 1 0 0.75
    }
}

textures/voyager/datashunt2
{
    qer_editorimage textures/voyager/datashunt1b.tga
    {
        map $lightmap
    }
    {
        map textures/voyager/field_activation.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/datashunt1.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/voyager/datashunt1b.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.75
    }
}

textures/voyager/override1
{
    qer_editorimage textures/voyager/datashunt1.tga
    {
        map $lightmap
    }
    {
        map textures/voyager/field_activation.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/override1.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/voyager/override2
{
    qer_editorimage textures/voyager/datashunt1.tga
    {
        map $lightmap
    }
    {
        map textures/voyager/field_activation.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/override2.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/voyager/override2a.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 1 0 0.75
    }
}

textures/voyager/field_act_shorted_out
{
    qer_editorimage textures/voyager/field_activation.tga
    {
        map $lightmap
    }
    {
        map textures/voyager/field_activation.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/field_activation1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave noise 0.5 7 0 24
    }
}

textures/voyager/tactpanel_wide
{
    qer_editorimage textures/voyager/tactpanel_wide.tga
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
        map textures/voyager/tactpanel_wide.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen vertex
    }
    {
        map textures/voyager/tactpanel_wide1.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        animMap 7 textures/voyager/opspanel_widescreen1.tga textures/voyager/opspanel_widescreen8.tga textures/voyager/opspanel_widescreen7.tga textures/voyager/opspanel_widescreen6.tga textures/voyager/opspanel_widescreen5.tga textures/voyager/opspanel_widescreen4.tga textures/voyager/opspanel_widescreen3.tga textures/voyager/opspanel_widescreen2.tga 
        blendFunc GL_ONE GL_ONE
    }
    {
        animMap 7 textures/voyager/opspanel_widescreen8.tga textures/voyager/opspanel_widescreen7.tga textures/voyager/opspanel_widescreen6.tga textures/voyager/opspanel_widescreen5.tga textures/voyager/opspanel_widescreen4.tga textures/voyager/opspanel_widescreen3.tga textures/voyager/opspanel_widescreen2.tga textures/voyager/opspanel_widescreen1.tga 
        blendFunc GL_ONE GL_ONE
    }
}

textures/voyager/opspanel_wide
{
    qer_editorimage textures/voyager/opspanel_wide.tga
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
        map textures/voyager/opspanel_wide.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen vertex
    }
    {
        map textures/voyager/opspanel_wide1.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        animMap 5 textures/voyager/opspanel_widescreen1.tga textures/voyager/opspanel_widescreen8.tga textures/voyager/opspanel_widescreen7.tga textures/voyager/opspanel_widescreen6.tga textures/voyager/opspanel_widescreen5.tga textures/voyager/opspanel_widescreen4.tga textures/voyager/opspanel_widescreen3.tga textures/voyager/opspanel_widescreen2.tga 
        blendFunc GL_ONE GL_ONE
    }
}

textures/voyager/bridge_verticalsupport1
{
    {
        map $lightmap
    }
    {
        map textures/voyager/bridge_verticalsupport1.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/bridge_verticalsupport1glow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.75 1 0 0.5
    }
}

textures/voyager/divisionpanelra
{
    qer_editorimage textures/voyager/divisionpanelra.tga
    {
        map $lightmap
    }
    {
        map textures/voyager/divisionpanelra.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/divisionpanelglow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.75 2 0 0.5
    }
}

textures/voyager/voybri8_resized2ra
{
    qer_editorimage textures/voyager/voybri8_resized2ra.tga
    {
        map $lightmap
    }
    {
        map textures/voyager/voybri8_resized2ra.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/voybri8_resized2raglow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.75 1 0 0.5
    }
}

textures/voyager/controlpn3
{
    qer_editorimage textures/voyager/controlpn3.tga
    {
        map $lightmap
    }
    {
        map textures/voyager/controlpn3.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/controlpn3glowa.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/voyager/controlpn3glow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.5
    }
}

textures/voyager/runnerlights
{
    {
        map $lightmap
    }
    {
        map textures/voyager/runnerlights.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/runnerlights_glow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.75 1 0 0.5
    }
}

textures/voyager/stasisdisplay1
{
    qer_editorimage textures/voyager/stasisdisplay.tga
    surfaceparm nolightmap
    {
        map textures/voyager/stasisdisplay1bnoalpha.tga
        rgbGen identity
        alphaGen identity
    }
    {
        map textures/voyager/stasisdisplay2b.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 1 0 1
    }
}

textures/voyager/stasisdisplay2
{
    qer_editorimage textures/voyager/stasisdisplay.tga
    surfaceparm nolightmap
    {
        map textures/voyager/stasisdisplay1bnoalpha.tga
        rgbGen identity
        alphaGen identity
    }
    {
        map textures/voyager/stasisdisplay2a.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 1 0 1
    }
}

textures/voyager/turboswitchglow
{
    qer_editorimage textures/voyager/turboswitch.tga
    {
        map $lightmap
    }
    {
        map textures/voyager/turboswitch.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/turboswitchglow.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/voyager/turboswitch
{
    qer_editorimage textures/voyager/turboswitch.tga
    {
        map $lightmap
    }
    {
        map textures/voyager/turboswitch.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/turboswitchglow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0.75 0.25 0.5 1
    }
}

textures/voyager/turboswitchbroken
{
    qer_editorimage textures/voyager/turboswitch.tga
    {
        map $lightmap
    }
    {
        map textures/voyager/turboswitch.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/turboswitchglow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave random 0 0.5 0.2 1
    }
}

textures/voyager/ringdisplay
{
    qer_editorimage textures/voyager/forgedisplay.tga
    surfaceparm nolightmap
    {
        map textures/voyager/ringdisplay.tga
        rgbGen identity
    }
    {
        map textures/voyager/ringdisplay.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/voyager/ringdisplay1.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/voyager/ringdisplay2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 -1 0 0.1
    }
    {
        map textures/voyager/ringdisplay3.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.1
    }
    {
        animMap 4 textures/voyager/ringdisplay99.tga textures/voyager/ringdisplay9.tga textures/voyager/ringdisplay8.tga textures/voyager/ringdisplay7.tga textures/voyager/ringdisplay6.tga 
        blendFunc GL_ONE GL_ONE
    }
}

textures/voyager/voy1_viewscreen
{
    surfaceparm nolightmap
    {
        map textures/voyager/voy1_viewscreenspace.tga
    }
    {
        map textures/voyager/voy1_viewscreenship.tga
        blendFunc GL_ONE GL_ONE
        tcMod rotate 0.015
        tcMod stretch sin 0.9 0.5 0.5 0.02
        tcMod scale 1.05 0.91
    }
    {
        map textures/voyager/voy1_viewscreenshipglow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 1 0.5 0 0.2
        tcMod rotate 0.015
        tcMod stretch sin 0.9 0.5 0.5 0.02
        tcMod scale 1.05 0.91
    }
}

textures/voyager/tactical1
{
    {
        map $lightmap
    }
    {
        map textures/voyager/tactical1.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/tactical1glow.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/voyager/tactical2
{
    {
        map $lightmap
    }
    {
        map textures/voyager/tactical2.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/tactical2glow.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/voyager/tactical3
{
    surfaceparm nolightmap
    {
        map textures/voyager/tactical3.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/voyager/tactical4
{
    {
        map $lightmap
    }
    {
        map textures/voyager/tactical4.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/tactical4glow.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/voyager/tactical5
{
    qer_editorimage textures/voyager/tactical5.tga
    {
        map $lightmap
    }
    {
        map textures/voyager/tactical5.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/tactical5glow.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/voyager/tactical6
{
    qer_editorimage textures/voyager/tactical6.tga
    {
        map $lightmap
    }
    {
        map textures/voyager/tactical6.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/tactical6glow.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/voyager/floor4
{
    {
        map $lightmap
    }
    {
        map textures/voyager/floor4.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/voyager/floor4lit.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/voyager/floor2
{
    {
        map $lightmap
    }
    {
        clampmap textures/voyager/floor2.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        clampmap textures/voyager/floor2lit.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/voyager/floor3
{
    {
        map $lightmap
    }
    {
        clampmap textures/voyager/floor3.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        clampmap textures/voyager/floor3lit.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/voyager/floor1
{
    {
        map $lightmap
    }
    {
        clampmap textures/voyager/floor1.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        clampmap textures/voyager/floor1lit.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/voyager/voy_strip
{
    surfaceparm nonsolid
    {
        map $lightmap
    }
    {
        map textures/voyager/voy_strip.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/voyager/turbowall5
{
    surfaceparm nonsolid
    {
        map $lightmap
    }
    {
        map textures/voyager/turbowall5.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/voyager/turbowall2
{
    surfaceparm nonsolid
    {
        map $lightmap
    }
    {
        map textures/voyager/turbowall2.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/cargo/cargodoor1
{
    {
        map $lightmap
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
    }
    {
        map textures/cargo/cargodoor1b.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}

textures/cargo/panel1
{
    q3map_surfacelight 7000
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
        map textures/cargo/panel1.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen vertex
    }
}

textures/cargo/cargobars
{
    surfaceparm trans
    cull disable
    {
        map textures/cargo/cargobars.tga
        alphaFunc GT0
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        depthWrite
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        depthFunc equal
    }
}

textures/cargo/clamps
{
    {
        map $lightmap
    }
    {
        map textures/cargo/clamps.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/cargo/clampsa.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/cargo/clamps2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 1 0.5 0 0.5
    }
    {
        map textures/cargo/clamps4.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 1
    }
}

textures/cargo/clampsclear
{
    {
        map $lightmap
    }
    {
        map textures/cargo/clamps.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
    {
        map textures/cargo/clampsa.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/cargo/clampsclear.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/cargo/clampsclear.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 0.5 0 0.5
    }
}

textures/cargo/hazardousmaterials
{
    qer_editorimage textures/cargo/hazardousmaterials.tga
    surfaceparm nolightmap
    surfaceparm pointlight
    {
        map textures/detail/gleam2.tga
        blendFunc GL_ONE GL_ZERO
        tcGen environment
        tcMod scale 3 3
    }
    {
        map textures/cargo/hazardousmaterials.tga
        blendFunc GL_ONE GL_SRC_ALPHA
    }
    {
        map textures/cargo/hazardouspurge.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.5
    }
}

textures/cargo/hazardousenable
{
    qer_editorimage textures/cargo/hazardousenable.tga
    surfaceparm nolightmap
    surfaceparm pointlight
    {
        map textures/detail/gleam2.tga
        blendFunc GL_ONE GL_ZERO
        tcGen environment
        tcMod scale 3 3
    }
    {
        map textures/cargo/hazardousmaterials.tga
        blendFunc GL_ONE GL_SRC_ALPHA
    }
    {
        map textures/cargo/hazardouspurge.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/cargo/hazardousenable.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.5
    }
}

textures/cargo/hazardouscomplete
{
    qer_editorimage textures/cargo/hazardousmaterials.tga
    surfaceparm nolightmap
    surfaceparm pointlight
    {
        map textures/detail/gleam2.tga
        blendFunc GL_ONE GL_ZERO
        tcGen environment
        tcMod scale 3 3
    }
    {
        map textures/cargo/hazardousmaterials.tga
        blendFunc GL_ONE GL_SRC_ALPHA
    }
    {
        map textures/cargo/hazardouscomplete.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.5
    }
}

textures/cargo/cargodoor1_h
{
    qer_editorimage textures/cargo/cargodoor1b.tga
    {
        map $lightmap
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
        alphaGen entity
    }
    {
        map textures/cargo/cargodoor1b.tga
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
        alphaGen entity
    }
}

textures/cargo/cargowall_base_h
{
    qer_editorimage textures/cargo/cargowall_base.tga
    {
        map textures/cargo/cargowall_base.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen vertex
        alphaGen entity
    }
}

textures/cargo/panel1_h
{
    qer_editorimage textures/cargo/panel1.tga
    q3map_surfacelight 7000
    surfaceparm nolightmap
    surfaceparm pointlight
    {
        map textures/detail/gleam2.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
        alphaGen entity
        tcGen environment
        tcMod scale 3 3
    }
    {
        map textures/cargo/panel1.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen vertex
    }
}

textures/cargo/walllow_h
{
    qer_editorimage textures/cargo/walllow.tga
    {
        map textures/cargo/walllow2.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen vertex
        alphaGen entity
    }
}

textures/cargo/walltop_h
{
    qer_editorimage textures/cargo/walltop.tga
    {
        map textures/cargo/walltop.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen vertex
    }
}

textures/cargo/panel1_b
{
    qer_editorimage textures/cargo/panel1_b.tga
    {
        map $lightmap
    }
    {
        map textures/cargo/panel1_b.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/cargo/panel1_bglow2.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/cargo/panel1_b2
{
    qer_editorimage textures/cargo/panel1_bglow2a.tga
    {
        map $lightmap
    }
    {
        map textures/cargo/panel1_b.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        animMap 4 textures/cargo/panel1_bglow2h.tga textures/cargo/panel1_bglow2g.tga textures/cargo/panel1_bglow2f.tga textures/cargo/panel1_bglow2e.tga textures/cargo/panel1_bglow2d.tga textures/cargo/panel1_bglow2c.tga textures/cargo/panel1_bglow2b.tga textures/cargo/panel1_bglow2a.tga 
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/cargo/panel1_bglow2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 0.25 0 0.0001
    }
}

textures/cargo/panel1_c
{
    qer_editorimage textures/cargo/panel1_b.tga
    {
        map $lightmap
    }
    {
        map textures/cargo/panel1_b.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        animMap 2 textures/cargo/panel1_bglowa.tga textures/cargo/panel1_bglowb.tga textures/cargo/panel1_bglowc.tga textures/cargo/panel1_bglowd.tga textures/cargo/panel1_bglowe.tga textures/cargo/panel1_bglowf.tga textures/cargo/panel1_bglowg.tga textures/cargo/panel1_bglowh.tga 
        blendFunc GL_ONE GL_ONE
    }
}

textures/cargo/panel1_c2
{
    qer_editorimage textures/cargo/panel1_bglowa.tga
    {
        map $lightmap
    }
    {
        map textures/cargo/panel1_b.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/cargo/panel1_bglowh.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/cargo/panel1_bglow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 0.25 0 0.0001
    }
}

textures/cargo/ceraton1
{
    {
        map $lightmap
    }
    {
        map textures/cargo/ceratonframe.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/cargo/ceraton1offline.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/cargo/ceraton2
{
    qer_editorimage textures/cargo/ceratonframe.tga
    {
        map $lightmap
    }
    {
        map textures/cargo/ceratonframe.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/cargo/ceraton1a.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/cargo/ceraton1warning.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.5
    }
    {
        map textures/cargo/ceraton1warning.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.7 1 0 0.5
    }
}

textures/sickbay/light
{
    q3map_surfacelight 525
    surfaceparm nolightmap
    {
        map textures/sickbay/light.tga
    }
}

textures/sickbay/medlight
{
    qer_editorimage textures/sickbay/medlight_old.tga
    q3map_surfacelight 70
    {
        map $lightmap
    }
    {
        map textures/sickbay/medlight.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/sickbay/medlight.blend.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/sickbay/lights
{
    qer_editorimage textures/sickbay/lights_old.tga
    q3map_surfacelight 1050
    {
        map $lightmap
    }
    {
        map textures/sickbay/lights3.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/sickbay/lights2.blend.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/sickbay/toplight2
{
    q3map_surfacelight 525
    surfaceparm nolightmap
    {
        map textures/sickbay/toplight2.tga
    }
}

textures/sickbay/toplight
{
    q3map_surfacelight 525
    surfaceparm nolightmap
    {
        map textures/sickbay/toplight.tga
    }
}

textures/sickbay/overlight
{
    q3map_surfacelight 350
    surfaceparm nolightmap
    {
        map textures/sickbay/overlight.tga
    }
}

textures/sickbay/basiclt_h
{
    qer_editorimage textures/sickbay/basiclt.tga
    {
        map $lightmap
        alphaGen entity
    }
    {
        map textures/sickbay/basiclt.tga
        blendFunc GL_DST_COLOR GL_ZERO
        alphaGen entity
    }
}

textures/sickbay/e_wall2_h
{
    qer_editorimage textures/sickbay/e_wall2.tga
    {
        map $lightmap
        alphaGen entity
    }
    {
        map textures/sickbay/e_wall2.tga
        blendFunc GL_DST_COLOR GL_ZERO
        alphaGen entity
    }
}

textures/sickbay/panel14_b
{
    {
        map $lightmap
    }
    {
        map textures/sickbay/panel14frame.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/sickbay/panel14glow.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/sickbay/panel8
{
    {
        map $lightmap
    }
    {
        map textures/sickbay/panel14frame.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/sickbay/panel8glow.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/sickbay/wallcpu2_b
{
    {
        map $lightmap
    }
    {
        map textures/sickbay/wallcpu2_bframe.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/sickbay/wallcpu2_bglow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 1.75 1 0 0.5
    }
}

textures/sickbay/wallcpu4_b
{
    {
        map $lightmap
    }
    {
        map textures/sickbay/wallcpu4_bframe.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/sickbay/wallcpu4_bglow.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/sickbay/bedtopcomputer_b
{
    {
        map $lightmap
    }
    {
        map textures/sickbay/bedtopcomputer_bframe.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/sickbay/bedtopcomputer_bglow.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/sickbay/wallcpu
{
    {
        map $lightmap
    }
    {
        map textures/sickbay/wallcpu.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        animMap 1 textures/sickbay/wallcpuglow1.tga textures/sickbay/wallcpuglow2.tga 
        blendFunc GL_ONE GL_ONE
    }
}

textures/conference/light_basic_dim
{
    qer_editorimage textures/conference/light_basic.tga
    q3map_surfacelight 150
    surfaceparm nolightmap
    {
        map textures/conference/light_basic.tga
    }
}

textures/conference/light_basic
{
    q3map_surfacelight 525
    surfaceparm nolightmap
    {
        map textures/conference/light_basic.tga
    }
}

textures/conference/cscreen2
{
    q3map_surfacelight 700
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
        map textures/conference/cscreen2.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen vertex
    }
}

textures/conference/cscreen
{
    surfaceparm nolightmap
    {
        map textures/conference/cscreen.tga
    }
    {
        map textures/conference/cscreenglow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.5
    }
    {
        animMap 8 textures/conference/cscreenglow8.tga textures/conference/cscreenglow7.tga textures/conference/cscreenglow6.tga textures/conference/cscreenglow5.tga textures/conference/cscreenglow4.tga textures/conference/cscreenglow3.tga textures/conference/cscreenglow2.tga textures/conference/cscreenglow1.tga 
        blendFunc GL_ONE GL_ONE
    }
}

textures/common/sky
{
    surfaceparm noimpact
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm sky
    skyParms env/stars 512 -
}

textures/common/sky_light
{
    qer_editorimage textures/common/sky.tga
    q3map_surfacelight 125
    surfaceparm noimpact
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm sky
    q3map_sun 1 0.75 0.75 75 65 65
    skyParms env/junk 512 -
}

textures/common/junk_sky
{
    qer_editorimage textures/common/sky.tga
    surfaceparm noimpact
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm sky
    skyParms env/junk 512 -
}

textures/common/camelot
{
    qer_editorimage textures/common/sky.tga
    surfaceparm noimpact
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm sky
    skyParms env/camelot 512 -
}

textures/common/sky_red
{
    qer_editorimage textures/common/sky.tga
    surfaceparm noimpact
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm sky
    skyParms env/redsky 512 -
}

textures/common/stars_new
{
    qer_editorimage textures/common/sky.tga
    surfaceparm noimpact
    surfaceparm nomarks
    surfaceparm nolightmap
    surfaceparm sky
    skyParms env/stars 512 -
    {
        map textures/common/sky.tga
        tcMod scroll -0.01 0
    }
}

textures/hall/primaryhall_basiclight2
{
    q3map_surfacelight 1050
    {
        map $lightmap
    }
    {
        map textures/hall/primaryhall_basiclight.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/hall/primaryhall_basiclight_blend.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/hall/secondhall_tex
{
    {
        map $lightmap
    }
    {
        map textures/hall/secondhall_tex.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/hall/secondhall_tex_glow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.8
    }
}

textures/hall/secondhall_tex_ra
{
    {
        map $lightmap
    }
    {
        map textures/hall/secondhall_tex.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/hall/secondhall_tex_glow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.8
    }
}

textures/hall/secondhall_texlong
{
    {
        map $lightmap
    }
    {
        map textures/hall/secondhall_texlong.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/hall/secondhall_texlong_glow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.8
    }
}

textures/hall/secondhall_texlongra
{
    {
        map $lightmap
    }
    {
        map textures/hall/secondhall_texlong.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/hall/secondhall_texlong_glow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 0.8
    }
}

textures/hall/hall_light_nogrid
{
    qer_editorimage textures/hall/primaryhall_light.tga
    q3map_surfacelight 175
    surfaceparm nolightmap
    {
        map textures/hall/primaryhall_light.tga
    }
}

textures/hall/halllight
{
    q3map_surfacelight 700
    surfaceparm nolightmap
    {
        map textures/hall/halllight.tga
    }
}

textures/hall/deck9
{
    surfaceparm nolightmap
    {
        map textures/hall/deck9.tga
    }
    {
        map textures/hall/deck9cp.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 1 0.5 0 0.5
    }
    {
        map textures/hall/deck9green.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/hall/deck9red.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 1 1 0 1
    }
    {
        map textures/hall/deck9green.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/hall/deck9red.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/hall/deck9red
{
    surfaceparm nolightmap
    {
        map textures/hall/deck9.tga
    }
    {
        map textures/hall/deck9cp.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 1 0.5 0 0.5
    }
    {
        map textures/hall/deck9red2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 1 1 0 1
    }
    {
        map textures/hall/deck9red2.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/hall/deck9tubes
{
    surfaceparm nolightmap
    {
        map textures/hall/deck9starboard.tga
    }
    {
        map textures/hall/deck9red2.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/hall/deck9tubes.tga
        blendFunc GL_ONE GL_ONE
    }
    {
        map textures/hall/deck9tubes2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 1 0 1
    }
    {
        map textures/hall/deck9red2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 1 1 0 1
    }
    {
        map textures/hall/deck9starboardcp.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 1 0.5 0 0.5
    }
}

textures/hall/hall_light_red
{
    qer_editorimage textures/hall/redlight.tga
    q3map_surfacelight 500
    surfaceparm nolightmap
    {
        map textures/hall/redlight.tga
    }
}

textures/hall/halllight_off
{
    qer_editorimage textures/hall/halllight.tga
    {
        map $lightmap
    }
    {
        map textures/hall/halllight.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
}

textures/hall/hallight_flash
{
    qer_editorimage textures/hall/halllight.tga
    {
        map $lightmap
    }
    {
        map textures/hall/halllight.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/hall/halllight.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave random 0 0.5 0 1
    }
}

textures/hall/isodisplay1
{
    surfaceparm nolightmap
    {
        animMap 6 textures/hall/isodisplay8.tga textures/hall/isodisplay7.tga textures/hall/isodisplay6.tga textures/hall/isodisplay4.tga textures/hall/isodisplay3.tga textures/hall/isodisplay2.tga textures/hall/isodisplay1.tga 
    }
    {
        map textures/hall/isodisplayglow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 1.5 1 0.4 0.8575
    }
}

textures/hall/deck4
{
    surfaceparm nolightmap
    nopicmip
    {
        map textures/hall/deck4.tga
    }
    {
        map textures/hall/deck4a.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave square 0 0.25 0 0.25
    }
    {
        map textures/hall/deck4b.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 1 0.5 0 0.5
    }
}

textures/hall/jeffries2
{
    {
        map $lightmap
    }
    {
        map textures/hall/jeffries2.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/hall/jeffries2a.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave noise 0.75 0.5 0 1
    }
}

textures/hall/starfleetcommand
{
    {
        map $lightmap
        tcMod scale 0 0
    }
    {
        map textures/hall/starfleetcommand.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/detail/gleam2.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale 3 3
    }
}

textures/hall/starfleetcommand2
{
    qer_editorimage textures/hall/starfleetcommand.tga
    {
        map $lightmap
        tcMod scale 0 0
    }
    {
        map textures/hall/starfleetcommand2.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/detail/gleam2.tga
        blendFunc GL_ONE GL_ONE
        tcGen environment
        tcMod scale 3 3
    }
}

textures/astrometrics/consolemid
{
    {
        map $lightmap
    }
    {
        map textures/astrometrics/consolemid2frame.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/astrometrics/consolemid.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/astrometrics/consolemid2
{
    qer_editorimage textures/astrometrics/consolemid2frame.tga
    {
        map $lightmap
    }
    {
        map textures/astrometrics/consolemid2frame.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/astrometrics/consolemid2.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/astrometrics/consoleright
{
    {
        map $lightmap
    }
    {
        map textures/astrometrics/consolerightframe.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/astrometrics/consoleright.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/astrometrics/consoleright2
{
    qer_editorimage textures/astrometrics/consolerightframe.tga
    {
        map $lightmap
    }
    {
        map textures/astrometrics/consolerightframe.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/astrometrics/consoleright2.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/astrometrics/consoleleft
{
    qer_editorimage textures/astrometrics/consolerightframe.tga
    {
        map $lightmap
    }
    {
        map textures/astrometrics/consolerightframe.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/astrometrics/consoleleft.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/astrometrics/consoleleft2
{
    qer_editorimage textures/astrometrics/consolerightframe.tga
    {
        map $lightmap
    }
    {
        map textures/astrometrics/consolerightframe.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/astrometrics/consoleleft2.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/astrometrics/astrofloor
{
    {
        map $lightmap
    }
    {
        map textures/astrometrics/astrofloor.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/astrometrics/astrofloorglow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.3 0.05 0 0.025
    }
}

textures/astrometrics/keys
{
    {
        map $lightmap
    }
    {
        map textures/astrometrics/keys.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/astrometrics/keysglow.tga
        blendFunc GL_ONE GL_ONE
    }
}

textures/astrometrics/controlsl
{
    {
        map $lightmap
    }
    {
        map textures/astrometrics/controlsl.tga
        blendFunc GL_DST_COLOR GL_ZERO
    }
    {
        map textures/astrometrics/controlslglow.tga
        blendFunc GL_ONE GL_ONE
    }
}

