class Screen{
    String name;
    color background;
    TextField[] textBoxes = {};
    
    Screen(String name, color backgroundColour){
        this.name = name;
        background = backgroundColour;
    }
    
    void displayScreen(){
        background(background);
        for(int i = 0; i < textBoxes.length; i++){
            textBoxes[i].displayTextField();
        }
    }
}