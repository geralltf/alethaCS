using System;

namespace Aletha
{
	public class Config
	{
		public static float playerHeight = 57.0f; // Roughly where my eyes sit (1.78 meters off the ground)
		//todo: create Tech3 wrapper class for map loader and character model loader

		///////////////////////////////////


		public static String mapName = "atcs"; // 'q3tourney2', 'atcs', 'sw_oasis_b3'
		public static String mapFileName = mapName + ".bsp";
		public static String map_uri = q3bsp_base_folder+"/maps/" + mapFileName;
		public static String map_levelshot = "../base/levelshots/" + mapName + ".jpg";
		public static String map_title = mapName.ToUpper();
		public static int map_tasks_count = 58;
		public static bool preserve_tga_images = false;

		// Constants
		public static int q3bsp_vertex_stride = 56;
		public static int q3bsp_sky_vertex_stride = (3+2) * sizeof(float); // sizeof(float) * 2 * 3;
        public static String q3bsp_base_folder = "base";
		public static String q3bsp_no_shader_default_texture_url = q3bsp_base_folder + "/webgl/no-shader.png";
		public static String q3bsp_no_shader_default_texture_url2 = q3bsp_base_folder + "/webgl/no-tex.png";

		public static String splash_filename_format = "./images/splash/{0}.jpg";
		public static int splash_number_of_images = 8;
		public static int splash_rotate_time = 3000;
		public static bool splash_enabled = false;

		public static string[] mapShaders = new string[]
		{
		 //'scripts/sw_oasis_b3.shader', // Incompatible BSP version. IBSP V.47
		 "scripts/atcs.shader"
             // ,"scripts/sky.shader"
		 //'scripts/atcs.arena', // problem loading this
		 //'scripts/atcs.particle', // problem loading this
		};

		// If you're running from your own copy of Quake 3, you'll want to use these shaders
				/*var mapShaders = [
		'scripts/base.shader', 'scripts/base_button.shader', 'scripts/base_floor.shader',
		'scripts/base_light.shader', 'scripts/base_object.shader', 'scripts/base_support.shader',
		'scripts/base_trim.shader', 'scripts/base_wall.shader', 'scripts/common.shader',
		'scripts/ctf.shader', 'scripts/eerie.shader', 'scripts/gfx.shader',
		'scripts/gothic_block.shader', 'scripts/gothic_floor.shader', 'scripts/gothic_light.shader',
		'scripts/gothic_trim.shader', 'scripts/gothic_wall.shader', 'scripts/hell.shader',
		'scripts/liquid.shader', 'scripts/menu.shader', 'scripts/models.shader',
		'scripts/organics.shader', 'scripts/sfx.shader', 'scripts/shrine.shader',
		'scripts/skin.shader', 'scripts/sky.shader', 'scripts/test.shader'
		];*/

		// For my demo, I compiled only the shaders the map used into a single file for performance reasons
		//var mapShaders = ['scripts/web_demo.shader'];

		public static float playerDirectionMagnitude = 1.0f;

        public static float turnMagnitude = 0.04f;

        public static float walkVelocityScale = 1.0f;

        public static float walkVelocityFast = 1.4f;


        // Some movement constants ripped from the Q3 Source code
        public static float q3movement_stopspeed = 100.0f;
		public static float q3movement_duckScale = 0.25f;
		public static float q3movement_jumpvelocity = 50.0f;

		public static float q3movement_accelerate = 10.0f;
		public static float q3movement_airaccelerate = 0.1f;
		public static float q3movement_flyaccelerate = 8.0f;

		public static float q3movement_friction = 6.0f;
		public static float q3movement_flightfriction = 3.0f;

		public static float q3movement_frameTime = 0.30f;
		public static float q3movement_overclip = 0.501f;
		public static float q3movement_stepsize = 18.0f;

		public static float q3movement_gravity = 20.0f;
        //float q3movement_gravity = 10.0;

        public static float q3movement_playerRadius = 10.0f;
		public static float q3movement_scale = 50.0f;

		public static float q3bsptree_trace_offset = 0.03125f;


		//
		// Default Shaders
		//

		public const String q3bsp_default_vertex = @"
//#version 420 core
//layout(location = 0) in vec3 position;
//layout(location = 1) in vec3 normal;
//layout(location = 2) in vec4 color;
//layout(location = 3) in vec2 texCoord;
//layout(location = 4) in vec2 lightCoord;

		attribute vec3 position; 
		attribute vec3 normal; 
		attribute vec2 texCoord; 
		attribute vec2 lightCoord; 
		attribute vec4 color; 

		varying vec2 vTexCoord; 
		varying vec2 vLightmapCoord; 
		varying vec4 vColor; 

		uniform mat4 modelViewMat; 
		uniform mat4 projectionMat; 

		void main(void) 
        { 
            mat4 model = projectionMat * modelViewMat;
		    vec4 worldPosition = vec4(position, 1.0); 

		    vTexCoord = texCoord; 
		    vColor = color; 
		    vLightmapCoord = lightCoord; 

            gl_Position = model * worldPosition; 
		}";

		public const String q3bsp_default_fragment = @"

		varying vec2 vTexCoord; 
		varying vec2 vLightmapCoord; 
		uniform sampler2D texture;
		uniform sampler2D lightmap;

		void main(void) 
        { 
		        vec4 diffuseColor = texture2D(texture, vTexCoord); 
		        vec4 lightColor = texture2D(lightmap, vLightmapCoord); 

		        gl_FragColor = vec4(diffuseColor.rgb * lightColor.rgb, diffuseColor.a); 

                //gl_FragColor = vec4(0,1,1,1) + diffuseColor / 2.0;
		}";

		public const String q3bsp_model_fragment = @"

		varying vec2 vTexCoord; 
		varying vec4 vColor; 
		uniform sampler2D texture; 

		void main(void) 
        { 
		    vec4 diffuseColor = texture2D(texture, vTexCoord);
 
		    gl_FragColor = vec4(diffuseColor.rgb * vColor.rgb, diffuseColor.a);

            //gl_FragColor = vec4(0,1,1,1) + diffuseColor / 2.0;
		}";

	}
}
