import java.time.format.DateTimeFormatter;
final float WEEK_TILE_WIDTH = 200;
final float WEEK_TILE_HEIGHT = 250;

class DayTile extends Element{
    LocalDate date;
    Event[] events;

    DayTile(float xPos, float yPos, LocalDate date, Event[] events) {
        super(xPos, yPos, WEEK_TILE_WIDTH, WEEK_TILE_HEIGHT);
        this.date = date;
        this.events = events;
    }

    void display() {
        stroke(c3);
        pushMatrix();
        fill(245);
        super.display();
        fill(0);
        textAlign(CENTER);
        textFont(ubuntu, 16);
        text(date.format(DateTimeFormatter.ofPattern("MMM dd, yyyy")), 100, 50);
        //println(this.events.length);
        for(int i = 0; i < this.events.length; i++){
            text(this.events[i].text, WEEK_TILE_WIDTH/2, 80 + 20 * i);
        }
        popMatrix();
    }
}
