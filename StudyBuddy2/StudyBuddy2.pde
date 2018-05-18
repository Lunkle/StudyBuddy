import javax.swing.JScrollPane;
import java.time.*;
import java.time.temporal.ChronoUnit;

final float PADDING = 5;
LocalDate today;

void setup() {
    size(800, 600);
    strokeWeight(2);
    today = LocalDate.now();
    loadFonts();
    loadEvents();
    loadWeek();
    getUsername();
}

void draw() { //<>//
    drawGradient(c2, c5);
    scale(1);
    weekPanel.display();
    weekPanel.position.x -= 1;
    //for (int i = 0; i < week.length; i++) {
    //    week[i].display();
    //}
}
