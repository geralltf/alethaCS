using Aletha.bsp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aletha
{

    /// <summary>
    /// OpenGL Shader builder utility
    /// </summary>
    public class ShaderBuilder
    {
        Dictionary<string,string> attrib;
        Dictionary<string, string> varying;
        Dictionary<string, string> uniform;
        Dictionary<string, string> functions;
        List<string> statements;

        public ShaderBuilder()
        {
            this.attrib = new Dictionary<string, string>();
            this.varying = new Dictionary<string, string>();
            this.uniform = new Dictionary<string, string>();

            this.functions = new Dictionary<string, string>();
            this.statements = new List<string>();
        }

        public void addAttribs(string attribute, string type)
        {
            this.attrib[attribute] = "attribute " + type + " " + attribute + ";";
        }

        public void addVaryings(string varying, string type)
        {
            this.varying[varying] = "varying " + type + " " + varying + ";";
        }

        public void addUniforms(string uniform, string type)
        {
            this.uniform[uniform] = "uniform " + type + " " + uniform + ";";
        }

        public void addFunction(string name, List<string> lines)
        {
            this.functions[name] = Join(lines,"\n");
        }

        public string Join(List<string> lines, string separator)
        {
            string result = "";

            foreach(string line in lines)
            {
                result += line + separator;
            }

            return result;
        }

        public void addLine(string statement)
        {
            this.statements.Add(statement);
        }

        public void addLines(params string[] statements)
        {
            for (int i = 0; i < statements.Length; ++i)
            {
                this.statements.Add(statements[i]);
            }
        }

        public void addLines(List<string> statements)
        {
            for (int i = 0; i < statements.Count; ++i)
            {
                this.statements.Add(statements[i]);
            }
        }

        public String getSource()
        {
            string src = @"";
  
            foreach(var kp in this.attrib)
            {
                src += kp.Value + '\n';
            }

            foreach (var kp in this.varying)
            {
                src += kp.Value + '\n';
            }

            foreach (var kp in this.uniform)
            {
                src += kp.Value + '\n';
            }

            foreach (var kp in this.functions)
            {
                src += kp.Value + '\n';
            }


            src += "void main(void) {\n\t";
            src += Join(this.statements, "\n\t");
            src += "\n}\n";

            return src;
        }

        // q3-centric functions

        public void addWaveform(String name, waveform_t wf, string timeVar)
        {
            if (wf == null)
            {
                this.statements.Add("float " + name + " = 0.0;");
                return;
            }

            if (string.IsNullOrEmpty(timeVar)) { timeVar = "time"; }

            if (wf.phase is float)
            {
                wf.phase = toStringAsFixed((double)(wf.phase), 4);
            }

            string funcName;

            switch (wf.funcName)
            {
                case "sin":
                    this.statements.Add("float " + name + " = " + toStringAsFixed(wf.@base, 4) + " + sin((" + wf.phase + " + " + timeVar + " * " + toStringAsFixed(wf.freq, 4) + ") * 6.283) * " + toStringAsFixed(wf.amp, 4) + ";");
                    return;
                case "square": funcName = "square"; this.addSquareFunc(); break;
                case "triangle": funcName = "triangle"; this.addTriangleFunc(); break;
                case "sawtooth": funcName = "fract"; break;
                case "inversesawtooth": funcName = "1.0 - fract"; break;
                default:
                    this.statements.Add("float " + name + " = 0.0;");
                    return;
            }
            this.statements.Add("float " + name + " = " + toStringAsFixed(wf.@base, 4) + " + " + funcName + "(" + wf.phase + " + " + timeVar + " * " + toStringAsFixed(wf.freq, 4) + ") * " + toStringAsFixed(wf.amp, 4) + ";");
        }

        public static string toStringAsFixed(double value, int fractionDigits)
        {
            string result;

            result = (Math.Round(value, fractionDigits)).ToString();


            return result;
        }

        public void addSquareFunc()
        {
            List<string> lines = new List<string>();

            lines.Add("float square(float val) {");
            lines.Add("     return (mod(floor(val*2.0)+1.0, 2.0) * 2.0) - 1.0;");
            lines.Add("}");

            this.addFunction("square", lines);
        }

        public void addTriangleFunc()
        {
            List<string> lines = new List<string>();

            lines.Add("float triangle(float val) {");
            lines.Add("     return abs(2.0 * fract(val) - 1.0);");
            lines.Add("}");

            this.addFunction("triangle", lines);
        }
    }
}
