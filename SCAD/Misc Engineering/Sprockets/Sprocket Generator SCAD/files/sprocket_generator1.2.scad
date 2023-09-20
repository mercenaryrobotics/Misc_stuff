// Sprocket generator v1

/* [Sprocket] */

// Example for 08B roller chain
teeth=10;
roller_d=8.51;
thickness=7.0; // 7.75 original 08B
pitch=12.70; // 12.7
tolerance=0.1;

/* [Shaft] */
shaft_d=22;
hole_d=16.5;
top_h=5;
bot_h=5;

/* [FS, FA] */
fs = 1;
fa = 7;

module sprocket(teeth=20, roller=3, pitch=17, thickness=3, tolerance=0.2){
	roller=roller/2; //We need radius in our calculations, not diameter
	distance_from_center=pitch/(2*sin(180/teeth));
	echo(distance_from_center);
	angle=(360/teeth);
	
    pitch_circle=sqrt((distance_from_center*distance_from_center) - (pitch*(roller+tolerance))+((roller+tolerance)*(roller+tolerance)));
	
    echo(pitch_circle);    
    
    difference(){
		union(){
            $fs=fs; 
            $fa=fa;
			cylinder(r=pitch_circle,h=thickness);
			for(tooth=[1:teeth]){
				intersection(){
					rotate(a=[0,0,angle*(tooth+0.5)]){
						translate([distance_from_center,0,0]){
                            $fs=fs; 
                            $fa=fa;
							cylinder(r=pitch-roller-tolerance,h=thickness);
						}
					}
					rotate(a=[0,0,angle*(tooth-0.5)]){
						translate([distance_from_center,0,0]){
							cylinder(r=pitch-roller-tolerance,h=thickness);
						}
					}
				}
			}
		}
		for(tooth=[1:teeth]){
			rotate(a=[0,0,angle*(tooth+0.5)]){
				translate([distance_from_center,0,-1]){
					$fs=fs; 
                    $fa=fa;
                    cylinder(r=roller+tolerance,h=thickness+2);
				}
			}
		}
	}
}

difference(){
    union(){
        sprocket(teeth,roller_d,pitch,thickness,tolerance);
        translate([0,0,thickness])
            cylinder(top_h,shaft_d/2,shaft_d/2,$fs=fs, $fa=fa); // TOP
        rotate([0,180])
            cylinder(bot_h,shaft_d/2,shaft_d/2,$fs=fs, $fa=fa); // BOT
    }
    translate([0,0,-bot_h-1]){ // Added -1 to make clean hole        
        cylinder(bot_h+thickness+top_h+2,hole_d/2,hole_d/2,$fs=fs, $fa=fa);
    }
}