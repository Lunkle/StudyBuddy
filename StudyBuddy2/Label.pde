class Label extends Element {
    boolean bound = false;
    String[] text;

    void init(String[] text) {
        this.text = text;
    }

    Label(String text, float xPos, float yPos, float lWidth, float lHeight) {
        super(xPos, yPos, lWidth, lHeight);
        init(new String[]{text});
    }

    Label(String text, float xPos, float yPos, float lWidth, float lHeight, Component parentComponent) {
        super(xPos, yPos, lWidth, lHeight, parentComponent);
        init(new String[]{text});
    }

    Label(String[] text, float xPos, float yPos, float lWidth, float lHeight) {
        super(xPos, yPos, lWidth, lHeight);
        init(text);
    }

    Label(String text[], float xPos, float yPos, float lWidth, float lHeight, Component parentComponent) {
        super(xPos, yPos, lWidth, lHeight, parentComponent);
        init(text);
    }

    void display() {
        stroke(c5);
        pushMatrix();
        fill(245);
        super.display();
        translate(currentPosition.x, currentPosition.y);
        fill(0);
        textAlign(bound? LEFT:CENTER);
        textFont(ubuntu, 14);
        for (int i = 0; i < text.length; i++) {
            if (!bound || size.y > 2 * PADDING + i * 14) {
                text(text[bound? (text.length - 1 - i):i], bound? PADDING:currentSize.x/2, bound? (size.y - PADDING - i * 14):(currentSize.y/2 + 7 * (2 - text.length % 2) + 14 * (i - text.length/2)));
            }
        }
        popMatrix();
    }
}
