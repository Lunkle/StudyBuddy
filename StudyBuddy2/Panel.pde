Panel[] panels = {};

Panel canvasPanel;
Panel weekPanel;
Panel calendarPanel;

Panel selectedPanel;

class Panel extends Component {
    boolean visible = true;
    boolean draggable = false;
    boolean transparent = false;
    color colour;

    float velocity = 0;

    Panel(float xPos, float yPos, float pWidth, float pHeight) {
        super(xPos, yPos, pWidth, pHeight);
        panels = (Panel[]) append(panels, this);
        colour = c3;
    }
    
    Panel(float xPos, float yPos, float pWidth, float pHeight, Component parentComponent) {
        super(xPos, yPos, pWidth, pHeight, parentComponent);
        panels = (Panel[]) append(panels, this);
        colour = c3;
    }

    void setColour(color colour) {
        this.colour = colour;
    }

    void display() {
        position.x += velocity;
        velocity *= 0.8;
        if (visible) {
            stroke(c4);
            fill(colour);
            if (transparent) {
                noFill();
            }
            super.display();
        }
    }

    void onSelect() {
        selectedPanel = this;
    }

    void onDrag() {
        if (draggable) {
            velocity = mouseX - pmouseX;
        }
    }

    void onRelease() {
        selectedPanel = null;
    }
}

void initPanels() {
    canvasPanel = new Panel(0, 0, width, height);
    canvasPanel.transparent = true;
    calendarPanel = new Panel(width - 2 * PADDING - 7 * (MONTH_TILE_WIDTH + PADDING), PADDING, PADDING + 7 * (MONTH_TILE_WIDTH + PADDING), 2 * PADDING + 30 + 5 * (MONTH_TILE_HEIGHT + PADDING));
    canvasPanel.addComponent(calendarPanel);
    weekPanel = new Panel(PADDING, 26 + 2 * PADDING, WEEK_TILE_WIDTH + 2 * PADDING, 26 + 2 * PADDING + 7 * (WEEK_TILE_HEIGHT + PADDING));
    canvasPanel.addComponent(weekPanel);
}
