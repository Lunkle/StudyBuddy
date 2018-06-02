class TimeTable extends Element {
    Event[] events;

    TimeTable(float xPos, float yPos, float tWidth, float tHeight, Event[] events) {
        super(xPos, yPos, tWidth, tHeight); //width/2 - 3 * PADDING, height/2 - 4 * PADDING);
        this.events = events;
    }
    
    TimeTable(float xPos, float yPos, float tWidth, float tHeight, Event[] events, Component parentComponent) {
        super(xPos, yPos, tWidth, tHeight, parentComponent);
        this.events = events;
    }

    void display() {
        fill(255);
        super.display();
        for (int i = 0; i < 24; i++) {
            rect(position.x, position.y + i * 20, size.x, 20);
        }
    }
}
