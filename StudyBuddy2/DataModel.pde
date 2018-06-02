final String[] daysOfWeek = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

String name;
Label nameLabel;
boolean nameFieldVisible = false;
Button editName;

Event[][] events = new Event[1][0];
DayTile[] week = new DayTile[7];
DayTile[] month;

void initHomeScreen(){
    nameLabel = new Label("Hi, " + name, PADDING, PADDING, 199, 26, canvasPanel);
    editName = new Button(loadImage("pencil.png"), nameLabel.size.x - 16 - PADDING, PADDING, 16, 16, nameLabel);
    editName.setOnClick(new Runnable(){
        @Override
        public void run(){
            nameFieldVisible = !nameFieldVisible;
            nameField.setVisible(nameFieldVisible);
        }
    });
    loadWeek();
    loadMonth();
}

void getUsername() {
    String[] lines = loadStrings("Name.txt");//"http://localhost:8080/StudyBuddy/?name=Donny&2ndname=Dan");//
    name = lines[0];
}
