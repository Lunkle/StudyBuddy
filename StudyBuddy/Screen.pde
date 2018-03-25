class Screen{
    String name;
    color background;
    color background2;
    boolean gradient = false;
    UIComponent[] components = {};
    
    Screen(String name, color backgroundColour){
        this.name = name;
        background = backgroundColour;
    }
    
    void addGradient(color secondBackgroundColour){
        gradient = true;
        background2 = secondBackgroundColour;
    }
    
    void addComponent(UIComponent component){
        component.number = components.length;
        components = (UIComponent[]) append(components, component);
    }
    
    void removeComponent(int componentNumber){
        components = 
    }
    
    void displayScreen(){
        background(background);
        if(gradient){
            for(float i = 0; i < height; i++){
                stroke(lerpColor(background, background2, i/height));
                line(0, i, width, i);
            }
        }
        for(int i = 0; i < components.length; i++){
            components[i].displayComponent();
        }
    }
}
