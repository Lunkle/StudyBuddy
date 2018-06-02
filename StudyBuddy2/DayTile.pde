import java.time.format.DateTimeFormatter;
final float WEEK_TILE_WIDTH = 78;
final float WEEK_TILE_HEIGHT = 90;
DayTile selectedTile = null;

DayTile[] dayTiles = {};

class DayTile extends Element {
    LocalDate date;
    Event[] events;
    TimeTable timeTable;
    
    void init(LocalDate date, Event[] events){
        this.date = date;
        this.events = events;
        //timeTable = new TimeTable(PADDING, PADDING, WEEK_TILE_WIDTH - 2 * PADDING, WEEK_TILE_HEIGHT - 2 * PADDING, events, this);
        dayTiles = (DayTile[]) append(dayTiles, this);
    }

    DayTile(float xPos, float yPos, LocalDate date, Event[] events) {
        super(xPos, yPos, WEEK_TILE_WIDTH, WEEK_TILE_HEIGHT);
        init(date, events);
    }
    
    DayTile(float xPos, float yPos, LocalDate date, Event[] events, Component parentComponent) {
        super(xPos, yPos, WEEK_TILE_WIDTH, WEEK_TILE_HEIGHT, parentComponent);
        init(date, events);
    }

    void display() {
        stroke(c3);
        pushMatrix();
        fill(245);
        super.display();
        translate(currentPosition.x, currentPosition.y);
        fill(0);
        textAlign(CENTER);
        textFont(ubuntu, expanded? 16:10);
        text(date.format(DateTimeFormatter.ofPattern("MMM dd, yyyy")), currentSize.x/2, 50);
        for (int i = 0; i < this.events.length; i++) {
            text(this.events[i].text, currentSize.x/2, 80 + 20 * i);
        }
        popMatrix();
    }

    void onSelect() {
        selectedTile = this;
    }

    void onRelease() {
        boolean stateBefore = this.expanded;
        for (int i = 0; i < dayTiles.length; i++) {
            dayTiles[i].expanded = false;
        }
        this.expanded = !stateBefore;
        selectedTile = null;
        parentComponent.switchOrder(this.number, parentComponent.subComponents.length - 1);
    }
}
