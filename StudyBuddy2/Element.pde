abstract class Element{
    PVector position;
    PVector size;
    
    Element(float xPos, float yPos, float eWidth, float eHeight){
        position = new PVector(xPos, yPos);
        size = new PVector(eWidth, eHeight);
    }
    
    void display(){
        translate(position.x, position.y);
        rect(0, 0, size.x, size.y);
    }
}
