TextField currentFocus;
int padding = 3;

class TextField extends UIComponent {
    int boxWidth;
    int boxHeight;

    int setFocusedTime;
    String text = "";
    int textCursorPosition = 0;

    public TextField(int middleX, int middleY, int boxWidth, int boxHeight) {
        super(middleX - boxWidth/2, middleY - boxHeight/2);
        this.boxWidth = boxWidth;
        this.boxHeight = boxHeight;
    }

    public void displayComponent() {
        noStroke();
        //Draw text field.
        fill(0);
        rect(position.x, position.y, boxWidth, boxHeight);
        fill(255);
        rect(position.x + padding, position.y + padding, boxWidth - padding - padding, boxHeight - padding - padding);
        //Draw text.
        fill(0);
        textAlign(LEFT);
        textFont(arvo, boxHeight - 20);
        text(" " + text, position.x, position.y + padding + 6.5 * boxHeight/10);
        //Draw text cursor if focused.
        stroke(0);
        strokeWeight(1);
        //strokeWeight(2);
        if (currentFocus != null) {
            if (currentFocus.equals(this) && sin(PI/180 * 0.5 * (millis() - setFocusedTime)) >= 0) {
                int xValue = parseInt(position.x + textWidth(" " + text.substring(0, textCursorPosition)));
                line(xValue, position.y + padding + 5, xValue, position.y + boxHeight - padding - 5);
            }
        }
    }

    void deleteCharacter() {
        if (textCursorPosition != 0) {
            String text1 = text.substring(0, textCursorPosition - 1);
            String text2 = text.substring(textCursorPosition, text.length());
            text = text1 + text2;
            textCursorPosition--;
        }
        setFocusedTime = millis();
    }

    void addCharacter(char character) {
        textFont(arvo, boxHeight - 20);
        if (textWidth(text) + textWidth(character) > boxWidth - padding - textWidth(" ")) {
            Label tooLongWarning = new Label("Name too long", boxHeight - 20, position.x, position.y + boxHeight + boxHeight - 15, c1);
            tooLongWarning.setPositioning(LEFT);
            tooLongWarning.setTimer(1000);
            currentScreen.addComponent(tooLongWarning);
        } else {
            String text1 = text.substring(0, textCursorPosition);
            String text2 = text.substring(textCursorPosition, text.length());
            text = text1 + character + text2;
            textCursorPosition++;
        }
        setFocusedTime = millis();
    }

    float overShoot =  0;
    void setFocus(float pressedX) {
        textSize(boxHeight - 20);
        float boxPressedX = round(pressedX - position.x - textWidth(" "));
        if (boxPressedX > textWidth(text)) {
            textCursorPosition = text.length();
            return;
        }
        float previousTextWidth = 0;
        println(boxPressedX, textWidth("W"));
        for (int i = parseInt(boxPressedX/textWidth("W")); i < text.length(); i++) {
            print(i);
            float textWidth = textWidth(text.substring(0, i));
            if (textWidth > boxPressedX) {
                println(true);
                if (textWidth - boxPressedX > boxPressedX - previousTextWidth) {
                    textCursorPosition = i - 1;
                    break;
                } else {
                    textCursorPosition = i;
                    break;
                }
            }
            previousTextWidth = textWidth;
        }
        setFocusedTime = millis();
    }
}
