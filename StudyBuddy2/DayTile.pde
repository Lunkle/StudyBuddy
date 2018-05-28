import java.time.format.DateTimeFormatter;
final float WEEK_TILE_WIDTH = 200;
final float WEEK_TILE_HEIGHT = 250;

DayTile selectedTile = null;

DayTile[] dayTiles = {};

class DayTile extends Element {
    LocalDate date;
    Event[] events;

    DayTile(float xPos, float yPos, LocalDate date, Event[] events) {
        super(xPos, yPos, WEEK_TILE_WIDTH, WEEK_TILE_HEIGHT);
        this.date = date;
        this.events = events;
        dayTiles = (DayTile[]) append(dayTiles, this);
    }

    void display() {
        stroke(c3);
        pushMatrix();
        fill(245);
        super.display();
        translate(parentPanel.position.x + currentPosition.x, parentPanel.position.y + currentPosition.y);
        fill(0);
        textAlign(CENTER);
        textFont(ubuntu, 16);
        text(date.format(DateTimeFormatter.ofPattern("MMM dd, yyyy")), currentSize.x/2, 50);
        for (int i = 0; i < this.events.length; i++) {
            text(this.events[i].text, currentSize.x/2, 80 + 20 * i);
        }
        popMatrix();
    }

    boolean selected(float selectedX, float selectedY) {
        if (expanded) {
            if (selectedX > PADDING && selectedX < width - PADDING && selectedY > PADDING && selectedY < height - PADDING) {
                return true;
            }
            return false;
        } else {
            return super.selected(selectedX, selectedY);
        }
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
        switchOrder(this.number, components.length - 1);
    }
}
