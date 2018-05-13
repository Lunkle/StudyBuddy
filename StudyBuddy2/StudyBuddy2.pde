import java.awt.Font;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.JScrollPane;


void setup(){
    size(800, 600);
    loadFonts();
    loadEvents();
    getUsername();
}

void draw(){
    background(0);
    for(int i = 0; i < week.length; i++){
        week[i].display();
    }
}
