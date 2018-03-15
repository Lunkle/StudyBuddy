import android.view.inputmethod.InputMethodManager;
import android.content.Context;

InputMethodManager imm;

color c1 = color(250, 88, 43);
color c2 = color(250, 241, 145);
color c3 = color(194, 234, 155);
color c4 = color(127, 193, 145);
color c5 = color(23, 169, 146);

Screen currentScreen;

void setup() {
    fullScreen();
    imm = (InputMethodManager) getActivity().getSystemService(Context.INPUT_METHOD_SERVICE);
    Screen loginScreen = new Screen("Login", c2);
    currentScreen = loginScreen;
    TextField username = new TextField(width/2, height/2, 500, 80);
    username.addToScreen(loginScreen);
}

void draw(){
    background(c2);
    textAlign(CENTER);
    textSize(80);
    fill(c5);
    text("StudyBuddy", width/2, height/4);
    currentScreen.displayScreen();
}

void keyPressed() {
    if(currentFocus != null){
        if (keyCode == BACKSPACE) {
            currentFocus.deleteCharacter();
        } else if((key > 31) && (key != CODED)){
            currentFocus.addCharacter(key);
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
            currentFocus.setFocus(mouseX);
            print("done set focus");
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