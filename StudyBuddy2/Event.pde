class Event{
    Event(String text, Date date, Time time){
        
    }
}

Date getDate(int year, int month, int date){
    c.set(year, month, date);
    return c.getTime();
}

void loadEvents(){
    String[] eventDataRaw = loadStrings("Events.txt");
    Event[][] eventData = new Event[eventDataRaw.length][];
    for (int i = 0; i < eventDataRaw.length; i++) {
        String[] eventRaw = eventDataRaw[i].split("//");
        String[] dateDataRaw = eventRaw[1].split("/");
        Date thisEventDate = getDate(int(dateDataRaw[2]), int(dateDataRaw[0]), int(dateDataRaw[1]));
        Time thisEventTime = convertFromString(eventRaw[2]);
        eventData[i] = (Event[]) append(eventData[i], new Event(eventRaw[0], thisEventDate, thisEventTime));
    }
    events = eventData;
}
