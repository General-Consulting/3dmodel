use <dotScad/stereographic_extrude.scad>
use <dotScad/multi_line_text.scad>

dimension = 250;
font_size=100;
font="Micro 5 Charted:style=Regular";
module
lani()
{
   translate([-100,-75,0]){
  multi_line_text([" LANI ", " LANI "],
       size = font_size,
       line_spacing = 75,
       valign = "bottom",
       halign = "left",
       font = font
       );
       
}
 translate([139,-112]) square([1, 214]);
}

module image(){

         lani();

}

module
lamp()
{
  stereographic_extrude(shadow_side_leng = dimension,
                        convexity = 30,
                        $fn = 100) image();
}

module
shadow()
{
  image();
}


$fn = 48;

model = "BOTH"; // [BOTH, SPHERE, SHADOW]
width = 400;
height = 400;
shadow_thickness = 1;
max_spirals = 244;
angle_step = 360 / $fn;
min_radius = 5;
init_radius = 5;


lamp();
