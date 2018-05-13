class Event{
    String text;
    LocalDate date;
    Time time;
    Event(String text, LocalDate date, Time time){
        this.text = text;
        this.date = date;
        this.time = time;
    }
}

void loadEvents(){
    String[] eventDataRaw = loadStrings("Events.txt");
    println(eventDataRaw.length);
    Event[][] eventData = new Event[eventDataRaw.length][0];
    for (int i = 0; i < eventDataRaw.length; i++) {
        String[] eventRaw = eventDataRaw[i].split("//");
        LocalDate thisEventDate = LocalDate.parse(eventDataRaw[1]);
        Time thisEventTime = convertFromString(eventRaw[2]);
        Event thisEvent = new Event(eventRaw[0], thisEventDate, thisEventTime);
        eventData[i] = (Event[]) append(eventData[i], thisEvent);
    }
    events = eventData;
}

void loadWeek(){
    int index = 0;
    for(int i = 0; i < events.length; i++){
        if(events[i][0].date.equals(today)){
            index = i;
            break;
        }
    }
    LocalDate oneWeekFromToday = today.plusDays(7);
    for(int i = index; i < index + 7; i++){
        if(events[i][0].date.equals(today)){
            index = i;
            break;
        }
    }
}
