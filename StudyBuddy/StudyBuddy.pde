import android.view.inputmethod.InputMethodManager;
import android.content.Context;

InputMethodManager imm;

color c1 = color(250, 88, 43);
color c2 = color(250, 241, 145);
color c3 = color(194, 234, 155);
color c4 = color(127, 193, 145);
color c5 = color(23, 169, 146);

void setup() {
    fullScreen();
    imm = (InputMethodManager) getActivity().getSystemService(Context.INPUT_METHOD_SERVICE);
    new TextField(width/2, height/2, 500, 80);
}

void draw(){
    background(c2);
    textAlign(CENTER);
    textSize(80);
    fill(c5);
    text("StudyBuddy", width/2, height/4);
    for(int i = 0; i < textBoxes.length; i++){
        textBoxes[i].displayTextField();
    }
}

void keyPressed() {
    if(currentFocus != null){
        if (keyCode == BACKSPACE) {
            if (currentFocus.text.length() > 0) {
                currentFocus.text = currentFocus.text.substring(0, currentFocus.text.length()-1);
            }
        } else if((key > 31) && (key != CODED)){
            currentFocus.text += key;
        }
    }
}

boolean keyboardOpen = false;
void mousePressed(){
    boolean pressedTextField = false;
    for(int i = textBoxes.length - 1; i > -1; i--){
        if(mouseX > textBoxes[i].position.x && mouseX < textBoxes[i].position.x + textBoxes[i].boxWidth && mouseY > textBoxes[i].position.y && mouseY < textBoxes[i].position.y + textBoxes[i].boxHeight){
            toggleKeyboard(true);
            currentFocus = textBoxes[i];
            pressedTextField = true;
            break;
        }
    }
    if(pressedTextField == false){
        toggleKeyboard(false);
        currentFocus = null;
    }
}

void toggleKeyboard(boolean toggleOn){
    if(toggleOn == true && keyboardOpen == false) {
        openKeyboard();
        keyboardOpen = true;
    }else if(toggleOn == false && keyboardOpen == true){
        closeKeyboard();
        keyboardOpen = false;
    }
}