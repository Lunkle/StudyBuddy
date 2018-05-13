void getUsername() {
    String[] lines = loadStrings("Name.txt");
    for (int i = 0; i < lines.length; i++) {
        println(lines[i]);
    }
}

void getAppointment() {
    String[] lines = loadStrings("Events.txt");
    for (int i = 0; i < lines.length; i++) {
        println(lines[i]);
    }
}
