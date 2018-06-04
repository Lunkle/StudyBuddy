final String[] daysOfWeek = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

String sessionID = "";
String[] messages = {"==========Chat=========="};
String name;
Label nameLabel;
Label weekLabel;
Label reminderLabel;
Label chatBox;
boolean nameFieldVisible = false;
Button editName;
Button docLink;
Button driveLink;
Button hi;

Event[][] events = new Event[1][0];
DayTile[] week = new DayTile[7];
DayTile[] month;

void initHomeScreen() {
    nameLabel = new Label("Hi, " + name, PADDING, PADDING, 199, 26, canvasPanel);
    editName = new Button(loadImage("pencil.png"), nameLabel.size.x - 16 - PADDING, PADDING, 16, 16, nameLabel);
    editName.border = false;
    editName.fill = false;
    editName.setOnClick(new Runnable() {
        @Override
            public void run() {
            nameFieldVisible = !nameFieldVisible;
            nameField.setVisible(nameFieldVisible);
        }
    }
    );
    docLink = new Button(loadImage("newDoc.png"), 2 * PADDING + weekPanel.size.x - 1, 2 * PADDING + calendarPanel.size.y, 100, 100, canvasPanel);
    docLink.setOnClick(new Runnable() {
        @Override
            public void run() {
            link("www.docs.google.com/document/create");
        }
    }    
    );
    driveLink = new Button(loadImage("toDrive.png"), 3 * PADDING + weekPanel.size.x + 100, 2 * PADDING + calendarPanel.size.y, 100, 100, canvasPanel);
    driveLink.setOnClick(new Runnable() {
        @Override
            public void run() {
            link("www.drive.google.com");
        }
    }    
    );
    docLink = new Button(loadImage("newDoc.png"), 2 * PADDING + weekPanel.size.x - 1, 2 * PADDING + calendarPanel.size.y, 100, 100, canvasPanel);
    docLink.setOnClick(new Runnable() {
        @Override
            public void run() {
            link("www.docs.google.com/document/create");
        }
    }    
    );
    driveLink = new Button(loadImage("toDrive.png"), 4 * PADDING + weekPanel.size.x + 200, 2 * PADDING + calendarPanel.size.y, 100, 100, canvasPanel);
    driveLink.setOnClick(new Runnable() {
        @Override
            public void run() {
            link("www.drive.google.com");
        }
    }    
    );
    weekLabel = new Label("This week's schedule:", PADDING, PADDING, 199 - 2 * PADDING, 26, weekPanel);
    reminderLabel = new Label(new String[]{"Friendly Reminder:", "Don't forget to drink water"}, width - PADDING - 270, height - PADDING - 99, 270, 100, canvasPanel);
    chatBox = new Label(messages, PADDING, 3 * PADDING + weekPanel.size.y + nameLabel.size.y, weekPanel.size.x, height - (4 * PADDING + weekPanel.size.y + nameLabel.size.y) - 26, canvasPanel);
    chatBox.bound = true;
    loadWeek();
    loadMonth();
}

void getUsername() {
    String[] lines = loadStrings("Name.txt");
    name = lines[0];
}

void getSessionID() {
    try {
        String[] sessionIDRaw = loadStrings("http://192.168.0.76/StudyBuddy/?cmd=connect&username=" + name);
        sessionID = sessionIDRaw[0].split("=")[1];
        println("Session ID:", sessionID);
    }
    catch(Exception e) {
        println("Could not contact server");
    }
}

void sendMessage(String message) {
    String response = "";
    while (!response.equals("OK")) {
        String[] responseRaw = loadStrings("http://192.168.0.76/StudyBuddy/?cmd=sendMsg&sessionID=" + sessionID + "&message=" + message);
        response = responseRaw[0].split("=")[1];
    }
    println("sent");
}

void dumbSend(String message){
    messages = (String[]) append(messages, name + ": " + message);
    chatBox.text = messages;
}

void getMessages() {
    float time = millis();
    while (true) {
        if (millis() - time >= 1000) {
            messages = loadStrings("http://192.168.0.76/StudyBuddy/?cmd=checkMsg&sessionID=" + sessionID);
            println(messages);
            chatBox.text = messages[0].split(";");
            time = millis();
        }
    }
}
