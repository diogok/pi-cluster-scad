pi_width=65;

arrow_diag=13;
arrow_spacing=1;
arrow_depth=arrow_diag+arrow_spacing;
entry_depth=arrow_depth-arrow_spacing;

plug_size=5;
plug_gap=1.5;
plug_total_size=plug_size+plug_gap+plug_size;

spacing=3;

base_height=3;

base_width=entry_depth+spacing+pi_width+spacing+spacing;
base_depth=spacing+plug_total_size+spacing+entry_depth;

module arrow_up() {
  translate([8,0,0]) 
  union() {
    rotate([0,0,45]) cube([10,10,base_height]);
    translate([4,4,0]) cube([4,6,base_height]);
  }
}

module arrow_left() {
  translate([4,16,0]) rotate([0,0,270]) arrow_up();
}

module entry_up() {
  difference() {
    arrow_up();
    translate([14,14,0]) cube([3,6,base_height]);
  }
}

module entry_left() { 
  translate([0,arrow_spacing*-1,0]) difference() {
    arrow_left();
    translate([14,14,0]) cube([3,6,base_height]);
  }
}

module pi_plug_single() {
   union() { 
      translate([0,0,base_height]) cube([plug_size,plug_size,plug_size]);
      translate([plug_gap+plug_size,0,base_height]) cube([plug_size,plug_size,plug_size]);
   }
}

module pi_plug() {
   union() { 
      translate([0,0,base_height]) cube([plug_size,plug_size,plug_size]);
      translate([plug_gap+plug_size,0,base_height]) cube([plug_size,plug_size,plug_size]);
      translate([0,pi_width-plug_size,base_height]) cube([plug_size,plug_size,plug_size]);
      translate([plug_gap+plug_size,pi_width-plug_size,base_height]) cube([plug_size,plug_size,plug_size]);
   }
}


