import g4p_controls.*;
import java.awt.Font;

void setup(){
    size(800, 600);
    loadFonts();
    //createGUI();
}

void draw(){
    background(0);
    textAlign(CENTER);
    text(month() + " " + day(), width/2, height/2);
}
