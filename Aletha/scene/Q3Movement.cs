using Aletha.bsp;
using System;
using OpenTK;
using X3D.Engine;
using System.Collections;
using System.Collections.Generic;

namespace Aletha
{


    /*
 * q3movement.cs - Handles player movement through a bsp structure
 */

    // Much of this file is a simplified/dumbed-down version of the Q3 player movement code
    // found in bg_pmove.c and bg_slidemove.c

    public class Q3Movement
    {
        private q3bsptree bsp;
        private TraceOutput groundTrace;
        public bool crouched = false;
        public SceneCamera camera;
        private Vector3 crouchAmount = Vector3.UnitZ * 15.0f;

        public Q3Movement(SceneCamera camera, q3bsptree bsp)
        {
            this.bsp = bsp;

            this.groundTrace = null;

            this.camera = camera;
        }

        public bool crouchDn()
        {
            if (crouched)
            {
                return crouchUp();
            }

            Vector3 cam = camera.getMovement();
            Vector3 moveTo = cam;
            Vector3 pos = -crouchAmount;

            moveTo = moveTo + pos;
            camera.applyMovement(moveTo);

            crouched = true;

            return true;
        }

        public bool crouchUp()
        {
            Vector3 cam = camera.getMovement();
            Vector3 moveTo = cam;
            Vector3 pos = crouchAmount;

            moveTo = moveTo + pos;
            camera.applyMovement(moveTo);

            crouched = false;

            return true;
        }

        public bool jump()
        {
            //if(!camera.onGround) { return false; } // if your not on ground hold space you have jetpack

            camera.onGround = false;
            camera.velocity.Z = Config.q3movement_jumpvelocity;

            if (this.groundTrace != null && this.groundTrace.plane != null)
            {
                // Make sure that the player isn't stuck in the ground

                float groundDist = Vector3.Dot(camera.getMovement(), this.groundTrace.plane.normal) - this.groundTrace.plane.distance - Config.q3movement_playerRadius;

                Vector3 cam = camera.getMovement();

                Vector3 moveTo = this.groundTrace.plane.normal * (groundDist + 5.0f);

                camera.applyMovement(cam + moveTo);

            }

            return true;
        }

        public void move(Vector3 direction, float frameTime)
        {
            Config.q3movement_frameTime = frameTime * 10.0f;

            this.groundCheck();

            if(direction != Vector3.Zero)
            {
                direction.Normalize();
            }
                

            if (camera.onGround)
            {
                this.walkMove(direction);
            }
            else
            {
                this.airMove(direction);
            }
        }

        public void airMove(Vector3 dir)
        {
            float speed = dir.Length * Config.q3movement_scale;

            this.accelerate(dir, speed, Config.q3movement_airaccelerate);

            bool apply_gravity = true;

            this.stepSlideMove(apply_gravity);
        }

        public void walkMove(Vector3 direction)
        {
            this.applyFriction();

            if (camera.inverted)
            {
                direction.Z *=  -1.0f;
            }

            Vector3 moveDir = QuaternionLib.Rotate(camera.Orientation, direction);

            float speed = direction.Length * Config.q3movement_scale;

            camera.velocity = this.accelerate(moveDir, speed, Config.q3movement_accelerate);

            Vector3 normal = this.groundTrace.plane.normal;

            camera.velocity = this.clipVelocity(camera.velocity, normal);

            if (camera.velocity.X == 0 && camera.velocity.Z == 0) { return; }      //if(!this.velocity[0] && !this.velocity[1]) { return; }


            bool apply_gravity = false;

            this.stepSlideMove(apply_gravity);
        }

