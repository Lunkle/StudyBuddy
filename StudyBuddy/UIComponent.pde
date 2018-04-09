abstract class UIComponent {
    int number;
    Screen screen;
    PVector position;

    UIComponent(float xPos, float yPos) {
        position = new PVector(xPos, yPos);
    }

    void displayComponent() {
    }
}
