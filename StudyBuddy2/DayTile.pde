class DayTile{
    LocalDate date;
    Event[] events;
    JScrollPane panel;
    
    DayTile(JScrollPane panel, LocalDate date, Event[] events){
        this.panel = panel;
        this.date = date;
        this.events = events;
    }
    
    void display(){
        fill(225);
        translate(100, 100);
        rect(0, 0, 200, 250);
        fill(0);
        textAlign(CENTER);
        textFont(arvo, 16);
        text(date.toString(), 100, 20);
    }
}
