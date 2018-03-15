TextField[] textBoxes = {};
TextField currentFocus;
float k = 2*PI/(530 * frameRate/100);
int padding = 3;

class TextField{
    int number;
    PVector position;
    int boxWidth;
    int boxHeight;
    
    int setFocusedFrame;
    String text = "";
    int textCursorPosition = 0;
    
    public TextField(int middleX, int middleY, int boxWidth, int boxHeight){
        position = new PVector(middleX - boxWidth/2, middleY - boxHeight/2);
        this.boxWidth = boxWidth;
        this.boxHeight = boxHeight;
        number = textBoxes.length;
        textBoxes = (TextField[]) append(textBoxes, this);
    }
    
    void addToScreen(Screen screen){
        screen.textBoxes = (TextField[]) append(textBoxes, this);
    }
    
    public void displayTextField(){
        noStroke();
        //Draw text field.
        fill(0);
        rect(position.x, position.y, boxWidth, boxHeight);
        fill(255);
        rect(position.x + padding, position.y + padding, boxWidth - padding - padding, boxHeight - padding - padding);
        //Draw text.
        fill(0);
        textAlign(LEFT);
        textSize(boxHeight - 20);
        text(" " + text, position.x, position.y + boxHeight - padding - 15);
        //Draw text cursor if focused.
        stroke(0);
        if(currentFocus != null){
            if(currentFocus.equals(this) && sin(k *(frameCount - setFocusedFrame)) >= 0){
                int xValue = parseInt(position.x + textWidth(" " + text.substring(0, textCursorPosition)));
                line(xValue, position.y + padding + 5, xValue, position.y + boxHeight - padding - 5);
            }
        }
    }
    
    void deleteCharacter(){
        if(textCursorPosition != 0){
            String text1 = text.substring(0, textCursorPosition - 1);
            String text2 = text.substring(textCursorPosition, text.length());
            text = text1 + text2;
            textCursorPosition--;
        }
    }
    
    void addCharacter(char character){
        String text1 = text.substring(0, textCursorPosition);
        String text2 = text.substring(textCursorPosition, text.length());
        text = text1 + character + text2;
        println(text1, character, text2);
        textCursorPosition++;
    }
    
    float overShoot =  0;
    void setFocus(int pressedX){
        textSize(boxHeight - 20);
        int boxPressedX = round(pressedX - position.x - textWidth(" "));
        int upperBound = text.length();
        int lowerBound = 0;
        println(upperBound);
        if(boxPressedX > textWidth(text)){
            textCursorPosition = upperBound; 
            return;
        }
        int guess = round(boxPressedX/textWidth(" "));
        while(upperBound - lowerBound > 1){
            println("guess is " + guess);
            int tWidthToGuess = round(textWidth(text.substring(0, guess)));
            println(boxPressedX, tWidthToGuess, upperBound, lowerBound, textWidth(text));
            if(tWidthToGuess == boxPressedX){
                textCursorPosition = guess;
                return;
            }else if(tWidthToGuess < boxPressedX){
                lowerBound = guess;
                guess += round((1 + overShoot) * (boxPressedX - tWidthToGuess)/textWidth(" ")); 
            }else{
                upperBound = guess;
                guess -= round((1 + overShoot) * (tWidthToGuess - boxPressedX)/textWidth(" "));
            }
        }
        int tWidthToUpperBound = round(textWidth(text.substring(0, upperBound)));
        int tWidthToLowerBound = round(textWidth(text.substring(0, lowerBound)));
        if(tWidthToUpperBound - boxPressedX > boxPressedX - tWidthToLowerBound){
            textCursorPosition = upperBound;
        }else{
            textCursorPosition = lowerBound;
        }
    }
    
    void clearAllTextFields(){
        textBoxes = new TextField[0];
    }
}