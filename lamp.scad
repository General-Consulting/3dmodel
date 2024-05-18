dimension = 100;


module image() {
   text(
        "L", size = dimension, 
        valign = "bottom", 
        halign = "left",
        font = "Athelas:style=Italic"
   );

translate([dimension * .6667,0,0])

   text(
        "A", size = dimension, 
        valign = "bottom", 
        halign = "left",
        font = "Athelas:style=Italic"
   );

translate([dimension* .6667 * 2,0,0])

   text(
        "N", size = dimension, 
        valign = "bottom", 
        halign = "left",
        font = "Athelas:style=Italic"

   );
   
translate([dimension* .6667*3+10,0,0])

   text(
        "I", size = dimension, 
        valign = "bottom", 
        halign = "left",
        font = "Athelas:style=Italic"

   );

}

module lamp() {
stereographic_extrude(shadow_side_leng = dimension*2, convexity = 5, $fn=100)
translate([-125,0,0])
    image();
}


module shadow() {
    image();
}




use <dotScad/experimental/foliage_scroll.scad>
use <dotScad/stereographic_extrude.scad>
use <dotScad/util/count.scad>

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



