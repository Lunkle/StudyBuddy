class DayTile{
    Date date;
    Event[] events;
    JScrollPane panel;
    
    DayTile(JScrollPane panel, Date date, Event[] events){
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
        text(new SimpleDateFormat("EEEE dd MMMM yyyy").format(date), 100, 20);
    }
}
