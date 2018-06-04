class TimeTable extends Element {
    Event[] events;

    TimeTable(float xPos, float yPos, float tWidth, float tHeight, Event[] events) {
        super(xPos, yPos, tWidth, tHeight); //width/2 - 3 * PADDING, height/2 - 4 * PADDING);
        this.events = events;
        visible = false;
    }

    TimeTable(float xPos, float yPos, float tWidth, float tHeight, Event[] events, Component parentComponent) {
        super(xPos, yPos, tWidth, tHeight, parentComponent);
        this.events = events;
        visible = false;
    }

    void display() {
        if (visible) {
            fill(c2);
            stroke(c4);
            super.display();
            textAlign(LEFT);
            textSize(16);
            rect(position.x, position.y, size.x, size.y/25);
            fill(0);
            text("Time", position.x + PADDING, position.y + 16);
            text("Events", position.x + 100 + PADDING, position.y + 16);
            int index = 0;
            for (int i = 1; i < 25; i++) {
                fill(245);
                rect(position.x, position.y + i * size.y/25, size.x, size.y/25);
                fill(0);
                text(str(i) + ":00", position.x + PADDING, position.y + i * size.y/25 + 16);
                if (events.length != 0 && index < events.length) {
                    if (new Time(i, 0).isAfter(events[index].time)) {
                        text(events[index].toString(), position.x + 100 + PADDING, position.y + i * size.y/25 + 16);
                        index++;
                    }
                }
            }
            line(position.x + 100, position.y, position.x + 100, position.y + size.y);
        }
    }
}
