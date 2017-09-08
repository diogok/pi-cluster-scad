include <base.scad>;

difference() {
  union() {
    cube([base_depth,base_width,base_height]);
      
    translate([spacing,entry_depth+spacing,0]) pi_plug();
      
    translate([arrow_depth*-1,entry_depth-spacing,0]) arrow_up();
    translate([arrow_depth*-1,base_width-entry_depth-spacing,0]) arrow_up();
    translate([0,base_width,0]) arrow_left();
  }
    
  translate([0,0,0]) 
    entry_left();
  translate([base_depth-entry_depth,entry_depth-spacing,0]) 
    entry_up();
  translate([base_depth-entry_depth,base_width-arrow_diag-spacing,0])  
    entry_up();
  
  translate([spacing,entry_depth+spacing+plug_size+spacing,0])
    cube([plug_total_size+spacing,pi_width-plug_size*2-spacing*2,base_height]);
   
  translate([base_depth-spacing-entry_depth,entry_depth*2,0])
    cube([arrow_diag,base_width-entry_depth*3-spacing*2,base_height]);
}