        public void stepSlideMove(bool apply_gravity)
        {
            Vector3 start_o = camera.getMovement();
            Vector3 start_v = camera.velocity;

            if (this.slideMove(apply_gravity) == false)
            {
                return; // we got exactly where we wanted to go first try 
            }

            Vector3 down = start_o; // var down = vec3_set(start_o, [0,0,0]);

            down.Y -= Config.q3movement_stepsize;

            TraceOutput trace = this.bsp.trace(start_o, down, camera, Config.q3movement_playerRadius);

            Vector3 up = camera.Up;
            //up = camera.Up;


            // never step up when you still have up velocity
            if (camera.velocity.Z > 0 && (trace.fraction == 1.0f || Vector3.Dot(trace.plane.normal, up) < 0.7f))
            {
                return;
            }

            //var down_o = vec3.set(this.position, [0,0,0]);
            //var down_v = vec3.set(this.velocity, [0,0,0]);

            //start_o = vec3_set (up);
            up = start_o; // vec3_set(start_o, up);
            up.Z += Config.q3movement_stepsize;



            // test the player position if they were a stepheight higher
            trace = this.bsp.trace(start_o, up, camera, Config.q3movement_playerRadius);
            if (trace.allSolid) { return; } // can't step up

            float stepSize = trace.endPos.Z - start_o.Z;
            // try slidemove from this position
            camera.applyMovement(trace.endPos); // vec3_set(trace.endPos, this.position);
            camera.velocity = start_v; // vec3_set(start_v, this.velocity);

            this.slideMove(apply_gravity);

            // push down the final amount
            //this.position = vec3_set(down);
            down = camera.getMovement(); // vec3_set(this.position, down);


            down.Z -= stepSize;


            trace = this.bsp.trace(camera.getMovement(), down, camera, Config.q3movement_playerRadius);

            if (trace.allSolid == false)
            {
                //trace['endPos'] = vec3_set(this.position);
                camera.applyMovement(trace.endPos); // vec3_set(trace.endPos, this.position);
            }
            if (trace.fraction < 1.0f)
            {
                camera.velocity = this.clipVelocity(camera.velocity, trace.plane.normal);
            }
        }

        public bool slideMove(bool apply_gravity)
        {
            int bumpcount;
            int numbumps = 4;
            //List planes = [];
            List<Vector3> planes = new List<Vector3>();

            Vector3 endVelocity = Vector3.Zero;

            if (apply_gravity)
            {
                endVelocity = camera.velocity; // vec3_set(this.velocity, endVelocity );
                endVelocity.Z -= Config.q3movement_gravity * Config.q3movement_frameTime;
                camera.velocity.Z = (camera.velocity.Z + endVelocity.Z) * 0.5f;

                if (this.groundTrace != null && this.groundTrace.plane != null)
                {
                    // slide along the ground plane
                    camera.velocity = this.clipVelocity(camera.velocity, this.groundTrace.plane.normal);
                }
            }

            // never turn against the ground plane
            if (this.groundTrace != null && this.groundTrace.plane != null)
            {
                planes.Add(this.groundTrace.plane.normal);
                //planes.addLast(this.groundTrace.plane.normal);
            }

            // never turn against original velocity
            Vector3 v = new Vector3(camera.velocity);
            v.Normalize();
            planes.Add(v);
            //planes.addLast(v);

            float time_left = Config.q3movement_frameTime;
            Vector3 end = Vector3.Zero;

            for (bumpcount = 0; bumpcount < numbumps; ++bumpcount)
            {

                Vector3 pos = camera.getMovement();

                // calculate position we are trying to move to
                //end = vec3(pos.add(camera.velocity.scale(time_left)));
                //end = vec3(pos.clone().add(camera.velocity.clone().scale(time_left)));
                end = pos + (camera.velocity * time_left);

                // see if we can make it there
                TraceOutput trace = this.bsp.trace(pos, end, camera, Config.q3movement_playerRadius);

                if (trace.allSolid)
                {
                    // entity is completely trapped in another solid
                    camera.velocity.Z = 0.0f;   // don't build up falling damage, but allow sideways acceleration
                    return true;
                }

                if (trace.fraction > 0)
                {
                    // actually covered some distance
                    //vec3_set(trace.endPos, this.position);
                    camera.applyMovement(trace.endPos);
                }

                if (trace.fraction == 1)
                {
                    break;     // moved the entire distance
                }

                time_left -= time_left * trace.fraction;

                planes.Add(trace.plane.normal);
                //planes.addLast(vec3_set(vec3(trace.plane.normal)));

                //
                // modify velocity so it parallels all of the clip planes
                //

                Vector3[] planeNormals = planes.ToArray();

                // find a plane that it enters
                for (int i = 0; i < planes.Count; ++i)
                {
                    float into = Vector3.Dot(camera.velocity, planeNormals[i]);
                    //float into = vec3_dot(vec3(camera.velocity), planes.ToArray()[i]);

                    if (into >= 0.1f) { continue; } // move doesn't interact with the plane

                    // slide along the plane
                    Vector3 clipVelocity = this.clipVelocity(camera.velocity, planeNormals[i]);
                    Vector3 endClipVelocity = this.clipVelocity(endVelocity, planeNormals[i]);

                    // see if there is a second plane that the new move enters
                    for (int j = 0; j < planeNormals.Length; j++)
                    {
                        if (j == i) { continue; }
                        if (Vector3.Dot(clipVelocity, planeNormals[j]) >= 0.1f) { continue; } // move doesn't interact with the plane

                        // try clipping the move to the plane
                        clipVelocity = this.clipVelocity(clipVelocity, planeNormals[j]);
                        endClipVelocity = this.clipVelocity(endClipVelocity, planeNormals[j]);


                        // see if it goes back into the first clip plane
                        if (Vector3.Dot(clipVelocity, planeNormals[i]) >= 0) { continue; }

                        // slide the original velocity along the crease
                        Vector3 direction = Vector3.Zero;
                        direction = Vector3.Cross(planeNormals[i], planeNormals[j]);
                        direction.Normalize();
                        float d = Vector3.Dot(direction, camera.velocity);
                        clipVelocity = (direction * d);

                        direction = Vector3.Cross(planeNormals[i], planeNormals[j]);
                        direction.Normalize();
                        d = Vector3.Dot(direction, endVelocity);
                        endClipVelocity = direction * d;

                        // see if there is a third plane the the new move enters
                        for (int k = 0; k < planeNormals.Length; ++k)
                        {
                            if (k == i || k == j) { continue; }
                            if (Vector3.Dot(clipVelocity, planeNormals[k]) >= 0.1f) { continue; } // move doesn't interact with the plane

                            // stop dead at a tripple plane interaction
                            camera.velocity = Vector3.Zero;
                            return true;
                        }
                    }

                    // if we have fixed all interactions, try another move
                    camera.velocity = clipVelocity; // vec3_set( clipVelocity, this.velocity );
                    endVelocity = endClipVelocity; // vec3_set( endClipVelocity, endVelocity );
                    break;
                }
            }

            if (apply_gravity)
            {
                camera.velocity = endVelocity; // vec3_set( endVelocity, this.velocity );
            }

            return (bumpcount != 0);
        }

