using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace Aletha
{
    /// <summary>
    /// Shader Tokenizer
    /// </summary>
    public class ShaderTokenizer
    {
        public List<String> tokens;
        public int offset;

        public ShaderTokenizer(String src)
        {


            src = strip_comments(src);

            this.tokens = tokenise_shader(src);

            this.offset = 0;
        }

        private string strip_comments(string shader_src)
        {
            //String no_comments_patt = "(\/\*[\w\'\s\r\n\*]*\*\/)|(\/\/[\w\s\']*)|(\<![\-\-\s\w\>\/]*\>)";
            //String no_comments_patt = r"\\*([^*]|[\r\n]|(\\*+([^*/]|[\r\n])))*\\*+";
            // Strip out comments    
            //src = src.replaceAll(new RegExp(no_comments_patt, multiLine: true, caseSensitive: false), '');

            // (\/\*[\w\'\s\r\n\*]*\*\/)|(\/\/[\w\s\']*)|(\<![\-\-\s\w\>\/]*\>)

            //src = src.replace(/\/\/.*$/mg, ''); // C++ style (//...)       
            //src = src.replace(/\/\*[^*\/]*\*\//mg, ''); // C style (/*...*/) (Do the shaders even use these?)


            string result;
            Regex regex;

            regex = new Regex("(\\/\\*[\\w\\'\\s\\r\\n\\*]*\\*\\/)|(\\/\\/[\\w\\s\']*)|(\\<![\\-\\-\\s\\w\\>\\/]*\\>)");

            result = regex.Replace(shader_src, "");

            return result;
        }

        private List<string> tokenise_shader (string shader_src)
        {
            //this.tokens = src.match(/[^\s\n\r\"]+/mg);
            //RegExp reg = new RegExp("[^\s\n\r\"]+");
            //this.tokens = reg.allMatches(src);

            List<string> tokens;
            Regex r;
            MatchCollection mc;

            r = new Regex("[^\\s\n\r\\\"]+");
            tokens = new List<string>();

            mc = r.Matches(shader_src);

            foreach(Match match in mc)
            {
                tokens.Add(match.Value);
            }

            return tokens;
        }

        public bool EOF()
        {
            if (this.tokens == null) { return true; }
            if (this.tokens.Count == 0) { return true; }

            //if(this.offset >= this.tokens.length) return true;

            //      var token = this.tokens[this.offset];
            //      while(token == '' && this.offset < this.tokens.length) {
            //          this.offset++;
            //          token = this.tokens[this.offset];
            //      }
            return this.offset >= this.tokens.Count;
        }
        
        public string next()
        {
            if (this.tokens == null) { return null; }

            string token = "";
            
            while (string.IsNullOrEmpty(token) && this.offset < this.tokens.Count)
            {
                if (this.offset >= this.tokens.Count) return null;

                token = this.tokens[this.offset];

                this.offset++;
            }
            return token;
        }

        public string prev()
        {
            if (this.tokens == null) { return null; }
            string token = "";
            while (string.IsNullOrEmpty(token) && this.offset >= 0)
            {
                this.offset--;
                token = this.tokens[this.offset];
            }
            return token;
        }

    }
}
