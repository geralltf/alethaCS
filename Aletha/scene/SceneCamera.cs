/* Description: Scene Camera Library
 * ~~ From x3d-finely-sharpened source ~~
 * Author and Copyright © 2013 - 2016 Gerallt G. Franke
 * Licence: BSD
 * */

using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

using OpenTK;
using OpenTK.Graphics.OpenGL4;
using X3D;
using Aletha;

namespace X3D.Engine
{
    public enum NavigationType
    {
        Walk,
        Fly,
        Examine
    }

    public class SceneCamera
    {
        public Q3Movement playerMover;
        public bool HasChanges = false;
        public bool noclip = false; // TODO: implement no clipping (turn off object collision)
        public Vector3 velocity;
        public bool onGround;
        public bool inverted = false;
        public bool crouched = false;

        public Vector3 Forward, Up, Right, Look;
        public Vector3 Position, Origin, PrevPosition;
        public Vector3 Rotation, OriginRotation;
        public Quaternion Orientation, PrevOrientation;
        public Matrix4 ViewMatrix;
        public Matrix4 ViewMatrixNoRot;
        public Matrix4 Projection;

        public Quaternion orientation_quat;

        public Quaternion yaw;
        public Quaternion pitch;
        public Quaternion roll;

        public Vector3 Direction;
        public Vector3 movement;

        public Vector3 DollyDirection = Vector3.UnitZ;
        public Vector3 Scale = Vector3.One;
        public Vector2 OrbitLocalOrientation = Vector2.Zero;

        public float camera_roll = 0.0f;
        public float camera_yaw = 0.0f;
        public float camera_pitch = 0.0f;
        public float max_pitch = 5.0f;
        public float max_yaw = 5.0f;

        public float walkMovementSpeed = Config.walkVelocityScale;

        public float playerHeight = 0.0f;
        public int Width;
        public int Height;

        /// <summary>
        /// Value used for debugging
        /// </summary>
        public Vector3 calibTrans = Vector3.Zero;
        public Vector3 calibOrient = Vector3.Zero;
        public Vector3 calibSpeed = new Vector3(0.01f, 0.01f, 0.01f);

        public SceneCamera(int viewportWidth, int viewportHeight)
        {
            // Keyboard navigation parameters

            velocity = Vector3.Zero;
            onGround = false;

            ViewMatrix = Matrix4.Identity;
            Orientation = Quaternion.Identity;

            Rotation = Vector3.Zero;
            yaw = Quaternion.Identity;
            pitch = Quaternion.Identity;
            roll = Quaternion.Identity;
            Look = Vector3.Zero;
            Up = Vector3.Zero;
            Right = Vector3.Zero;

            PrevOrientation = Quaternion.Identity;
            PrevPosition = Vector3.Zero;
            HasChanges = false;


            Right = Vector3.UnitX;

            Forward = Vector3.UnitY;

            Direction = Forward;

            //Mouse Navigation parameters
            Up = Vector3.UnitZ;

            //Position = Origin = movement = new Vector3(0, 0, -2); /*
            Position = Origin = movement = Vector3.Zero; // Q3 // */

            this.Width = viewportWidth;
            this.Height = viewportHeight;

            ApplyViewport(viewportWidth, viewportHeight);
        }

        #region Viewport

        public void ApplyViewportProjection(int width, int height, float fovy = MathHelper.PiOver4)
        {
            if (!(fovy > 0.0f && fovy < Math.PI))
            {
                Console.WriteLine("Viewpoint fov '{0}' is out of range. Must be between 0 and PI",
                    fovy);
                return;
            }

            // TODO: define new field-of-view and correct aspect ratio as specified in the Viewpoint specification

            // make use of the camera in the context to define the new viewpoint

            this.Width = width;
            this.Height = height;
            float aspectRatio = Width / (float)Height;

            GL.Viewport(0, 0, Width, Height);

            Projection = Matrix4.CreatePerspectiveFieldOfView(fovy, aspectRatio, zNear: 0.01f, zFar: 10000.0f);
        }

        public void ApplyViewport(int viewportWidth, int viewportHeight)
        {
            this.Width = viewportWidth;
            this.Height = viewportHeight;
            float aspectRatio = Width / (float)Height;

            GL.Viewport(0, 0, Width, Height);

            Projection = Matrix4.CreatePerspectiveFieldOfView(MathHelper.PiOver4, aspectRatio, 0.01f, 10000.0f);


            //Matrix4 projection;


            //projection = Matrix4.CreatePerspectiveFieldOfView(MathHelper.PiOver4, window.Width / (float)window.Height, 1.0f, 500.0f);
            //GL.MatrixMode(MatrixMode.Projection);
            //GL.LoadMatrix(ref projection);


            //GL.MatrixMode(MatrixMode.Projection);
            //GL.LoadIdentity();
            //GL.Ortho(-10.0 - zoom - panX, 10.0 + zoom - panX, -10.0 - zoom + panY, 10.0 + zoom + panY, -50.0, 50.0);
        }

