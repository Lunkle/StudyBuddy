Component[] components = {};

class Component {
    PVector position;
    PVector size;
    PVector currentPosition;
    PVector currentSize;
    PVector originalPosition;
    PVector originalSize;
    int number;

    Component(float xPos, float yPos, float cWidth, float cHeight) {
        position = new PVector(xPos, yPos);
        size = new PVector(cWidth, cHeight);
        currentPosition = position.copy();
        currentSize = size.copy();
        originalPosition = position.copy();
        originalSize = size.copy();
        number = components.length;
        components = (Component[]) append(components, this);
    }

    boolean selected(float selectedX, float selectedY) {
        if (selectedX > position.x && selectedX < position.x + size.x && selectedY > position.y && selectedY < position.y + size.y) {
            return true;
        }
        return false;
    }

    void display() {
        currentPosition.add(position.copy().sub(currentPosition).mult(0.1));
        currentSize.add(size.copy().sub(currentSize).mult(0.1));
        rect(currentPosition.x, currentPosition.y, currentSize.x, currentSize.y);
    }

    void onSelect() {
    }

    void onRelease() {
    }
}

void switchOrder(int index1, int index2) {
    int tempNum = components[index1].number;
    components[index1].number = components[index2].number;
    components[index2].number = tempNum;
    Component temp = components[index1];
    components[index1] = components[index2];
    components[index2] = temp;
}

void displayComponents() {
    for (int i = 0; i < components.length; i++) {
        components[i].display();
    }
}
