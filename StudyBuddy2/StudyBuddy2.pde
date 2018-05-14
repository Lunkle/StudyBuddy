import javax.swing.JScrollPane;
import java.time.*;
import java.time.temporal.ChronoUnit;

LocalDate today;

void setup() {
    size(800, 600);
    today = LocalDate.now();
    loadFonts();
    loadEvents();
    loadWeek();
    getUsername();
}

void draw() {
    drawGradient(c2, c5);
    for (int i = 0; i < week.length; i++) {
        week[i].display();
    }
}
