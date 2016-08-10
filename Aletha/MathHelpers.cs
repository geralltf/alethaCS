using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

using OpenTK;

public class MathHelpers
{
	public static float INFINITY = float.PositiveInfinity; // 1.0 / 0.0;
	public static float NAN = float.NaN;
	public static float NEGATIVE_INFINITY = -INFINITY;
	public static float MIN_POSITIVE = (float)5e-324;
	public static float MAX_FINITE = (float)1.7976931348623157e+308;
	public static float Pi = (float)3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982148086513282306647093844609550582231725359408128481117450284102701938521105559644622948954930382;
	public static float PiOver2 = Pi / 2.0f;
	public static float PiOver3 = Pi / 3.0f;
	public static float PiOver4 = Pi / 4.0f;
	public static float PiOver6 = Pi / 4.0f;
	public static float PiOver180 = Pi / 180.0f;
	public static float HalfPi = 0.5f * Pi;
	public static float TwoPi = 2f * Pi;
	public static float ThreePiOver2 = 3 * Pi / 2;
	public static float E = 2.71828182845904523536f;
	public static float Log10E = 0.434294482f;
	public static float Log2E = 1.442695041f;

	public static Vector3 UnitX = new Vector3(1.0f, 0.0f, 0.0f); // Defines a unit-length Vector3 that points towards the X-axis.
	public static Vector3 UnitY = new Vector3(0.0f, 1.0f, 0.0f); // Defines a unit-length Vector3 that points towards the Y-axis
	public static Vector3 UnitZ = new Vector3(0.0f, 0.0f, 1.0f); // Defines a unit-length Vector3 that points towards the Z-axis.
	public static Vector3 Zero = new Vector3(0.0f, 0.0f, 0.0f); // Defines a zero-length Vector3.
	public static Vector3 One = new Vector3(1.0f, 1.0f, 1.0f); // Defines a vector with a magnitude of Ones

	public static Vector4 V4UnitX = new Vector4(1.0f, 0.0f, 0.0f, 0.0f); // Defines a unit-length Vector4 that points towards the X-axis.
	public static Vector4 V4UnitY = new Vector4(0.0f, 1.0f, 0.0f, 0.0f); // Defines a unit-length Vector4 that points towards the Y-axis.
	public static Vector4 V4UnitZ = new Vector4(0.0f, 0.0f, 1.0f, 0.0f); // Defines a unit-length Vector4 that points towards the Z-axis.
	public static Vector4 V4UnitW = new Vector4(0.0f, 0.0f, 0.0f, 1.0f); // Defines a unit-length Vector4 that points towards the W-axis.

	#region Clamping

	public static double Clamp(double value, double min, double max)
	{
		return value > max ? max : (value < min ? min : value);
	}

	public static double ClampCircular(double n, double min, double max)
	{
		if (n >= max) n -= max;
		if (n < min) n += max;
		return n;
	}

	public static float Clamp(float value, float min, float max)
	{
		return value > max ? max : (value < min ? min : value);
	}

	public static float ClampCircular(float n, float min, float max)
	{
		if (n >= max) n -= max;
		if (n < min) n += max;
		return n;
	}

	#endregion
}