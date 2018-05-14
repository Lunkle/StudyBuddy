import java.time.format.DateTimeFormatter;

class DayTile {
    LocalDate date;
    Event[] events;

    DayTile(LocalDate date, Event[] events) {
        this.date = date;
        this.events = events;
    }

    void display() {
        fill(245);
        translate(100, 100);
        rect(0, 0, 200, 250);
        fill(0);
        textAlign(CENTER);
        textFont(ubuntu, 16);
        text(date.format(DateTimeFormatter.ofPattern("MMM dd, yyyy")), 100, 50);
    }
}
