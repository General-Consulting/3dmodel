use <dotScad/stereographic_extrude.scad>
dimension = 250;
font_size=100;
font="Micro 5 Charted:style=Regular";
module
lani()
{
rotate([0,0,90])
   translate([-100,-70,0]){
  text(" LANI ",
       size = font_size,
       valign = "bottom",
       halign = "left",
       font = font
       );
       
 translate([139,-50]) square([1, 139]);
}
}

module image(){

         lani();

}

module
lamp()
{
  stereographic_extrude(shadow_side_leng = dimension,
                        convexity = 8,
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
shadow();
