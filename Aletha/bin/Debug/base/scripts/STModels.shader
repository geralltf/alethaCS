//need to rip this out of the skin page to do it
models/weapons2/phaser/glowpanel
{
    {
        map models/weapons2/phaser/glow.tga
        rgbGen identity
        tcMod scroll 0 1
    }
}

models/weapons2/phaser/glow
{
    cull disable
    {
        map models/weapons2/phaser/glow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.9 0.2 1 1
    }
}

models/weapons2/phaser/red_glow
{
    cull disable
    {
        map models/weapons2/phaser/red_glow.tga
        blendFunc GL_ONE GL_ONE
    }
}

models/weapons2/phaser/muzzle
{
    cull disable
    {
        map models/weapons2/phaser/muzzle.tga
        blendFunc GL_ONE GL_ONE
    }
}

models/mapobjects/cargo/sm_plant
{
    cull disable
    {
        map models/mapobjects/cargo/sm_plant.tga
        alphaFunc GE128
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        depthWrite
        rgbGen vertex
    }
}

models/mapobjects/cargo/delt_panel
{
    {
        map models/mapobjects/cargo/delt_panel.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        depthWrite
        rgbGen lightingDiffuse
    }
}

models/mapobjects/cargo/enhancer_on
{
    {
        map models/mapobjects/cargo/enhancer_on.tga
        blendFunc GL_SRC_ALPHA GL_SRC_ALPHA
        depthWrite
        rgbGen wave sin 0 1 0 2.5
    }
    {
        map models/mapobjects/cargo/enhancer_on.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/cargo/bulleye
{
    {
        map models/mapobjects/cargo/bulleye.tga
        depthWrite
        rgbGen wave sin 0 1.75 0 1.25
    }
}

models/mapobjects/cargo/exam_table_copy
{
    {
        map models/mapobjects/cargo/exam_table_copy.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
    }
    {
        map models/mapobjects/cargo/exam_table_copy.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        rgbGen wave sin 0 1 0 1
    }
    {
        map models/mapobjects/cargo/exam_table_copy.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/cargo/scanner_copy
{
    {
        map textures/dreadnought/school2.tga
        depthWrite
        tcMod scale 1.5 1.5
        tcMod scroll 0 0.5
    }
    {
        map models/mapobjects/cargo/scanner.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/cargo/panel_2
{
    {
        map models/mapobjects/forge/text.tga
        depthWrite
        tcMod scroll 0 -0.25
        tcMod scale 6 6
    }
    {
        map textures/dreadnought/bluestasic_scan.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        rgbGen wave sin 0.6 0.2 0.25 0.5
        tcMod scale 2 2
        tcMod stretch noise 0 1 0 1
        tcMod scroll 0 0.5
    }
    {
        map textures/stasis/plain6.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0 -0.05
    }
    {
        map models/mapobjects/cargo/panel_2.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/cargo/panel_3
{
    {
        map textures/dreadnought/school2.tga
        tcMod scroll 1 0
    }
    {
        map models/mapobjects/cargo/panel_3.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/cargo/panel_4
{
    {
        map models/mapobjects/cargo/laptop_scrn.tga
        depthWrite
        tcMod scroll 1 0
        tcMod scale 1 0.7
    }
    {
        map models/mapobjects/cargo/panel_4.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/cargo/panel_1
{
    {
        map models/mapobjects/cargo/panel_1.tga
        depthWrite
        rgbGen wave sin 0 1 0 1
    }
    {
        map models/mapobjects/cargo/panel_1.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/cargo/cube
{
    {
        map textures/liquids/slime7.tga
        depthWrite
        rgbGen wave sin 0.8 0 0 0
        tcMod scale 0.5 0.5
        tcMod scroll 0 0.5
    }
    {
        map textures/borg/green1.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.6 0 0 0
        tcMod scale 4 4
        tcMod turb 0 1 0 1
    }
    {
        map models/mapobjects/cargo/cube.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/cargo/padd_glow
{
    {
        map models/mapobjects/cargo/padd_glow.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        depthWrite
    }
    {
        map textures/sfx/rainbow.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0 1 0 1
        tcMod scroll 0 0.5
    }
    {
        map models/mapobjects/cargo/padd_glow.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/cargo/med_padd_glow
{
    {
        map textures/sfx/alpha01.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        depthWrite
    }
    {
        map textures/sfx/cabletest2.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_SRC_ALPHA
        rgbGen wave sin 0 1 0 1
        tcMod scroll 0 1
    }
    {
        map textures/scavenger/c_screen5.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scroll 0 0.4
    }
    {
        map models/mapobjects/cargo/med_padd_glow.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/cargo/turbo_ceil1
{
    {
        map models/mapobjects/cargo/turbo_ceil1.tga
        depthWrite
    }
    {
        map models/mapobjects/cargo/turbo_ceil1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen lightingDiffuse
    }
}

models/mapobjects/cargo/turbo_ceil2
{
    {
        map models/mapobjects/cargo/turbo_ceil2.tga
        depthWrite
    }
    {
        map models/mapobjects/cargo/turbo_ceil2.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/bridge/helmpanels
{
    {
        map models/mapobjects/bridge/helmpanels.tga
        rgbGen lightingDiffuse
    }
    {
        //rgbGen sin 0.5 0.5 0 0.2
        animMap 4 models/mapobjects/bridge/helmpanels.glow.tga models/mapobjects/bridge/helmpanels.glow1.tga models/mapobjects/bridge/helmpanels.glow2.tga models/mapobjects/bridge/helmpanels.glow3.tga models/mapobjects/bridge/helmpanels.glow4.tga 
        blendFunc GL_ONE GL_ONE
        rgbGen identity
    }
}

models/mapobjects/bridge/stationpanels
{
    //{
    //map models/mapobjects/bridge/StationPanels.tga
    //blendfunc GL_ONE GL_ONE
    //rgbGen identity
    //}
    {
        //rgbGen lightingDiffuse
        map models/mapobjects/bridge/stationpanels.tga
        rgbGen identity
    }
}

models/mapobjects/bridge/lightfaces
{
    {
        map models/mapobjects/bridge/lightfaces.tga
        rgbGen lightingDiffuse
    }
    {
        map models/mapobjects/bridge/lightfaces.glow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen identity
    }
}

models/mapobjects/bridge/lightcone
{
    //{
    //map models/mapobjects/bridge/LightCone.tga
    //blendfunc GL_ONE GL_ONE
    //rgbGen identity
    //}
    {
        //rgbGen lightingDiffuse
        map models/mapobjects/bridge/lightcone.tga
        rgbGen identity
    }
}

models/mapobjects/confroom/plant
{
    cull disable
    {
        //alphaFunc GT0
        //alphaFunc GE128
        map models/mapobjects/confroom/plant.tga
        alphaFunc LT128
        rgbGen lightingDiffuse
    }
}

models/players/crewthin/combadge
{
    polygonOffset
    {
        clampmap models/players/crewthin/combadge.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/control1_panel
{
    {
        map textures/stasis/pulse6.tga
        depthWrite
        tcMod scroll 0 0.6
        tcMod scale 5.1 5.1
        tcMod turb 1 1 1 0.2
    }
    {
        map models/mapobjects/stasis/control1_panelglow.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 1 0.7 1 0.5
    }
    {
        map models/mapobjects/stasis/control1_panel.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/control_pulse2
{
    {
        map models/mapobjects/stasis/control_pulse2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 1 0.8 0.2 1
    }
}

models/mapobjects/stasis/control_pulse
{
    {
        map models/mapobjects/stasis/control_pulse.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 1 1 0.4 0.8
    }
}

models/mapobjects/stasis/control_pulse3
{
    {
        map models/mapobjects/stasis/control_pulse3.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 1 0.8 1 1.4
    }
}

models/mapobjects/stasis/spine
{
    {
        map models/mapobjects/stasis/spine.tga
        depthWrite
        tcMod scroll 0 0.2
    }
    {
        map models/mapobjects/stasis/spine.tga
        blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
        tcMod scale 1.3 1.3
        tcMod scroll 0 -0.2
    }
    {
        map textures/stasis/pulse6.tga
        blendFunc GL_ONE GL_ONE
        tcMod turb 1 0.3 1 0.4
    }
}

models/mapobjects/stasis/control2_panel
{
    {
        map models/mapobjects/stasis/control2_panel.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen lightingDiffuse
    }
    {
        map models/mapobjects/stasis/control2_panelglow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen identity
    }
}

models/mapobjects/stasis/control2_ani
{
    {
        animMap 15 models/mapobjects/stasis/bl0.tga models/mapobjects/stasis/bl1.tga models/mapobjects/stasis/bl2.tga models/mapobjects/stasis/bl3.tga models/mapobjects/stasis/bl4.tga models/mapobjects/stasis/bl5.tga models/mapobjects/stasis/bl6.tga models/mapobjects/stasis/bl7.tga 
        blendFunc GL_ONE GL_ZERO
    }
}

models/mapobjects/stasis/light2_top
{
    {
        map models/mapobjects/stasis/light2_top.tga
        rgbGen lightingDiffuse
    }
    {
        map models/mapobjects/stasis/light2_topglow.tga
        blendFunc GL_ONE GL_ONE
    }
}

models/mapobjects/stasis/hallway
{
    {
        map models/mapobjects/stasis/hallway.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
        depthWrite
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/pod
{
    surfaceparm trans
    cull disable
    {
        map textures/skies/dimclouds.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        depthWrite
        tcMod scale 1 2
        tcMod scroll 0 -0.1
    }
    {
        map textures/skies/dimclouds.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scroll 0 -0.2
    }
    {
        map models/mapobjects/stasis/pod.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/jumppad_top
{
    {
        map models/mapobjects/stasis/blueeye.tga
        depthWrite
        rgbGen wave sin 0.6 0.2 0.25 0.5
        tcMod stretch sin 0.8 0.05 1 1
    }
    {
        map textures/stasis/pulse4.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scale 5 5
        tcMod stretch sin 0.8 0.007 1 1
        tcMod turb 1 1 1 0.2
        tcMod rotate -500
    }
    {
        map textures/stasis/pulse4.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scale 5 5
        tcMod stretch sin 0.8 0.007 1 1
        tcMod rotate 500
        tcMod turb 1.1 1.1 1.1 0.3
    }
    {
        map models/mapobjects/stasis/jumppad_top.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/pod_panel
{
    {
        map models/mapobjects/stasis/pod_panel.tga
        depthWrite
        rgbGen wave sin 0.6 0.2 0.25 0.5
    }
    {
        map textures/stasis/pulse6.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scale 5 5
        tcMod scroll 0 0.5
        tcMod turb 1 1 1 0.2
    }
    {
        map models/mapobjects/stasis/pod_panel.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/plugin_face
{
    {
        map models/mapobjects/stasis/plugin_face.tga
        depthWrite
        rgbGen wave sin 0.2 0.4 0.25 0.75
    }
    {
        map textures/stasis/pulse6.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.6 0.2 0.25 0.5
        tcMod scroll 0 0.5
        tcMod scale 5 5
        tcMod turb 1 1 1 0.2
    }
    {
        map models/mapobjects/stasis/plugin_face.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/plugin2_face
{
    {
        map models/mapobjects/stasis/plugin2_face.tga
        depthWrite
        rgbGen wave sin 0.2 0.4 0.25 0.75
    }
    {
        map textures/stasis/pulse6.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0 0.5
        tcMod scale 5 5
        tcMod turb 0 1 1 0.2
    }
    {
        map models/mapobjects/stasis/plugin2_face.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/face1
{
    {
        map models/mapobjects/stasis/face1.tga
        depthWrite
        rgbGen wave sin 0.9 0.2 0.25 3
    }
    {
        map textures/stasis/pulse6.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scroll 0 0.6
        tcMod scale 5 5
        tcMod turb 1.1 1.1 2 0.3
    }
    {
        map textures/stasis/pulse6.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scroll 0 0.5
        tcMod scale 5 5
        tcMod turb 1 1 1 0.2
    }
    {
        map models/mapobjects/stasis/face1.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/face2
{
    {
        map models/mapobjects/stasis/face2.tga
        depthWrite
    }
    {
        map textures/stasis/pulse6.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scroll 0 0.5
        tcMod scale 5 5
        tcMod turb 1 1 1 0.2
    }
    {
        map textures/stasis/pulse6.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scroll 0 0.6
        tcMod scale 5 5
        tcMod turb 1.1 1.1 2 0.3
    }
    {
        map models/mapobjects/stasis/face2.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/face3
{
    {
        map models/mapobjects/stasis/face3.tga
        depthWrite
    }
    {
        map textures/stasis/pulse6.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scroll 0 0.5
        tcMod scale 5 5
        tcMod turb 1 1 1 0.2
    }
    {
        map textures/stasis/pulse6.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scroll 0 0.6
        tcMod scale 5 5
        tcMod turb 1.1 1.1 2 0.3
    }
    {
        map models/mapobjects/stasis/face3.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/face4
{
    {
        map models/mapobjects/stasis/face4.tga
        depthWrite
    }
    {
        map textures/stasis/pulse6.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scroll 0 0.5
        tcMod scale 5 5
        tcMod turb 1 1 1 0.2
    }
    {
        map textures/stasis/pulse6.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scroll 0 0.6
        tcMod scale 5 5
        tcMod turb 1.1 1.1 2 0.3
    }
    {
        map models/mapobjects/stasis/face4.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/monitor_top
{
    {
        map textures/stasis/pulse4.tga
        blendFunc GL_ONE GL_ZERO
        tcMod scale 5 5
        tcMod turb 1 1 1 0.2
        tcMod scroll 0 0.5
        tcMod rotate 30
    }
    {
        map textures/stasis/pulse4.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scale 5 5
        tcMod turb 1.1 1.1 1.1 0.3
        tcMod scroll 0 -0.5
        tcMod rotate -20
    }
    {
        map models/mapobjects/stasis/monitor_top.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/teleporter_base
{
    {
        map models/mapobjects/stasis/teleporter_base.tga
        depthWrite
        rgbGen wave sin 1 0.4 0.5 0.5
    }
    {
        map models/mapobjects/stasis/light2_topglow.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod rotate 180
        tcMod scale 5 5
    }
    {
        map models/mapobjects/stasis/teleporter_base.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/teleporter_top
{
    {
        map models/mapobjects/stasis/teleporter_top.tga
        depthWrite
        rgbGen wave sin 1 0.4 0.5 0.5
    }
    {
        map models/mapobjects/stasis/light2_top.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod rotate 180
        tcMod scale 10 10
    }
    {
        map models/mapobjects/stasis/teleporter_top.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/light
{
    {
        map models/mapobjects/stasis/control_pulse.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen wave sin 0.4 0 0 0
        tcMod scale 10 10
        tcMod rotate 8
    }
    {
        map textures/stasis/pulse4.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.3 0 0 0
        tcMod scale 10 10
        tcMod scroll 0 0.5
        tcMod turb 1 1 1 0.2
        tcMod rotate 10
    }
    {
        map models/mapobjects/stasis/light.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/archway
{
    {
        map models/mapobjects/stasis/archway.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        depthWrite
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/projector_top
{
    {
        map models/mapobjects/stasis/projector_top.tga
        depthWrite
    }
    {
        map textures/stasis/power.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 0.2 1.5 1
        tcMod scale 4 4
        tcMod turb 0 1 0 1
        tcMod rotate 60
    }
    {
        map textures/stasis/blue.tga
        blendFunc GL_ONE GL_ONE
        tcMod rotate 60
    }
    {
        map models/mapobjects/stasis/projector_top.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/projector
{
    {
        map textures/stasis/k_ceilingl.tga
        depthWrite
        tcMod scale 2 2
    }
    {
        map textures/stasis/power.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 1.3 0.8 0 0.5
        tcMod scale 4 4
        tcMod turb 0 1 0 1
        tcMod scroll 0 -45
    }
    {
        map models/mapobjects/stasis/projector.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/control_switch
{
    {
        map models/mapobjects/stasis/control_switch.tga
        depthWrite
    }
    {
        map textures/stasis/tportmountglow.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0 1 0 1
        tcMod rotate 300
        tcMod scroll 4 0
    }
    {
        map textures/stasis/pulse4.tga
        blendFunc GL_ONE GL_ONE
        tcMod scale 6 6
        tcMod rotate 45
        tcMod turb 0 1 0 1
    }
    {
        map models/mapobjects/stasis/control_switch.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/mushroom
{
    {
        map models/mapobjects/stasis/mushroom.tga
        depthWrite
    }
    {
        map models/mapobjects/stasis/light2_top.tga
        blendFunc GL_ONE GL_ONE
        tcMod scale 4 4
        tcMod rotate 55
    }
    {
        map models/mapobjects/stasis/mushroom.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/holo2_junk
{
    {
        map models/mapobjects/stasis/holo2_junk.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave random 0.5 0.25 0 0.15
    }
}

models/mapobjects/stasis/holo2_junk2
{
    {
        map models/mapobjects/stasis/holo2_junk2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave random 0.5 0.25 0 0.15
    }
}

models/mapobjects/stasis/holo2_junk3
{
    {
        map models/mapobjects/stasis/holo2_junk3.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave random 0.5 0.25 0 0.15
    }
}

models/mapobjects/stasis/holo1_panel
{
    {
        //rgbGen wave noise 1.5 1 0 5
        map models/mapobjects/stasis/holo1_panel.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave random 0.5 0.25 0 0.15
    }
}

models/mapobjects/stasis/holo1
{
    {
        map models/mapobjects/stasis/holo1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave random 0.5 0.25 0 0.15
    }
}

models/mapobjects/stasis/holo2
{
    {
        map models/mapobjects/stasis/holo2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave random 0.5 0.25 0 0.15
    }
}

models/mapobjects/stasis/holo_borg
{
    {
        map models/mapobjects/stasis/holo_borg.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave random 0.5 0.25 0 0.15
    }
}

models/mapobjects/stasis/holo_forge_low
{
    {
        map models/mapobjects/stasis/holo_forge_low.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave random 0.5 0.25 0 0.15
    }
}

models/mapobjects/stasis/switch1
{
    {
        map models/mapobjects/stasis/switch1.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
    }
    {
        map models/mapobjects/stasis/switch2.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_SRC_ALPHA
        depthWrite
        rgbGen wave sin 0 1 0 1
    }
}

models/mapobjects/stasis/mushroom_copy
{
    {
        map models/mapobjects/stasis/mushroom.tga
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/control_switch_copy
{
    {
        map models/mapobjects/stasis/control_switch.tga
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/generator_copy
{
    {
        map models/mapobjects/stasis/generator.tga
        depthWrite
    }
    {
        map textures/stasis/power.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        rgbGen wave sin 0.6 0.2 0 1
        tcMod scale 5 5
        tcMod scroll 0.7 0
    }
}

models/mapobjects/stasis/mine
{
    deformVertexes bulge 0.8 0.8 1.7
    {
        map textures/stasis/power.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        depthWrite
        rgbGen wave sin 0.7 0.1 0 1
        tcMod scale 4 4
        tcMod turb 0 1 0 1
        tcMod scroll 0.5 0
    }
    {
        map models/mapobjects/stasis/mine.tga
        blendFunc GL_ONE GL_SRC_COLOR
        rgbGen wave sin 0.7 0.1 0 1
    }
    {
        map models/mapobjects/stasis/mine_glow.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        rgbGen wave sin 1 0.7 0 1
    }
}

models/mapobjects/stasis/alien_ammo
{
    {
        map textures/liquids/bubbles.tga
        rgbGen wave sin 2 0 0 0
        tcMod turb 0 1 0 1
    }
    {
        map models/mapobjects/stasis/alien_ammo.tga
        blendFunc GL_ONE GL_SRC_COLOR
    }
    {
        map textures/stasis/power.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.6 0 0 0
        tcMod turb 0 0.9 0 1
        tcMod rotate 0.15
        tcMod stretch sin 0.4 0.3 1 1
    }
}

models/mapobjects/stasis/thingheads
{
    {
        map textures/stasis/power.tga
        depthWrite
        tcMod turb 0 1 0 1
        tcMod scale 4 4
        tcMod rotate 30
    }
    {
        map models/mapobjects/stasis/thingheads.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
    {
        map models/mapobjects/stasis/thingheads_glow.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen wave sin 0.5 0.3 0 0.4
    }
}

models/mapobjects/stasis/thingheads2
{
    {
        map textures/stasis/power.tga
        depthWrite
        rgbGen wave sin 1 0.5 0 1
        tcMod rotate 1
        tcMod scale 4 4
        tcMod turb 0 1 0 1
    }
    {
        map models/mapobjects/stasis/thingheads2.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
    {
        map models/mapobjects/stasis/thingheads2_b.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.5 0.3 0 0.5
    }
}

models/mapobjects/stasis/thingtop
{
    {
        map models/mapobjects/stasis/thingtop.tga
        depthWrite
        rgbGen wave sin 1 0.5 0 1
    }
    {
        map textures/stasis/webwave4.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen wave sin 0.3 0 0 0
        tcMod turb 0 1 0 1
        tcMod scale 7 7
    }
    {
        map models/mapobjects/stasis/thingtop.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/alien_glow
{
    {
        map textures/stasis/power.tga
        depthWrite
        rgbGen wave sin 0.05 0 0 0
        tcMod rotate 15
    }
    {
        map textures/stasis/power.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.05 0 0 0
        tcMod rotate -14
    }
    {
        map models/mapobjects/stasis/alien_glow.tga
        blendFunc GL_ONE GL_SRC_COLOR
        rgbGen lightingDiffuse
    }
}

models/mapobjects/stasis/alien_ammo_3
{
    {
        map models/mapobjects/stasis/alien_ammo_3.tga
        blendFunc GL_ONE GL_SRC_COLOR
        rgbGen wave sin 0.7 0.3 0 0.7
    }
}

models/mapobjects/stasis/mine_new
{
    {
        map models/mapobjects/stasis/light2_top.tga
        rgbGen wave sin 1 0.3 0 0.7
        tcMod scale 1 5
        tcMod scroll 0 -3
    }
    {
        map models/mapobjects/stasis/mine_mask.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
    }
    {
        map models/mapobjects/stasis/mine_new.tga
        blendFunc GL_ZERO GL_SRC_COLOR
    }
}

models/mapobjects/stasis/holo3_top_shdr
{
    {
        map models/mapobjects/stasis/holo3_top_shdr.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave random 0.5 0.25 0 0.15
    }
}

models/mapobjects/stasis/holo3_bottom
{
    {
        map models/mapobjects/stasis/holo3_bottom.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave random 0.5 0.25 0 0.15
    }
}

models/mapobjects/stasis/holo4_moon1
{
    {
        map models/mapobjects/stasis/holo4_moon1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.25 0 0.15
    }
}

models/mapobjects/stasis/holo4_moon2
{
    {
        map models/mapobjects/stasis/holo4_moon2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.25 0 0.15
    }
}

models/mapobjects/stasis/holo4_moon3
{
    {
        map models/mapobjects/stasis/holo4_moon3.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.25 0 0.15
    }
}

models/mapobjects/stasis/holo4_moon4
{
    {
        map models/mapobjects/stasis/holo4_moon4.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.25 0 0.15
    }
}

models/mapobjects/stasis/pod2_glow
{
    {
        map models/mapobjects/stasis/pod2_glow.tga
        rgbGen lightingDiffuse
    }
    {
        map models/mapobjects/stasis/pod2_glowbl.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0 1 0 1
    }
}

models/mapobjects/stasis/pod2_fins
{
    {
        map models/mapobjects/stasis/pod2_fins.tga
        rgbGen wave sin 0 0.5 0 1
    }
    {
        map models/mapobjects/stasis/pod2_fx.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod rotate 25
    }
    {
        map models/mapobjects/stasis/pod2_fins.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/players/ted/eye
{
    cull disable
    {
        map models/players/ted/eye.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen lightingDiffuse
    }
    {
        map models/players/ted/eye_spec.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen identity
        alphaGen lightingSpecular
    }
}

models/players/seven/seven_borg
{
    {
        map models/players/seven/seven_borg.tga
        alphaFunc GE128
        blendFunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
        rgbGen lightingDiffuse
    }
    {
        map models/players/seven/seven_borg_spec.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        rgbGen identity
        alphaGen lightingSpecular
    }
}

models/players/stasis/statis_wing
{
    cull disable
    {
        map models/players/stasis/statis_wing.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
        depthWrite
    }
}

models/players/stasis/statis_wing_v2
{
    cull disable
    {
        map models/players/stasis/statis_wing_v2.tga
    }
}

models/mapobjects/dn/glow_red
{
    {
        map models/mapobjects/dn/glow_red.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave square 0.5 0.5 1 1
    }
}

models/mapobjects/dn/glow_orange
{
    {
        map models/mapobjects/dn/glow_orange.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 1 0.5 0.25 0.5
    }
    {
        map models/mapobjects/dn/glow_orange.tga
        blendFunc GL_ZERO GL_ONE
        rgbGen wave sin 1 0.5 0.25 0.5
    }
}

models/mapobjects/dn/litegl
{
    {
        map models/mapobjects/dn/litegl.tga
    }
    {
        map models/mapobjects/dn/litegl.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 1 0.5 0.25 0.5
    }
}

models/mapobjects/dn/litebl
{
    {
        map models/mapobjects/dn/litebl.tga
    }
}

models/mapobjects/dn/electric2
{
    cull disable
    {
        animMap 15 models/mapobjects/dn/electric1.tga models/mapobjects/dn/electric2.tga models/mapobjects/dn/electric3.tga models/mapobjects/dn/electric4.tga models/mapobjects/dn/electric5.tga 
        blendFunc GL_ONE_MINUS_DST_COLOR GL_SRC_ALPHA
    }
}

models/mapobjects/dn/glow_redtri
{
    {
        map models/mapobjects/dn/glow_redtri.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 1 1 0.75 0.3
    }
    {
        map models/mapobjects/dn/glow_redtri.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 1 1 0.75 0.3
    }
}

models/mapobjects/dn/glow_redtri2
{
    {
        animMap 3 models/mapobjects/dn/glow_redtri2.tga models/mapobjects/dn/black.tga models/mapobjects/dn/black.tga 
        blendFunc GL_ONE_MINUS_DST_COLOR GL_SRC_ALPHA
    }
}

models/mapobjects/dn/glow_redtri3
{
    {
        animMap 3 models/mapobjects/dn/black.tga models/mapobjects/dn/glow_redtri3.tga models/mapobjects/dn/black.tga 
        blendFunc GL_ONE_MINUS_DST_COLOR GL_SRC_ALPHA
    }
}

models/mapobjects/dn/glow_redtri4
{
    {
        animMap 3 models/mapobjects/dn/black.tga models/mapobjects/dn/black.tga models/mapobjects/dn/glow_redtri4.tga 
        blendFunc GL_ONE_MINUS_DST_COLOR GL_SRC_ALPHA
    }
}

models/mapobjects/dn/electric1
{
    cull disable
    {
        animMap 10 models/mapobjects/dn/electric1.tga models/mapobjects/dn/electric2.tga models/mapobjects/dn/electric3.tga models/mapobjects/dn/electric4.tga models/mapobjects/dn/electric5.tga 
        blendFunc GL_ONE_MINUS_DST_COLOR GL_SRC_ALPHA
    }
}

models/mapobjects/dn/arc1
{
    cull disable
    {
        animMap 10 models/mapobjects/dn/arc1.tga models/mapobjects/dn/arc2.tga models/mapobjects/dn/arc3.tga 
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
    }
}

models/mapobjects/dn/bglite1
{
    cull disable
    {
        animMap 10 models/mapobjects/dn/bglite1.tga models/mapobjects/dn/bglite2.tga models/mapobjects/dn/bglite3.tga models/mapobjects/dn/bglite4.tga models/mapobjects/dn/bglite5.tga 
        blendFunc GL_ONE_MINUS_DST_COLOR GL_SRC_ALPHA
    }
}

models/mapobjects/dn/machine
{
    {
        map models/mapobjects/dn/litegl.tga
        depthWrite
        rgbGen wave triangle 0.5 0.5 0.5 0.5
        tcMod rotate 180
    }
    {
        map models/mapobjects/dn/machine.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/dn/sleep_lid
{
    {
        map textures/dreadnought/energy3.tga
        depthWrite
        rgbGen wave sin 0.15 0 0 0
        tcMod scroll 0 0.1
    }
    {
        map models/mapobjects/dn/sleep_lid.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/dn/sleep_chamber
{
    {
        map models/mapobjects/dn/sleep_chamber.tga
        depthWrite
        rgbGen wave sin 1 0.25 0.5 1
    }
    {
        map textures/dreadnought/light2.tga
        blendFunc GL_ONE GL_ONE
        tcMod rotate 20
    }
    {
        map models/mapobjects/dn/sleep_chamber.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/dn/powercell_tube
{
    cull disable
    {
        map textures/dreadnought/light2.tga
        blendFunc GL_ONE GL_ONE
        depthWrite
        tcMod scroll 0 1
        tcMod scale 0 2
    }
    {
        map textures/dreadnought/light2.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0 -1
        tcMod scale 2 3
    }
    {
        map models/mapobjects/dn/powercell_tube.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen lightingDiffuse
    }
}

models/mapobjects/dn/powercell_top
{
    {
        map models/mapobjects/dn/powercell_top.tga
        depthWrite
        rgbGen wave sin 0 0.5 0 0.8
    }
    {
        map textures/borg/bolt1.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scale 3 3
        tcMod scroll 0.5 0
    }
    {
        map textures/borg/bolt1.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scale 2 2
        tcMod scroll -0.6 0
    }
    {
        map models/mapobjects/dn/powercell_top.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/dn/headbot_plug
{
    {
        map models/mapobjects/dn/headbot_plug.tga
        depthWrite
        rgbGen wave sin 1 0.5 1 0.5
    }
    {
        map textures/dreadnought/light1.tga
        blendFunc GL_ONE GL_ONE
        tcMod rotate 60
    }
    {
        map models/mapobjects/dn/headbot_plug.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/dn/powercell_top2
{
    {
        map models/mapobjects/dn/powercell_top2.tga
        depthWrite
        rgbGen wave sin 0 0.5 0 0.8
    }
    {
        map textures/borg/bolt_gold.tga
        blendFunc GL_ONE GL_ONE
        tcMod scale 3 3
        tcMod scroll 0.5 0
    }
    {
        map textures/borg/bolt_gold.tga
        blendFunc GL_ONE GL_ONE
        tcMod scale 2 2
        tcMod scroll -0.6 0
    }
    {
        map models/mapobjects/dn/powercell_top2.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/dn/middle_ring
{
    {
        map textures/dreadnought/energy1.tga
        depthWrite
        rgbGen wave sin 0.5 0.15 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
    }
    {
        map textures/dreadnought/energy1.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        rgbGen wave sin 0.5 0.25 2 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
    }
}

models/mapobjects/dn/loader_claw
{
    {
        map models/mapobjects/dn/loader_claw.tga
    }
    {
        map textures/sfx/electricslime.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen vertex
        tcMod scroll 0 1
        tcMod turb 0 1 0 1
    }
    {
        map models/mapobjects/dn/loader_claw2.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen wave sin 2 1.5 0 1
    }
    {
        map models/mapobjects/dn/loader_claw.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/dn/energy_container_copy
{
    {
        map textures/dreadnought/energy1.tga
        depthWrite
        rgbGen wave sin 0 1 0 1
        tcMod scale 0.75 1
        tcMod scroll 0 -0.2
    }
    {
        map textures/dreadnought/energy1.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        tcMod scale 0.75 1
        tcMod scroll 0 -0.2
    }
    {
        map textures/dreadnought/energy1.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        rgbGen lightingDiffuse
        tcMod scroll 0 0.1
    }
}

models/mapobjects/dn/powercell_tube2
{
    {
        map textures/dreadnought/light2.tga
        blendFunc GL_ONE GL_ONE
        depthWrite
        tcMod scroll 0 1
        tcMod scale 0 2
    }
    {
        map textures/dreadnought/light2.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0 -1
        tcMod scale 2 3
    }
    {
        map models/mapobjects/dn/powercell_tube2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen lightingDiffuse
    }
}

models/mapobjects/dn/arcgreen1
{
    cull disable
    {
        animMap 10 models/mapobjects/dn/arcgreen1.tga models/mapobjects/dn/arcgreen2.tga models/mapobjects/dn/arcgreen3.tga 
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
    }
}

models/mapobjects/borg/glow_green
{
    cull disable
    {
        map models/mapobjects/borg/glow_green.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 1 0.5 0.5 0.5
    }
}

models/mapobjects/borg/bulb2
{
    {
        map models/mapobjects/borg/bulb.tga
        rgbGen wave sin 1 0.5 0.25 0.5
    }
}

models/mapobjects/borg/bulb3
{
    {
        map models/mapobjects/borg/bulb.tga
        rgbGen wave sin 1 0.5 0.75 0.5
    }
}

models/mapobjects/borg/bulb4
{
    {
        map models/mapobjects/borg/bulb.tga
        rgbGen wave sin 1.7 1 1 1
    }
}

models/mapobjects/borg/dispanal
{
    {
        map models/mapobjects/borg/dispanal.tga
        tcMod scroll 0 0.5
    }
}

models/mapobjects/borg/dispanal2
{
    {
        map models/mapobjects/borg/dispanal.tga
        depthWrite
        rgbGen wave sin 1 0.5 0.5 0.5
    }
    {
        map models/mapobjects/borg/dispanal.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
    }
}

models/mapobjects/borg/dispanal3
{
    {
        map models/mapobjects/borg/dispanal.tga
        blendFunc GL_SRC_ALPHA GL_SRC_COLOR
        rgbGen wave sin 1.25 0.5 0.4 0.5
    }
    {
        map models/mapobjects/borg/dispanal.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        depthWrite
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/glass
{
    {
        map models/mapobjects/borg/glass.tga
        depthWrite
        rgbGen wave sin 1 0.5 0.5 0.5
    }
    {
        map models/mapobjects/borg/glass.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/bulb
{
    {
        map models/mapobjects/borg/bulb.tga
    }
}

models/mapobjects/borg/glow_green2
{
    cull disable
    {
        map models/mapobjects/borg/glow_green.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        depthWrite
    }
}

models/mapobjects/borg/glow_green3
{
    cull disable
    {
        map models/mapobjects/borg/glow_green.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 1 0.5 0.25 0.5
    }
}

models/mapobjects/borg/glow_green4
{
    cull disable
    {
        map models/mapobjects/borg/glow_green.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 1 0.5 0.75 0.5
    }
}

models/mapobjects/borg/glow_green5
{
    cull disable
    {
        map models/mapobjects/borg/glow_green.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 1.7 1 1 1
    }
}

models/mapobjects/borg/disnode2
{
    cull disable
    {
        map models/mapobjects/borg/disnode.tga
        blendFunc GL_SRC_ALPHA GL_SRC_ALPHA
        depthWrite
        rgbGen wave sin 0.98 0.2 0.25 2
    }
}

models/mapobjects/borg/vynclumn_glow
{
    {
        map models/mapobjects/borg/vynclumn_glow.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_SRC_ALPHA
        depthWrite
        rgbGen wave sin 1 0.5 0.75 0.5
    }
    {
        map models/mapobjects/borg/vynclumn_glow.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/vynclumn
{
    {
        map models/mapobjects/borg/vynclumn.tga
        blendFunc GL_SRC_ALPHA GL_SRC_ALPHA
        depthWrite
        rgbGen wave sin 1 0.5 0.75 0.5
    }
    {
        map models/mapobjects/borg/vynclumn.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        depthFunc equal
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/electric01
{
    cull disable
    {
        animMap 15 models/mapobjects/borg/electric01.tga models/mapobjects/borg/electric02.tga models/mapobjects/borg/electric03.tga models/mapobjects/borg/electric04.tga models/mapobjects/borg/electric05.tga models/mapobjects/borg/electric06.tga 
        blendFunc GL_SRC_ALPHA GL_SRC_ALPHA
    }
}

models/mapobjects/borg/sparkbox2
{
    {
        animMap 10 models/mapobjects/borg/sparkbox1.tga models/mapobjects/borg/sparkbox2.tga models/mapobjects/borg/sparkbox3.tga models/mapobjects/borg/sparkbox4.tga models/mapobjects/borg/sparkbox5.tga 
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_COLOR
    }
}

models/mapobjects/borg/sparkbox3
{
    {
        animMap 10 models/mapobjects/borg/sparkbox1.tga models/mapobjects/borg/sparkbox2.tga models/mapobjects/borg/sparkbox3.tga models/mapobjects/borg/sparkbox4.tga models/mapobjects/borg/sparkbox5.tga 
    }
}

models/mapobjects/borg/mach1_main
{
    {
        map models/mapobjects/borg/sparkbox2.tga
        depthWrite
        tcMod rotate 180
    }
    {
        map models/mapobjects/borg/mach1_main.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/circuit2
{
    {
        map models/mapobjects/borg/sparkbox1.tga
        depthWrite
        tcMod rotate 360
    }
    {
        map models/mapobjects/borg/circuit2.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        depthFunc equal
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/circuit3
{
    {
        map models/mapobjects/borg/sparkbox2.tga
        depthWrite
        tcMod rotate 180
        tcMod turb 1 1 1 0.5
    }
    {
        map models/mapobjects/borg/circuit3.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/borg_circuit
{
    {
        map models/mapobjects/borg/sparkbox3.tga
        depthWrite
        rgbGen wave sin 1 0.5 0.75 0.5
        tcMod rotate 180
    }
    {
        map models/mapobjects/borg/gg.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.8 0 0 0
        tcMod scale 9.9 9.9
        tcMod scroll 0 -0.8
    }
    {
        map models/mapobjects/borg/borg_circuit.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/mach1_radar
{
    {
        map models/mapobjects/borg/mach1_radar.tga
        blendFunc GL_SRC_ALPHA GL_SRC_ALPHA
        depthWrite
        rgbGen wave sin 1 0.5 1 1.5
    }
    {
        map models/mapobjects/borg/mach1_radar.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/mach1_panal
{
    {
        map models/mapobjects/borg/mach1_panal.tga
        depthWrite
        rgbGen lightingDiffuse
        tcMod scroll 0 0.2
    }
}

models/mapobjects/borg/power
{
    {
        animMap 10 models/mapobjects/borg/sparkbox1.tga models/mapobjects/borg/sparkbox2.tga models/mapobjects/borg/sparkbox3.tga models/mapobjects/borg/sparkbox4.tga models/mapobjects/borg/sparkbox5.tga 
        depthWrite
    }
    {
        map textures/stasis/blue.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod rotate 45
    }
    {
        map models/mapobjects/borg/power.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
    }
}

models/mapobjects/borg/power2
{
    {
        animMap 10 models/mapobjects/borg/spark1.tga models/mapobjects/borg/spark2.tga models/mapobjects/borg/spark3.tga 
    }
    {
        map models/mapobjects/borg/power.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
    }
}

models/mapobjects/borg/tank_tube
{
    {
        map textures/borg/green1_dos.tga
        tcMod rotate 5
        tcMod scroll 0 0.5
        tcMod scale 2 2
    }
    {
        map textures/borg/green1_dos.tga
        blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
        tcMod rotate -5
        tcMod scroll 0 -0.5
    }
    {
        map models/mapobjects/borg/tank_tube.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
    }
}

models/mapobjects/borg/tank
{
    {
        map models/mapobjects/borg/tank.tga
        rgbGen wave sin 1 0.5 1 1
    }
    {
        map models/mapobjects/borg/electric05.tga
        blendFunc GL_SRC_ALPHA GL_SRC_ALPHA
        depthWrite
        rgbGen wave sin 0.8 0.5 0.5 0.5
        tcMod scroll 0.5 0
    }
    {
        map models/mapobjects/borg/tank.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/circuit2b
{
    qer_editorimage models/mapobjects/borg/sparkbox1.tga
    {
        map models/mapobjects/borg/circuit2.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        depthFunc equal
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/circuit2_copy
{
    {
        map models/mapobjects/borg/circuit2.tga
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/vynclumn_copy
{
    {
        map models/mapobjects/borg/vynclumn.tga
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/circuit3_copy
{
    {
        map models/mapobjects/borg/circuit3.tga
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/circuit_copy
{
    {
        map models/mapobjects/borg/borg_circuit.tga
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/tank_copy
{
    {
        map models/mapobjects/borg/tank.tga
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/plugin_copy
{
    {
        map models/mapobjects/borg/plugin.tga
        rgbGen lightingDiffuse
    }
}

models/mapobjects/borg/zap5
{
    {
        animMap 10 models/mapobjects/borg/zap2.tga models/mapobjects/borg/zap3.tga models/mapobjects/borg/zap4.tga models/mapobjects/borg/zap5.tga models/mapobjects/borg/zap6.tga 
        rgbGen lightingDiffuse
    }
}

models/weapons2/tricorder/detpak
{
    {
        map models/weapons2/tricorder/detpak.tga
        rgbGen lightingDiffuse
    }
    {
        map models/weapons2/tricorder/detpakglow.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        rgbGen wave sin 1 1.5 1 2
    }
}

models/weapons2/tricorder/tricorder
{
    {
        map models/weapons2/tricorder/tricorder.tga
        depthWrite
        rgbGen wave sin 0.9 0.5 0 2
    }
    {
        map textures/sfx/rainbow.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.5 0.3 0 1.5
    }
    {
        map models/weapons2/tricorder/tricorder.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/crystals
{
    {
        map models/weapons2/prifle/indicator.tga
        tcMod scroll 0 -1
    }
    {
        map models/weapons2/prifle/indicator.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        tcMod scroll 0 1
    }
    {
        map textures/borg/static.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod rotate 90
        tcMod scroll 8 7
    }
    {
        map models/mapobjects/forge/crystals.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/panels_top
{
    {
        map models/mapobjects/forge/panels_top.tga
        depthWrite
    }
    {
        map textures/forge/trimlight3b.tga
        tcMod scroll 0 2
        tcMod scale 9 1
    }
    {
        map models/mapobjects/forge/panels_top.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/panel_screen
{
    {
        map models/mapobjects/forge/panel_screen.tga
        depthWrite
        rgbGen wave sin 1.2 1 1 0.5
    }
    {
        map textures/forge/trimlightb.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll 0 1
        tcMod scale 9 1
    }
    {
        map models/mapobjects/forge/panel_screen.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/turret_side
{
    {
        map textures/forge/darktube1a.tga
        depthWrite
        tcMod scroll -1 0
    }
    {
        map textures/forge/darktube1a.tga
        blendFunc GL_ONE GL_ONE
        tcMod scroll -1 0
        tcMod scale 5 1
    }
    {
        map models/mapobjects/forge/turret_side.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/monitor
{
    {
        map models/mapobjects/forge/monitor.tga
        depthWrite
        rgbGen wave sin 2.5 2 1 2
    }
    {
        map textures/borg/bolt1.tga
        blendFunc GL_ONE GL_ONE
        tcMod rotate 45
    }
    {
        map models/mapobjects/forge/monitor.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/screen_1
{
    {
        animMap 4 models/mapobjects/forge/screen_1.tga models/mapobjects/forge/screen_12.tga models/mapobjects/forge/screen_13.tga models/mapobjects/forge/screen_14.tga 
    }
    {
        animMap 4 models/mapobjects/forge/screen_1.tga models/mapobjects/forge/screen_12.tga models/mapobjects/forge/screen_13.tga models/mapobjects/forge/screen_14.tga 
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 1 0 0 0
    }
}

models/mapobjects/forge/capsule_in
{
    {
        map textures/forge/energyor.tga
        tcMod scroll 0 0.2
    }
    {
        map models/mapobjects/forge/capsule_in.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_COLOR
    }
}

models/mapobjects/forge/capsule_side
{
    cull disable
    {
        map models/mapobjects/forge/capsule_side.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        depthWrite
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/capsule_glas
{
    {
        map models/mapobjects/forge/capsule_glas.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        depthWrite
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/exam_table02
{
    {
        map models/mapobjects/forge/exam_table02.tga
        depthWrite
    }
    {
        map models/mapobjects/forge/text.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scale 6 6
        tcMod scroll -0.5 0
    }
    {
        map textures/sfx/redstripe.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
    }
    {
        map models/mapobjects/forge/exam_table02.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/exam_table
{
    {
        map models/mapobjects/forge/exam_table.tga
        depthWrite
    }
    {
        map textures/sfx/rainbow.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.5 1 0 1
        tcMod turb 0 0.5 0 0.5
        tcMod rotate 45
    }
    {
        map models/mapobjects/forge/exam_table.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
    }
}

models/mapobjects/forge/probe
{
    {
        map models/mapobjects/forge/probe.tga
        depthWrite
    }
    {
        map textures/skies/redcloudsa.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 1 5 1
        tcMod rotate 45
    }
    {
        map models/mapobjects/forge/probe.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/flesh_glass
{
    {
        map textures/skies/dimclouds.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        depthWrite
        tcMod scroll 0 0.15
        tcMod turb 1 0 1 1
    }
    {
        map textures/skies/dimclouds.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scroll 0 0.03
        tcMod scale 1 1.5
    }
    {
        map models/mapobjects/forge/flesh_glass.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/flesh_vat
{
    {
        map models/mapobjects/forge/flesh_vat.tga
        depthWrite
    }
    {
        map textures/forge/evilstatic_line.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod rotate 75
    }
    {
        map models/mapobjects/forge/flesh_vat.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/power_up
{
    {
        map textures/borg/bolt1.tga
        depthWrite
        tcMod scale 3 3
        tcMod rotate 80
        tcMod turb 0 1 0 1
    }
    {
        map models/mapobjects/forge/power_up.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/power_up2
{
    {
        map textures/borg/bolt_gold.tga
        depthWrite
        tcMod rotate 80
        tcMod scale 3 3
        tcMod turb 0 1 0 1
    }
    {
        map models/mapobjects/forge/power_up2.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/capsul_glass
{
    cull disable
    {
        map textures/skies/dimclouds.tga
        blendFunc GL_ONE GL_ONE
        depthWrite
        tcMod scroll 0 0.09
    }
    {
        map models/mapobjects/forge/capsul_glass.tga
        blendFunc GL_ZERO GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/capsul_vein
{
    {
        map models/mapobjects/forge/capsul_vein.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        depthWrite
    }
}

models/mapobjects/forge/capsul_ends
{
    {
        map models/mapobjects/forge/capsul_ends.tga
        depthWrite
        rgbGen wave sin 0.3 0.2 0 0.5
    }
    {
        map textures/forge/metalight2a.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod rotate 45
        tcMod turb 0 1 0 1
    }
    {
        map models/mapobjects/forge/capsul_ends.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/capsule_top2
{
    {
        map models/mapobjects/forge/capsule_top2.tga
        depthWrite
        rgbGen wave sin 0.9 0.2 0.25 1
    }
    {
        map textures/forge/stripgenglow.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 1.5 1.2 0.25 0.5
        tcMod scroll 0 1
    }
    {
        map textures/forge/stripgenglow.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 1 1 1 0.5
        tcMod scroll 0 -0.5
    }
    {
        map models/mapobjects/forge/capsule_top2.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/seed_caps
{
    {
        animMap 10 models/mapobjects/forge/seed_caps1.tga models/mapobjects/forge/seed_caps2.tga models/mapobjects/forge/seed_caps3.tga models/mapobjects/forge/seed_caps4.tga models/mapobjects/forge/seed_caps5.tga 
        depthWrite
    }
    {
        map models/mapobjects/forge/seed_caps.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/seed
{
    {
        map models/mapobjects/forge/seed.tga
        depthWrite
    }
    {
        map textures/liquids/bubbles.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen wave sin 0.5 0 0 0
        tcMod rotate 45
        tcMod scale 10 10
    }
    {
        map models/mapobjects/forge/seed.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/forge/d_grid
{
    {
        map textures/forge/energyor.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
        rgbGen wave sin 0.75 0.1 2 0.4
        tcMod scale 0.25 0.25
        tcMod scroll 0.1 0.2
        tcMod turb 0.5 0.1 0 1
    }
    {
        map textures/forge/energyor.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen wave sin 0.5 0.4 0 0.1
        tcMod scale 0.25 0.25
        tcMod scroll -0.2 -0.1
        tcMod turb 0.25 0.25 0 1
    }
}

models/mapobjects/forge/power_up_shader03
{
    {
        map models/mapobjects/forge/power_up_shader03.tga
    }
    {
        map models/mapobjects/dn/arc1.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scroll 0.7 0
        tcMod scale 1 5
    }
    {
        map models/mapobjects/forge/power_up_shader03.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
    }
    {
        map models/mapobjects/forge/power3_white.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.2 1.2 0 0.5
    }
}

models/mapobjects/forge/power_up_shader02
{
    {
        map models/mapobjects/forge/power_up_shader02.tga
    }
    {
        animMap 1 models/mapobjects/forge/power2bigred.tga models/mapobjects/forge/power2blue.tga models/mapobjects/forge/power2red2.tga 
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
    }
    {
        map models/mapobjects/forge/power2littlered.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 1 0 2
    }
}

models/mapobjects/forge/power_up_shader01
{
    cull disable
    {
        map models/mapobjects/forge/power_up_shader01.tga
    }
    {
        map models/mapobjects/forge/powershader01_fx.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 1 0 2
    }
}

models/mapobjects/forge/capsul_glass2_d1
{
    cull disable
    {
        map textures/skies/dimclouds.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
    }
}

models/mapobjects/scavenger/alienlight
{
    {
        map models/mapobjects/scavenger/alienlight.tga
        depthWrite
        rgbGen wave sin 1 0.1 0.5 0.5
    }
    {
        map models/mapobjects/scavenger/alienlight.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/scavenger/h_control
{
    {
        map textures/liquids/bubbles.tga
        blendFunc GL_ONE GL_ZERO
        tcMod rotate 30
    }
    {
        map models/mapobjects/scavenger/h_control.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/scavenger/sc_monitor
{
    {
        map models/mapobjects/scavenger/sc_monitor.tga
        depthWrite
    }
    {
        map models/mapobjects/forge/text.tga
        blendFunc GL_ONE GL_ONE
        tcMod scale 6 6
        tcMod scroll 0 -1.5
    }
    {
        map textures/sfx/electricgrade4.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 1 0 0.2
        tcMod scale 0 7
        tcMod scroll 0 2
        tcMod stretch noise 0 1 0 1
    }
    {
        map models/mapobjects/scavenger/sc_monitor.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/scavenger/toolbox
{
    {
        map models/mapobjects/scavenger/toolbox.tga
        depthWrite
        rgbGen wave sin 0 1 0 1
    }
    {
        map models/mapobjects/scavenger/toolbox.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/scavenger/power_up2
{
    {
        map textures/borg/bolt_gold.tga
        depthWrite
        rgbGen wave triangle 0 1 0 1
        tcMod rotate -60
        tcMod turb 0 1 0 1
    }
    {
        map textures/borg/bolt_gold.tga
        blendFunc GL_ONE GL_ONE
        tcMod rotate 60
        tcMod scale 4 4
        tcMod turb 0 1 0 1
    }
    {
        map textures/borg/bolt_gold.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 1 0 1
        tcMod scroll 40 0
        tcMod scale 4 4
    }
    {
        map models/mapobjects/scavenger/power_up_copy.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/scavenger/power_up
{
    {
        map textures/borg/bolt1.tga
        depthWrite
        rgbGen lightingDiffuse
        tcMod rotate 45
        tcMod scale 4 4
        tcMod turb 0 1 0 1
    }
    {
        map textures/borg/bolt1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave noise 0 1 0 1
        tcMod turb 0 1 0 1
    }
    {
        map textures/borg/bolt1.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0 1 0 1
        tcMod entityTranslate
        tcMod scroll 45 0
    }
    {
        map models/mapobjects/scavenger/power_up.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/scavenger/toolbox_copy
{
    {
        map models/mapobjects/scavenger/toolbox.tga
        rgbGen lightingDiffuse
    }
}

models/mapobjects/scavenger/power_up_copy
{
    {
        map textures/borg/bolt_gold.tga
        rgbGen lightingDiffuse
        tcMod rotate 60
        tcMod scale 4 4
        tcMod turb 0 1 0 1
    }
    {
        map textures/borg/bolt_gold.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        tcMod scale 4 4
        tcMod scroll 4 0
    }
    {
        map models/mapobjects/scavenger/power_up_copy.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/mapobjects/scavenger/sc_monitor_copy
{
    {
        map models/mapobjects/scavenger/sc_monitor.tga
        rgbGen lightingDiffuse
    }
}

models/mapobjects/scavenger/h_control_copy
{
    {
        map models/mapobjects/scavenger/h_control.tga
        rgbGen lightingDiffuse
    }
}

models/mapobjects/scavenger/alien_glow
{
    cull disable
    {
        map textures/skies/dimclouds.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        rgbGen lightingDiffuse
    }
}

models/mapobjects/scavenger/iso_glow
{
    {
        map textures/liquids/bubbles.tga
        depthWrite
        rgbGen wave sin 0.5 0 0 0
        tcMod scale 2 2
        tcMod scroll 0.01 0.4
    }
    {
        map textures/liquids/bubbles.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen wave sin 1 0.5 0 1
        tcMod scale 3 3
        tcMod scroll -0.01 0.2
    }
    {
        map textures/stasis/pulse4.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.4 0 0 0
        tcMod scale 3 3
        tcMod scroll 0.05 0.4
        tcMod turb 0 1 0 1
    }
    {
        map textures/stasis/dots.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.5 0 0 0
        tcMod scale 2 2
        tcMod scroll -0.015 0.5
    }
}

models/weapons2/scavenger/w_rings
{
    {
        map models/weapons2/scavenger/rbolt2.tga
        rgbGen wave sin 1 0.5 0 1
        tcMod scroll 2 0
    }
    {
        map models/weapons2/scavenger/w_rings.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/weapons2/scavenger/w_ammo
{
    {
        map models/weapons2/scavenger/w_ammo.tga
        depthWrite
        tcMod scroll -0.3 0
    }
}

models/weapons2/scavenger/flash
{
    surfaceparm trans
    {
        map models/weapons2/scavenger/flash.tga
        alphaFunc GE128
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
    }
}

models/weapons2/scavenger/flash2b
{
    surfaceparm trans
    {
        map models/weapons2/scavenger/flash2b.tga
        alphaFunc GE128
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
    }
}

models/weapons2/scavenger/flash2a
{
    surfaceparm trans
    {
        map models/weapons2/scavenger/flash2a.tga
        alphaFunc GE128
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
    }
}

models/players/helmet/helmetface
{
    {
        map models/players/helmet/helmetface.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        depthWrite
        rgbGen lightingDiffuse
    }
}

models/weapons2/launcher/projectile2
{
    {
        map models/weapons2/launcher/projectile2.tga
        depthWrite
        rgbGen wave sin 1.2 1 0 3.5
    }
    {
        animMap 8 textures/effects/orangemap.tga textures/effects/orangemap2.tga textures/effects/orangemap3.tga textures/effects/orangemap4.tga textures/effects/orangemap5.tga textures/effects/orangemap4.tga textures/effects/orangemap3.tga textures/effects/orangemap2.tga 
        blendFunc GL_SRC_ALPHA GL_SRC_ALPHA
        depthWrite
        rgbGen wave sin 1.2 1.5 0 3.5
        tcMod rotate 30
        tcMod scale 2 2
        tcMod turb 0 0.2 0 1
        tcMod scroll 0 40
    }
    {
        map models/weapons2/launcher/projectile2.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/weapons2/launcher/energy
{
    {
        map models/weapons2/launcher/fire0001.tga
        depthWrite
        tcMod scroll 0.05 0
        tcMod turb 1 0.1 0 0.3
    }
    {
        map models/weapons2/launcher/fire0002.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        tcMod scroll 0.1 0
    }
    {
        map models/weapons2/launcher/energy.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/weapons2/launcher/projectile3
{
    {
        map models/weapons2/launcher/fire0001.tga
        depthWrite
        tcMod turb 0 1 0 1
    }
    {
        map models/weapons2/launcher/fire0002.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod turb 0 -1 0 1
    }
    {
        map models/weapons2/launcher/projectile3.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/powerups/trek/imod_glow
{
    {
        map models/powerups/trek/imod_glow_b.tga
        depthWrite
        rgbGen wave sin 0 1 0 1
    }
    {
        map models/powerups/trek/imod_glow_c.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0 1 0.5 1
    }
    {
        map models/powerups/trek/imod_glow.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/powerups/trek/lights
{
    {
        map models/powerups/trek/lights.tga
        depthWrite
        rgbGen wave sin 0 1 0 1
    }
    {
        map textures/dreadnought/forceside.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scroll 1 0
    }
    {
        map models/powerups/trek/lights.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/powerups/trek/prifle_glow
{
    {
        map models/weapons2/prifle/flashles.tga
        depthWrite
        tcMod scroll 0 -0.7
    }
    {
        map models/weapons2/prifle/flashles.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scroll 0 0.7
    }
    {
        map models/powerups/trek/prifle_glow.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/powerups/trek/scavenger_glow
{
    {
        map textures/skies/redclouds.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        depthWrite
        tcMod scale 1.5 1.5
        tcMod rotate 45
        tcMod scroll 0.5 0
    }
    {
        map textures/skies/redclouds.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.8 0.5 0 0
        tcMod stretch sin 1.4 1 0 0.5
    }
    {
        map models/powerups/trek/scavenger_glow.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/powerups/trek/stasis_glow
{
    {
        map models/powerups/trek/stasis_glow.tga
        depthWrite
    }
    {
        map textures/stasis/pulse2.tga
        tcMod entityTranslate
        tcMod scale 2.4 0.4
        tcMod scroll 0 -1
    }
    {
        map models/powerups/trek/stasis_glow.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/powerups/trek/glauncher_glow
{
    {
        map models/weapons2/launcher/fire0001.tga
        depthWrite
        tcMod scroll 0.05 0
        tcMod turb 1 0.3 0 0.3
    }
    {
        map models/weapons2/launcher/fire0002.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        tcMod scroll 0.1 0
    }
    {
        map models/powerups/trek/glauncher_glow.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/powerups/trek/tetrion_glow
{
    {
        map textures/liquids/bubbles.tga
        depthWrite
        tcMod scroll 0 0.2
        tcMod scale 2 2
    }
    {
        map textures/liquids/slime7c.tga
        blendFunc GL_ONE GL_SRC_COLOR
        tcMod scroll 0 -0.2
        tcMod scale 2 2
    }
    {
        map textures/liquids/slime7c.tga
        blendFunc GL_ZERO GL_ONE
        tcMod scroll 0 -0.5
    }
    {
        map models/powerups/trek/tetrion_glow.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen lightingDiffuse
    }
}

models/powerups/trek/window
{
    {
        map textures/sfx/rainbow.tga
        depthWrite
        tcMod rotate 60
    }
    {
        map textures/dreadnought/bluestasic_scan.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod scale 2 2
        tcMod stretch noise 0 1 0 1
    }
    {
        map models/powerups/trek/window.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/powerups/trek/armor2
{
    deformVertexes bulge 0.8 0.8 1.7
    {
        map models/powerups/trek/armor.tga
        depthWrite
        rgbGen lightingDiffuse
    }
    {
        map gfx/effects/shield2g.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.7 0 0 0
        tcMod scale 0.5 0.5
        tcMod scroll 0.3 0.2
    }
    {
        map gfx/effects/shield3g.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.7 0 0 0
        tcMod scroll -0.1 0.3
        tcMod rotate 1
    }
    {
        map models/powerups/trek/shield2.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod turb 0 1 0 1
    }
}

models/powerups/trek/bottom
{
    {
        map models/powerups/trek/bottom.tga
        depthWrite
        rgbGen wave sin 0 1 0 1
    }
    {
        map textures/sfx/electricslime.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0 0.5 0 1
        tcMod scale 3 3
        tcMod scroll 0 -0.2
    }
    {
        map models/powerups/trek/bottom.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/powerups/trek/torpedo_glow
{
    {
        map gfx/misc/yellowline.tga
        depthWrite
        tcMod rotate 90
    }
    {
        map gfx/misc/yellowline.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 3 0 0 1
        tcMod rotate -90
    }
    {
        map gfx/misc/yellowburst2.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 1 0.5 0 1
        tcMod rotate 180
    }
}

models/powerups/trek/scavenger_ammo2
{
    {
        map models/weapons2/scavenger/flash2b.tga
        depthWrite
        tcMod scale 8 8
        tcMod scroll 0 1.5
    }
    {
        map models/weapons2/scavenger/flash2b.tga
        blendFunc GL_ONE GL_ONE
        tcMod scale 16 16
        tcMod scroll 0 -0.5
    }
    {
        map models/powerups/trek/scavenger_ammo.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        depthWrite
    }
}

models/powerups/trek/transporter_glow
{
    {
        map textures/stasis/power.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        rgbGen wave sin 0.3 0 0 0
        tcMod scale 2 2
        tcMod scroll 0 -0.2
        tcMod turb 0 1 0 1
    }
    {
        map textures/stasis/power.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.2 0 0 0
        tcMod scroll 0 -0.5
    }
    {
        map textures/sfx/electricgrade4.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.5 1 0.5 1.5
        tcMod scroll 0 0.5
        tcMod scale 2 2
    }
    {
        map textures/sfx/electricgrade4.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen lightingDiffuse
        tcMod scroll 0 0.5
        tcMod scale 2 2
    }
}

models/powerups/trek/qaud_glow
{
    {
        map textures/effects/quadmap.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        depthWrite
        rgbGen wave sin 0.5 0 0 0
        tcMod rotate 120
    }
    {
        map textures/effects/quadmap.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.5 0 0 0
        tcMod scale 0.8 0.8
        tcMod rotate -120
    }
}

models/powerups/trek/window2
{
    {
        map textures/sfx/rainbow.tga
        tcMod rotate 90
    }
    {
        map models/powerups/trek/window.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        depthWrite
    }
    {
        map models/powerups/trek/shield_gold.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_SRC_ALPHA
        rgbGen wave sin 0.6 0 0 0
        tcMod turb 0 -1 0 1
        tcMod rotate -30
    }
}

models/powerups/trek/med_kit2
{
    {
        map models/powerups/trek/med_kit.tga
        depthWrite
    }
    {
        map models/powerups/trek/shield_gold.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.7 0 0 0
        tcMod turb 0 -1 0 1
        tcMod rotate 15
    }
    {
        map models/powerups/trek/shield_gold.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.7 0 0 0
        tcMod turb 0 -1 0 -1
        tcMod rotate -30
    }
    {
        map models/powerups/trek/shield_gold2.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod turb 0 1 0 1
    }
}

models/powerups/trek/helmetears
{
    {
        map models/powerups/trek/helmetears.tga
    }
    {
        map textures/stasis/pulse4.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.6 0 0 0
        tcMod scale 6 6
        tcMod turb 0 1 0 1
        tcMod rotate 15
    }
    {
        map textures/stasis/pulse4.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.6 0 0 0
        tcMod scale 5 5
        tcMod turb 0 -1 0 1
        tcMod rotate -30
    }
}

models/powerups/trek/helmet
{
    {
        map models/powerups/trek/helmet.tga
        depthWrite
    }
    {
        map textures/stasis/pulse4.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.6 0 0 0
        tcMod scale 4 4
        tcMod turb 0 1 0 1
        tcMod rotate 15
    }
    {
        map textures/stasis/pulse4.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.7 0 0 0
        tcMod scale 5 5
        tcMod turb 0 -1 0 1
        tcMod rotate -30
    }
}

models/powerups/trek/inv_ball
{
    {
        map models/powerups/trek/inv_ball.tga
        depthWrite
        rgbGen wave sin 0.5 0.8 0 1.5
    }
    {
        map models/powerups/trek/inv_ball.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen lightingDiffuse
    }
}

models/powerups/trek/inv_bulbs
{
    {
        map models/powerups/trek/inv_bulbs.tga
        depthWrite
        rgbGen wave sin 0.5 0.8 0 1.5
    }
    {
        map models/powerups/trek/inv_bulbs.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen lightingDiffuse
    }
}

models/powerups/trek/haste_flame1
{
    cull disable
    {
        animMap 10 models/powerups/trek/haste_flame1.tga models/powerups/trek/haste_flame2.tga models/powerups/trek/haste_flame3.tga models/powerups/trek/haste_flame4.tga models/powerups/trek/haste_flame5.tga models/powerups/trek/haste_flame6.tga 
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        rgbGen lightingDiffuse
    }
}

models/powerups/trek/armor3
{
    deformVertexes bulge 0.8 0.8 1.7
    {
        map models/powerups/trek/armor.tga
    }
    {
        map models/powerups/trek/shield_gold.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.8 0 0 0
        tcMod rotate -45
        tcMod turb 0 1 0 1
    }
    {
        map models/powerups/trek/shield_gold.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.8 0 0 0
        tcMod rotate 90
        tcMod turb 0 -1 0 1
    }
    {
        map models/powerups/trek/shield_gold2.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod turb 0 1 0 1
    }
}

models/powerups/trek/armor
{
    deformVertexes bulge 0.8 0.8 1.7
    {
        map models/powerups/trek/armor.tga
    }
    {
        map gfx/effects/shield2g.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.3 0 0 0
        tcMod scale 0.5 0.5
        tcMod scroll 0.3 0.2
    }
    {
        map gfx/effects/shield3g.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.3 0 0 0
        tcMod scroll -0.1 0.3
        tcMod rotate 1
    }
}

models/powerups/trek/armor_shard
{
    {
        map gfx/effects/shield2g.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen wave sin 0.7 0 0 0
        tcMod scale 0.5 0.5
        tcMod scroll 0.3 0.2
    }
    {
        map gfx/effects/shield3g.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        rgbGen wave sin 0.7 0 0 0
        tcMod scroll -0.1 0.3
        tcMod rotate 1
    }
    {
        map models/powerups/trek/shield2.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        tcMod turb 0 1 0 1
    }
}

models/powerups/trek/podium_pads
{
    {
        map models/weapons2/prifle/flashles.tga
        tcMod scroll 0 1
        tcMod scale 5 1
    }
    {
        map models/weapons2/prifle/flashles.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        tcMod scroll 0 -1
        tcMod scale 10 3
    }
    {
        map models/powerups/trek/podium_pads.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
    }
}

models/powerups/trek/podium_power
{
    {
        map textures/sfx/electricgrade4.tga
        rgbGen wave sin 0.7 0.2 0 0.5
        tcMod scroll 0 1
        tcMod scale 1 4
    }
    {
        map textures/sfx/electricgrade4.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        rgbGen wave sin 1 0.5 0 1
        tcMod scroll 0 -1.5
        tcMod scale 1 3
    }
    {
        map models/powerups/trek/podium_power.tga
        blendFunc GL_ONE GL_SRC_ALPHA
    }
}

models/powerups/trek/detpak_ends
{
    {
        map models/powerups/trek/red.tga
        tcMod scroll 0 1
        tcMod scale 2 2
    }
    {
        map models/powerups/trek/detpak_ends.tga
        blendFunc GL_ONE GL_SRC_ALPHA
    }
}

models/powerups/trek/detpak_body
{
    {
        map models/powerups/trek/red.tga
        tcMod turb 0.5 0.5 0.5 1
    }
    {
        map models/powerups/trek/detpak_body.tga
        blendFunc GL_ONE GL_SRC_ALPHA
    }
}

models/powerups/trek/shield_glow
{
    {
        map models/weapons2/prifle/flashles.tga
        tcMod scale 3 2
        tcMod scroll 0 3
    }
    {
        map models/weapons2/prifle/flashles.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        tcMod scale 6 1
        tcMod scroll 0 -2
    }
}

models/players/crewheads/ins_ensign3
{
    {
        map models/players/crewheads/ins_ensign3.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/players/crewheads/ins_ensign2
{
    {
        map models/players/crewheads/ins_ensign2.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/players/crewheads/pip
{
    {
        map models/players/crewheads/pip.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/players/crewheads/ins_ensign
{
    {
        map models/players/crewheads/ins_ensign.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/players/crewheads/ins_command
{
    {
        map models/players/crewheads/ins_command.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/players/crewheads/clear
{
    {
        map models/players/crewheads/clear.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        rgbGen lightingDiffuse
    }
}

models/players2/romulan/clear
{
    {
        map models/players2/tolek/clear.tga
        blendFunc GL_ZERO GL_SRC_COLOR
        rgbGen lightingDiffuse
    }
}

models/players/borgbolts/w_weapon_2
{
    cull disable
    {
        map models/players/borgbolts/w_weapon_2.tga
        depthWrite
        rgbGen lightingDiffuse
    }
}

models/players/skull/skull
{
    {
        map models/players/skull/skull_glow.tga
        rgbGen wave sin 0 1 0 1
    }
    {
        map models/players/skull/skull.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
    }
}

models/players/reaver/head
{
    {
        map models/players/reaver/head.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen lightingDiffuse
    }
    {
        map models/players/reaver/head2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.6 0.4 0 0.4
    }
}

models/players/avatar/head
{
    {
        map models/players/avatar/head.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen lightingDiffuse
    }
    {
        map models/players/avatar/headglow.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.6 0.4 0 0.4
    }
}

models/players/hunterseeker/rockets
{
    cull disable
    {
        map models/players/hunterseeker/rockets.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.4 0 2.4
    }
    {
        map models/players/hunterseeker/rockets2.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.6 0.4 0 7
    }
}

models/players/hunterseeker/hunterseeker
{
    {
        map models/players/hunterseeker/hunterseeker_fx.tga
        tcMod scroll -0.5 0
    }
    {
        map models/players/hunterseeker/hunterseeker.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/players/warbot/upperbody
{
    {
        map models/players/warbot/upperbody_fx.tga
        tcMod scroll -0.2 0
    }
    {
        map models/players/warbot/upperbody.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        rgbGen lightingDiffuse
    }
}

models/players/warbot/bot_head
{
    {
        map models/players/warbot/bot_head.tga
    }
    {
        map models/players/warbot/bot_head_glow.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
        rgbGen wave sin 0 1 0 1
    }
}

models/players/headbot/eyes
{
    {
        map models/players/headbot/eyes.tga
    }
    {
        map models/players/headbot/eyes.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0 1 0 1
    }
}

models/players/scoutbot/bot_head
{
    {
        map models/players/scoutbot/bot_head.tga
        rgbGen lightingDiffuse
    }
    {
        map models/players/scoutbot/head_glow.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0 1 0 1
    }
}

models/mapobjects/podium/hologrid_b
{
    surfaceparm trans
    {
        map models/mapobjects/podium/hologrid_b.tga
        alphaFunc GE128
        blendFunc GL_ONE GL_ZERO
        depthWrite
    }
}

models/mapobjects/podium/holodeck
{
    cull disable
    {
        map models/mapobjects/podium/holodeck.tga
        alphaGen entity
    }
}

models/players/forge_boss/head
{
    {
        map models/players/forge_boss/head.tga
        rgbGen lightingDiffuse
    }
    {
        map models/players/forge_boss/head_fx.tga
        blendFunc GL_ONE_MINUS_DST_COLOR GL_ONE
        rgbGen wave sin 0.5 0.5 0.5 0.5
    }
}

models/players/warbot_boss/upperbody
{
    {
        map models/players/warbot_boss/upperbody.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen lightingDiffuse
    }
    {
        map models/players/warbot_boss/upperbody_front.tga
        blendFunc GL_ONE GL_ONE
        rgbGen wave sin 0.5 0.5 0.5 1
    }
    {
        map textures/detail/gleam3.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
    }
    {
        map models/players/warbot_boss/upperbody_spec.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        detail
        rgbGen identity
        alphaGen lightingSpecular
    }
}

models/players/warbot_boss/weapons
{
    {
        map models/players/warbot_boss/weapons_glow.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
        tcMod scroll 0.5 0.5
    }
    {
        map models/players/warbot_boss/weapons.tga
        blendFunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
        rgbGen lightingDiffuse
    }
    {
        map textures/detail/gleam3.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
    }
    {
        map models/players/warbot_boss/weapons_spec.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        detail
        rgbGen identity
        alphaGen lightingSpecular
    }
}

models/players/warbot_boss/arms
{
    {
        map models/players/warbot_boss/arms.tga
        rgbGen lightingDiffuse
    }
    {
        map textures/detail/gleam3.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
    }
    {
        map models/players/warbot_boss/arms_spec.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        detail
        rgbGen identity
        alphaGen lightingSpecular
    }
}

models/players/warbot_boss/lower
{
    {
        map models/players/warbot_boss/lower.tga
        rgbGen lightingDiffuse
    }
    {
        map textures/detail/gleam3.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
        detail
        rgbGen identity
        tcGen environment
    }
    {
        map models/players/warbot_boss/lower_spec.tga
        blendFunc GL_SRC_ALPHA GL_ONE
        detail
        rgbGen identity
        alphaGen lightingSpecular
    }
}