        public void applyFriction()
        {
            if (!camera.onGround) { return; }

            float speed = camera.velocity.Length;

            float drop = 0.0f;

            float control = speed < Config.q3movement_stopspeed ? Config.q3movement_stopspeed : speed;
            drop += control * Config.q3movement_friction * Config.q3movement_frameTime;

            float newSpeed = speed - drop;
            if (newSpeed < 0.0f)
            {
                newSpeed = 0.0f;
            }
            if (speed != 0.0f)
            {
                newSpeed /= speed;
                camera.velocity = camera.velocity * newSpeed;
            }
            else
            {
                camera.velocity = Vector3.Zero;
            }
        }

        public void groundCheck()
        {
            Vector3 pos = camera.getMovement();
            Vector3 checkPoint = new Vector3(pos.X, pos.Y, pos.Z - Config.q3movement_playerRadius - 0.25f);

            this.groundTrace = this.bsp.trace(pos, checkPoint, camera, Config.q3movement_playerRadius);

            if (this.groundTrace.fraction == 1.0f)
            { // falling
                camera.onGround = false;
                return;
            }

            if (camera.velocity.Z > 0f && Vector3.Dot(camera.velocity, this.groundTrace.plane.normal) > 10f)
            { // jumping
                camera.onGround = false;
                return;
            }

            if (this.groundTrace.plane.normal.Z < 0.7f)
            { // steep slope
                camera.onGround = false;
                return;
            }

            camera.onGround = true;
        }

        public Vector3 clipVelocity(Vector3 velIn, Vector3 normal)
        {
            float backoff = Vector3.Dot(velIn, normal);

            if (backoff < 0)
            {
                backoff *= Config.q3movement_overclip;
            }
            else
            {
                backoff /= Config.q3movement_overclip;
            }

            Vector3 change = (normal * backoff);

            change = (velIn - change);

            return change;
        }

        public Vector3 accelerate(Vector3 dir, float speed, float accel)
        {
            float currentSpeed = Vector3.Dot(camera.velocity, dir);
            float addSpeed = speed - currentSpeed;

            if (addSpeed <= 0)
            {
                return Vector3.Zero;
            }

            float accelSpeed = accel * Config.q3movement_frameTime * speed;

            if (accelSpeed > addSpeed)
            {
                accelSpeed = addSpeed;
            }

            Vector3 accelDir = (dir * accelSpeed);

            return (camera.velocity + accelDir);
        }
    }


}

