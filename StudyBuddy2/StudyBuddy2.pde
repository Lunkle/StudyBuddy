import java.awt.Font;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.JScrollPane;

DayTile dt = new DayTile(null, new Date(), new Event[]{});

void setup(){
    size(800, 600);
    loadFonts();
    getUsername();
}

void draw(){
    background(0);
    dt.display();
}
