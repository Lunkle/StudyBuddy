import g4p_controls.*;
import java.awt.Font;
import java.text.SimpleDateFormat;
import java.util.*;

void setup(){
    size(800, 600);
    loadFonts();
    //createGUI();
}

void draw(){
    background(0);
    textAlign(CENTER);
    text(new SimpleDateFormat("EEEE dd MMMM yyyy").format(new Date()), width/2, height/2);
}
