using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aletha
{
    public class Viewport
    {
        public double width, height;
        public double x, y;

        public static Viewport Zero
        {
            get
            {
                Viewport view;

                view = new Viewport();
                view.width = 0;
                view.height = 0;
                view.x = 0;
                view.y = 0;

                return view;
            }
        }

    }
}
