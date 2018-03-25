//import android.view.inputmethod.InputMethodManager;
//import android.content.Context;

//InputMethodManager imm;

color c1 = color(250, 88, 43);
color c2 = color(250, 241, 145);
color c3 = color(194, 234, 155);
color c4 = color(127, 193, 145);
color c5 = color(23, 169, 146);

PFont arvo;
PFont ubuntu;

Screen currentScreen;

void setup() {
    fullScreen();
    //imm = (InputMethodManager) getActivity().getSystemService(Context.INPUT_METHOD_SERVICE);
    
    arvo = createFont("arvo/Arvo-Regular.ttf", 72);
    ubuntu = createFont("ubuntu/Ubuntu-R.ttf", 72);
    
    Screen loginScreen = new Screen("Login", c2);
    currentScreen = loginScreen;
    TextField enterDisplayName = new TextField(width/2, height/2, 400, 50);
    loginScreen.addComponent(enterDisplayName);
    Label title = new Label("StudyBuddy", 80, width/2, 3 * height/8, c5);
    loginScreen.addComponent(title);
    loginScreen.addGradient(c3);
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
    for(int i = currentScreen.components.length - 1; i > -1; i--){
        if(currentScreen.components[i] instanceof TextField){
            TextField textField = (TextField) currentScreen.components[i];
            if(mouseX > textField.position.x && mouseX < textField.position.x + textField.boxWidth && mouseY > textField.position.y && mouseY < textField.position.y + textField.boxHeight){
                //toggleKeyboard(true);
                currentFocus = textField;
                currentFocus.setFocus(mouseX);
                print("done set focus");
                pressedTextField = true;
                break;
            }
        }
    }
    if(pressedTextField == false){
        //toggleKeyboard(false);
        currentFocus = null;
    }
}

//void toggleKeyboard(boolean toggleOn){
//    if(toggleOn == true && keyboardOpen == false) {
//        openKeyboard();
//        keyboardOpen = true;
//    }else if(toggleOn == false && keyboardOpen == true){
//        closeKeyboard();
//        keyboardOpen = false;
//    }
//}