        #endregion

        /// <summary>
        /// Reset camera to point at horizon
        /// </summary>
        public void Horizon()
        {
            //this.Forward = Vector3.UnitY;
            //this.Up = Vector3.UnitZ; // UnitZ UnitY
            //this.Right = Vector3.UnitX;
        }

        /// <summary>
        /// Get the current orientation and return it in a Matrix with no translations applied.
        /// </summary>
        public Matrix4 GetWorldOrientation()
        {
            Matrix4 worldView;
            Vector3 worldPosition;

            // Set translation to world origin
            worldPosition = Vector3.Zero;
            Look = worldPosition + (Direction) * 1.0f;
            worldView = Matrix4.LookAt(worldPosition, Look, Up);

            // Apply Orientation
            Quaternion q = Orientation; //.Inverted();

            worldView *= MathHelpers.CreateRotation(ref q);

            return worldView;
        }

        public Matrix4 GetModelTranslation()
        {
            Matrix4 modelView;
            Vector3 playerPosition;
            
            playerPosition = new Vector3(Position.X , Position.Y, Position.Z + Config.playerHeight);

            Look = playerPosition + (Direction) * 1.0f;
            modelView = Matrix4.LookAt(playerPosition, Look, Up);

            return modelView;
        }

        /// <summary>
        /// Applies transformations using camera configuration and camera vectors and assigns a new View Matrix.
        /// </summary>
        public void ApplyTransformations()
        {
            Matrix4 outm;
            Vector3 PlayerPosition;

            PlayerPosition = new Vector3(Position.X, Position.Y + Config.playerHeight, Position.Z);

            Look = PlayerPosition + (Direction) * 1.0f;

            outm = Matrix4.LookAt(PlayerPosition, Look, Up);
            
            ViewMatrix = outm * MathHelpers.CreateRotation(ref Orientation);
            ViewMatrixNoRot = outm; 

            PrevPosition = Position;
        }


        public void ApplyRotation()
        {

            Vector3 direction = (Look - Position);
            direction.Normalize();

            //MakeOrthogonal();


            Vector3 lookat = QuaternionLib.Rotate(Orientation, Vector3.UnitZ);
            Vector3 forward = new Vector3(lookat.X, lookat.Y, 0).Normalized();
            Vector3 up = Vector3.UnitY;
            Vector3 left = up.Cross(forward);

            Vector3 roll_axis = forward + Up;

            Orientation = QuaternionLib.QuaternionFromEulerAnglesRad (0, -camera_yaw, -camera_pitch);

            if (inverted)
            {
                Orientation *= QuaternionLib.QuaternionFromEulerAnglesRad(0, 0, -MathHelpers.PI);
            }
        }


        //Matrix4 lookAt(Vector3 eye, Vector3 center, Vector3 up) 
        //{
        //	return MatrixExtensions.LookAt(eye,center,up, this.Matrix);
        //}

        public void Invert()
        {
            inverted = !inverted;
        }

        public void update(int frame_time)
        {
            // todo: apply any current movement animations here
        }

        public void MakeOrthogonal()
        {
            Look.Normalize();
            Up = Vector3.Cross(Look, Right);
            Right = Vector3.Cross(Up, Look);
            Up.Normalize();
            Right.Normalize();
        }

        #region Flying Naviagion

        public void Yaw(float radians)
        {
            //angle = MathHelpers.ClampCircular(angle, 0f, MathHelpers.PI2);

            // Up
            Matrix4 m = Matrix4.CreateFromAxisAngle(Up, radians);

            // Transform vector by matrix, project result back into w = 1.0f
            Right = MatrixLib.Transform(m, Right); // TransformVectorCoord
            Up = MatrixLib.Transform(m, Look);
        }

        //private float pitchAngle = 0f, yawAngle = 0f;
        public void Pitch(float radians)
        {
            //angle = MathHelpers.ClampCircular(angle, 0f, MathHelpers.PI2);

            // Right
            Matrix4 m = Matrix4.CreateFromAxisAngle(Right, radians);

            // Transform vector by matrix, project result back into w = 1.0f
            Right = MatrixLib.Transform(m, Up); // TransformVectorCoord
            Up = MatrixLib.Transform(m, Look);
        }

        public void Roll(float radians)
        {
            // Look, Right and Up
            Matrix4 m = Matrix4.CreateFromAxisAngle(Look, radians);

            // Transform vector by matrix, project result back into w = 1.0f
            Right = MatrixLib.Transform(m, Right); // TransformVectorCoord
            Up = MatrixLib.Transform(m, Up);
        }

        public void ForwardOne(float magnitude)
        {

        }

