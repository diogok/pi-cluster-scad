include <base.scad>

base_width=arrow_depth*2+spacing;

difference() {
  union() {
    cube([base_depth,base_width,base_height]);
    
    translate([arrow_depth*-1,entry_depth-spacing,0]) arrow_up();
    translate([0,base_width,0]) arrow_left();
  }
  translate([0,0,0]) 
    entry_left();
  translate([base_depth-entry_depth,entry_depth-spacing,0]) 
    entry_up();
}