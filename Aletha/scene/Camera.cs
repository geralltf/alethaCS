﻿/* Description: Scene Camera Library
 * ~~ Aletha alpha source ~~
 * Author and Copyright © 2013 - 2016 Gerallt G. Franke
 * Licence: BSD
 * */

using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

using OpenTK;
using OpenTK.Graphics.OpenGL4;
using Aletha;

namespace X3D.Engine
{
	public class TestCamera
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
		public Matrix4 Matrix;
        public Matrix4 Projection;

        public Quaternion orientation_quat;

		public Quaternion yaw;
		public Quaternion pitch;
		public Quaternion roll;

		public Vector3 Direction;
		public Vector3 movement;

        public Vector3 DollyDirection = Vector3.UnitZ;
        public Vector3 Scale = Vector3.One;

        public float camera_yaw = 0.0f;
		public float camera_pitch = 0.0f;
		public float max_pitch = 5.0f;
		public float max_yaw = 5.0f;

        public float playerHeight = 0.0f;
        public int Width;
        public int Height;

        public TestCamera(int viewportWidth, int viewportHeight)
		{
            // Keyboard navigation parameters

            velocity = Vector3.Zero;
            onGround = false;

            Matrix = Matrix4.Identity;
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
            Forward = Vector3.UnitZ;
            Direction = Forward;

            //Mouse Navigation parameters
            Up = Vector3.UnitY; //Up = Vector3.UnitZ;
            Position = Origin = movement = new Vector3(0, 0, -2); //Position = Origin = movement = Vector3.Zero; // Q3

            this.Width = viewportWidth;
            this.Height = viewportHeight;

            viewportSize(viewportWidth, viewportHeight);
        }

        public void viewportSize(int viewportWidth, int viewportHeight)
        {
            this.Width = viewportWidth;
            this.Height = viewportHeight;
            float aspectRatio = Width / (float)Height;

            GL.Viewport(0, 0, Width, Height);

            Projection = Matrix4.CreatePerspectiveFieldOfView(MathHelper.PiOver4, aspectRatio, 0.01f, 1000.0f);

        }

        /// <summary>
        /// Reset camera to point at horizon
        /// </summary>
        public void Horizon()
        {
            this.Forward = Vector3.UnitZ;
            this.Up = Vector3.UnitY;
            this.Right = Vector3.UnitX;
        }

        public Vector3 getMovement() { return Position; }
		public Vector3 applyMovement(Vector3 direction) 
		{
			// HasChanges = true;

			return Position = direction;
		}

		public bool PositionChanged()
		{
			return PrevPosition.X != Position.X 
				|| PrevPosition.Y != Position.Y
					|| PrevPosition.Z != Position.Z;
		}

		public bool OrientationChanged()
		{
			return false;
			//return PrevOrientation.X != Orientation.X
			//	|| PrevOrientation.Y != Orientation.Y
			//		|| PrevOrientation.Z != Orientation.Z
			//		|| PrevOrientation.W != Orientation.W;
		}

        public void ApplyDollyTransformations()
        {
            

            // setup projection
            GL.Viewport(0, 0, Width, Height);

            //Matrix = Matrix4.LookAt(Position, Position + DollyDirection, Up); /*   // Test code put in quickly just for Mouse Navigation merged here
            ApplyTransformations(); // */

            
        }

        /// <summary>
        /// Get the current orientation and return it in a Matrix with no translations applied.
        /// </summary>
        public Matrix4 GetWorldOrientation()
        {
            Matrix4 worldView;

            Vector3 worldPosition = Vector3.Zero ;

            Look = worldPosition + (Direction) * 1.0f;

            worldView = Matrix4.LookAt(worldPosition, Look, Up);

            return worldView;
        } 

        /// <summary>
        /// Applies transformations using camera configuration and camera vectors and assigns a new View Matrix.
        /// </summary>
        public void ApplyTransformations()
		{
			HasChanges = PositionChanged() || OrientationChanged();

			Vector3 PlayerPosition = new Vector3(Position.X, Position.Y, Position.Z + this.playerHeight);

			Look = PlayerPosition + (Direction) * 1.0f;
            //Look += DollyDirection;

            Matrix4 outm = Matrix4.Identity;

            outm = Matrix4.LookAt(PlayerPosition, Look, Up);

            Matrix = outm;

			PrevPosition = Position;
		}

		public void ApplyRotation()
		{
            Vector3 direction = (Look - Position);
            direction.Normalize();
			//MakeOrthogonal();

			Vector3 pitch_axis = Vector3.Cross(direction, Up);

			pitch = Quaternion.FromAxisAngle(pitch_axis, camera_pitch  ); // radians
			yaw = Quaternion.FromAxisAngle(Up, camera_yaw); // PiOver180
			//roll = Quaternion.FromAxisAngle(Right+Up, roll_angle);

			Orientation = yaw * pitch  /* roll */ ;

            Orientation.Normalize();

			this.Direction = QuaternionExtensions.Rotate(Orientation, Vector3.UnitX);
		}

		//Matrix4 lookAt(Vector3 eye, Vector3 center, Vector3 up) 
		//{
		//	return MatrixExtensions.LookAt(eye,center,up, this.Matrix);
		//}

		public void invert()
		{
			invNeg();
		}

		public bool invNeg()
		{
			if(inverted)
			{
				return invPos();
			}

			var cam = this.getMovement();
			Vector3 moveTo = cam;
			Vector3 pos = Vector3.UnitZ * -1.0f;

			moveTo = moveTo + pos;
			this.applyMovement(moveTo);

			crouched = true;

			return true;
		}