        public void Walk(float magnitude)
        {
            Vector3 lookat = QuaternionLib.Rotate(Orientation, Vector3.UnitZ);

            Position += lookat * (-magnitude);
        }

        public void Strafe(float magnitude)
        {
            Vector3 lookat = QuaternionLib.Rotate(Orientation, Vector3.UnitZ);
            Vector3 forward = new Vector3(lookat.X, lookat.Y, 0).Normalized();
            Vector3 up = Vector3.UnitZ;
            Vector3 left = up.Cross(forward);

            Position += left * (-magnitude);
        }

        public void Fly(float units)
        {
            Vector3 up = Vector3.UnitZ;

            Position += up * units;
        }

        public void ApplyPitch(float radians)
        {
            //Check bounds with the max pitch rate so that we aren't moving too fast
            //if (radians < -max_pitch)
            //{
            //    radians = -max_pitch;
            //}
            //else if (radians > max_pitch)
            //{
            //    radians = max_pitch;
            //}
            //camera_pitch += radians;

            ////Check bounds for the camera pitch
            //if (camera_pitch > MathHelpers.TwoPi)
            //{
            //    camera_pitch -= MathHelpers.TwoPi;
            //}
            //else if (camera_pitch < -MathHelpers.TwoPi)
            //{
            //    camera_pitch += MathHelpers.TwoPi;
            //}


            //degrees = MathHelpers.ClampCircular(degrees, 0.0f, MathHelpers.PI2);

            camera_pitch += radians;

            Pitch(radians);
        }

        public void ApplyYaw(float radians)
        {
            //Check bounds with the max heading rate so that we aren't moving too fast
            //if (radians < -max_yaw)
            //{
            //    radians = -max_yaw;
            //}
            //else if (radians > max_yaw)
            //{
            //    radians = max_yaw;
            //}
            ////This controls how the heading is changed if the camera is pointed straight up or down
            ////The heading delta direction changes
            //if (camera_pitch > MathHelpers.PIOver2 && camera_pitch < MathHelpers.ThreePIOver2 
            //    || (camera_pitch < -MathHelpers.PIOver2 && camera_pitch > -MathHelpers.ThreePIOver2))
            //{
            //    camera_yaw -= radians;
            //}
            //else
            //{
            //    camera_yaw += radians;
            //}
            ////Check bounds for the camera heading
            //if (camera_yaw > MathHelpers.TwoPi)
            //{
            //    camera_yaw -= MathHelpers.TwoPi;
            //}
            //else if (camera_yaw < -MathHelpers.TwoPi)
            //{
            //    camera_yaw += MathHelpers.TwoPi;
            //}


            //degrees = MathHelpers.ClampCircular(degrees, 0.0f, MathHelpers.PI2);

            camera_yaw += radians;



            Yaw(radians);

        }

        public void ApplyRoll(float radians)
        {
            camera_roll += radians;

            Roll(radians);
        }

        #endregion

        #region Quake Player Mover

        public Vector3 getMovement() { return Position; }
        public Vector3 applyMovement(Vector3 direction)
        {


            // HasChanges = true;
            Position = direction;

            return Position;
            //return Position = direction;
        }



        public void move(Vector3 direction, float frame_time)
        {
            // Send desired movement direction to the player mover for collision detection against the map
            playerMover.move(direction, frame_time);

            //HasChanges = true;
        }

        #endregion

        #region Mouse Navigation

        public void Dolly(float distance)
        {
            Position += distance * DollyDirection;
        }
        public void PanXY(float x, float y)
        {
            Position += new Vector3(x, y, 0);
        }

        public void ScaleXY(float x, float y)
        {
            Scale.X = Scale.X + x * .02f;
            Scale.Y = Scale.Y + y * .02f;
        }

        public void OrbitObjectsXY(float x, float y)
        {
            OrbitLocalOrientation.X += x;
            OrbitLocalOrientation.Y += y;

            //OrbitLocalOrientation *= 0.005f;
        }

        #endregion

        public void Reset()
        {
            // Could be used for respawning
            Position = Origin;
            Rotation = OriginRotation;
            Orientation = Quaternion.Identity;
            //xAngle = 0.0;

            camera_pitch = 0;
            camera_roll = 0;
            camera_yaw = 0;
        }

        public void SetOrigin(Vector3 origin, Vector3 rotation)
        {
            Position = Origin = origin;
            Rotation = rotation;
            OriginRotation = rotation;

            Orientation = Quaternion.Identity;
            //xAngle = 0.0;

            camera_pitch = OriginRotation.Z;// * MathHelpers.PiOver180;
            camera_yaw = OriginRotation.X;// * MathHelpers.PiOver180;

            Orientation = QuaternionLib.QuaternionFromEulerAnglesRad(0, -camera_yaw, -camera_pitch);
            //Orientation = QuaternionExtensions.EulerToQuat(0, camera_yaw, -camera_pitch);
        }
    }
}