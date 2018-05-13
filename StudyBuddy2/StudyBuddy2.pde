import javax.swing.JScrollPane;
import java.time.*;

LocalDate today;

void setup(){
    size(800, 600);
    today = LocalDate.now();
    loadFonts();
    loadEvents();
    loadWeek();
    getUsername();
}

void draw(){
    background(0);
    for(int i = 0; i < week.length; i++){
        week[i].display();
    }
}