		public bool invPos()
		{
			if(!inverted)
			{
				return invNeg();
			}

			var cam = this.getMovement(); // clone
			Vector3 moveTo = cam;
			Vector3 pos = Vector3.UnitZ;

			moveTo = moveTo + pos;
			this.applyMovement(moveTo);

			crouched = false;

			return true;
		}

		public void move(Vector3 direction, float frame_time)
		{
			//MoveX(direction.x);
			//MoveY(direction.y);

		    moveViewOriented(direction, frame_time);

			//HasChanges = true;
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

		public void Yaw(float angle)
		{
			// Up
			Matrix4 m = Matrix4.CreateFromAxisAngle(Up, angle);

			// Transform vector by matrix, project result back into w = 1.0f
			Right = MatrixExtensions.Transform(m,Right); // TransformVectorCoord
			Up = MatrixExtensions.Transform(m,Look);
		}

		public void Pitch(float angle)
		{
            // Right
            Matrix4 m = Matrix4.CreateFromAxisAngle(Right, angle);

			// Transform vector by matrix, project result back into w = 1.0f
			Right = MatrixExtensions.Transform(m, Up); // TransformVectorCoord
			Up = MatrixExtensions.Transform(m, Look);
		}

		public void Roll(float angle)
		{
            // Look, Right and Up
            Matrix4 m = Matrix4.CreateFromAxisAngle(Look, angle);

			// Transform vector by matrix, project result back into w = 1.0f
			Right = MatrixExtensions.Transform(m, Right); // TransformVectorCoord
			Up = MatrixExtensions.Transform(m, Up);
		}

		public void ForwardOne(float magnitude)
		{

		}

		public void Walk(float magnitude)
		{
			Position += Look * magnitude;
		}

		public void Strafe(float magnitude)
		{
			Vector3 Right = Vector3.UnitX;
			Position += Right * magnitude;
		}

		public void Fly(float units)
		{
			Position += Up * units;
		}

        #region Mouse Navigation

        public void Dolly(float distance)
        {
            Position += distance * DollyDirection;
        }
        public void PanXY(float x, float y)
        {
            Position += new Vector3(x, y, 0);
        }

        public void OrbitXY(float x, float y)
        {
            // TBD                 
            Scale.X = Scale.X + x * .02f;
            Scale.Y = Scale.Y + y * .02f;


        }

        #endregion

        public void moveViewOriented(Vector3 direction, float frameTime) 
		{  
			//  if(direction.X != 0 || direction.Y != 0 || direction.Z != 0) 
			//  {      
			//      cameraMat = new Matrix4.identity();
			//      
			//      if (vrEnabled == true) 
			//      {
			//        vrEuler = eulerFromQuaternion(vrPosition['orientation'], VrPositionCoordinateOrder.YXZ);
			//
			//        cameraMat = cameraMat.rotateZ(camera.zAngle - vrEuler[1]);
			//      } 
			//      else 
			//      {
			//        cameraMat = cameraMat.rotateZ(camera.zAngle);
			//      }
			//      
			//      cameraMat = mat4_inverse(cameraMat);
			//      cameraMat = mat4MultiplyVec3(cameraMat, direction);
			//  }

			// Send desired movement direction to the player mover for collision detection against the map
			playerMover.move(direction, frameTime);
		}

		public void ApplyPitch(float degrees) 
		{
			//Check bounds with the max pitch rate so that we aren't moving too fast
			//    if (degrees < -max_pitch) {
			//      degrees = -max_pitch;
			//    } else if (degrees > max_pitch) {
			//      degrees = max_pitch;
			//    }
			//    camera_pitch += degrees;
			//
			//    //Check bounds for the camera pitch
			//    if (camera_pitch > 360.0) {
			//      camera_pitch -= 360.0;
			//    } else if (camera_pitch < -360.0) {
			//      camera_pitch += 360.0;
			//    }

			camera_pitch += degrees 
				//* PiOver180
				;
		}

		public void ApplyYaw(float degrees) 
		{
            //Check bounds with the max heading rate so that we aren't moving too fast
            //if (degrees < -max_yaw)
            //{
            //    degrees = -max_yaw;
            //}
            //else if (degrees > max_yaw)
            //{
            //    degrees = max_yaw;
            //}
            ////This controls how the heading is changed if the camera is pointed straight up or down
            ////The heading delta direction changes
            //if (camera_pitch > 90 && camera_pitch < 270 || (camera_pitch < -90 && camera_pitch > -270))
            //{
            //    camera_yaw -= degrees;
            //}
            //else
            //{
            //    camera_yaw += degrees;
            //}
            ////Check bounds for the camera heading
            //if (camera_yaw > 360.0f)
            //{
            //    camera_yaw -= 360.0f;
            //}
            //else if (camera_yaw < -360.0f)
            //{
            //    camera_yaw += 360.0f;
            //}

            camera_yaw += degrees ;
				//* PiOver180

		}

		public void Reset()
		{
			// Could be used for respawning
			Position = Origin;
			Rotation = OriginRotation;
			Orientation = Quaternion.Identity;
			//xAngle = 0.0;
		}

		public void setOrigin(Vector3 origin, Vector3 rotation)
		{
			Position = Origin = origin;
			Rotation = OriginRotation = rotation;
			Orientation = Quaternion.Identity;
			//xAngle = 0.0;

			camera_pitch = OriginRotation.X * MathHelpers.PiOver180;
			camera_yaw = OriginRotation.Z * MathHelpers.PiOver180;
		}
	}
}