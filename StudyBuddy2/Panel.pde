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
    calendarPanel = new Panel(width - 2 * PADDING - 7 * (WEEK_TILE_WIDTH + PADDING), PADDING, PADDING + 7 * (WEEK_TILE_WIDTH + PADDING), 2 * PADDING + 30 + 5 * (WEEK_TILE_HEIGHT + PADDING));
    weekPanel = new Panel(0, height/4, PADDING + 7 * (WEEK_TILE_WIDTH + PADDING), WEEK_TILE_HEIGHT + 2 * PADDING);
    weekPanel.draggable = true;
}
