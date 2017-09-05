pi_width=65;

arrow_diag=14;
arrow_spacing=2;
arrow_depth=arrow_diag+arrow_spacing;
entry_depth=arrow_depth-2;

plug_size=5;
plug_gap=2;
plug_total_size=plug_size+plug_gap+plug_size;

spacing=5;

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
  color("LimeGreen") {
      difference() {
        arrow_up();
        translate([14,14,0]) cube([3,6,base_height]);
      }
  }
}

module entry_left() {
  translate([0,entry_depth,0]) rotate([0,0,270]) entry_up();
}

module pi_plug() {
   union() { 
      translate([0,0,base_height]) cube([plug_size,plug_size,plug_size]);
      translate([plug_gap+plug_size,0,base_height]) cube([plug_size,plug_size,plug_size]);
      translate([0,pi_width-plug_size,base_height]) cube([plug_size,plug_size,plug_size]);
      translate([plug_gap+plug_size,pi_width-plug_size,base_height]) cube([plug_size,plug_size,plug_size]);
   }
}

union() {
   
  translate([0,entry_depth,0]) arrow_up();
  translate([0,base_width-entry_depth-spacing,0]) arrow_up();
  translate([arrow_diag+spacing,base_width,0]) arrow_left();
    
  translate([arrow_depth,0,0]) difference() {
    union(){
      cube([base_depth,base_width,base_height]);
      translate([spacing,entry_depth+spacing,0]) pi_plug();
    }
    
    translate([spacing,0,0]) 
      entry_left();
    translate([base_depth-entry_depth,entry_depth,0]) 
      entry_up();
    translate([base_depth-entry_depth,base_width-arrow_diag-spacing,0])  
      entry_up();
    
    translate([spacing,entry_depth+spacing+plug_size+spacing,0])
      cube([plug_total_size+spacing,pi_width-plug_size*2-spacing*2,base_height]);
   
    translate([spacing+arrow_diag,entry_depth+spacing+plug_size+spacing*2,0])
      cube([arrow_diag,pi_width-plug_size*2-spacing*4,base_height]);
  }
  
}
