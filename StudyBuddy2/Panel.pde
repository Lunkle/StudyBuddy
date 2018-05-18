Panel[] panels = {};

Panel startPanel;
Panel weekPanel;

class Panel {
    PVector position;
    PVector size;
    DayTile[] elements = {};
    boolean visible = true;

    Panel(float xPos, float yPos, float pWidth, float pHeight) {
        position = new PVector(xPos, yPos);
        size = new PVector(pWidth, pHeight);
        panels = (Panel[]) append(panels, this);
    }

    void addElement(DayTile element) {
        elements = (DayTile[]) append(elements, element);
    }

    void display() {
        if (visible) {
            translate(position.x, position.y);
            stroke(c4);
            fill(c3);
            rect(0, 0, size.x, size.y);
            for (int i = 0; i < elements.length; i++) {
                elements[i].display();
            }
        }
    }
}

void initPanels() {
    startPanel = new Panel(0, 0, width, height);
}
