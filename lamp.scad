use <dotScad/stereographic_extrude.scad>
dimension = 100;

font="BlexMono Nerd Font Mono:style=Bold";
module
lani()
{
   translate([15,0,0])
  text("L",
       size = dimension,
       valign = "bottom",
       halign = "left",
       font = font
       );

  translate([ dimension * .6667, 0, 0 ])

    text("A",
         size = dimension,
         valign = "bottom",
         halign = "left",
         font=font);

  translate([ dimension * .6667 * 2, 0, 0 ])

    text("N",
         size = dimension,
         valign = "bottom",
         halign = "left",
         font=font

    );

  translate([ dimension * .6667 * 3-3, 0, 0 ])

    text("I",
         size = dimension,
         valign = "bottom",
         halign = "left",
         font=font

    );
}

module image(){
   n=6;
   angle = 360/n;
   for(i = [0:n]){
      rotate([0,0,i*angle])
         lani();

   }
}

module
lamp()
{
  stereographic_extrude(shadow_side_leng = dimension * 6,
                        convexity = 25,
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

//shadow();
lamp();