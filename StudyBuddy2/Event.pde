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
    Event[][] eventData = new Event[eventDataRaw.length][0];
    for (int i = 0; i < eventDataRaw.length; i++) {
        String[] eventRaw = eventDataRaw[i].split("//");
        LocalDate thisEventDate = LocalDate.parse(eventRaw[1]);
        Time thisEventTime = convertFromString(eventRaw[2]);
        Event thisEvent = new Event(eventRaw[0], thisEventDate, thisEventTime);
        eventData[i] = (Event[]) append(eventData[i], thisEvent);
    }
    events = eventData;
}

void loadWeek(){
    for(int i = 0; i < 7; i++){
        week[i] = new DayTile(today.plusDays(i), new Event[]{});
    }
    int index = 0;
    for(int i = 0; i < events.length; i++){
        if(events[i][0].date.equals(today)){
            index = i;
            break;
        }
    }
    LocalDate oneWeekFromToday = today.plusDays(7);
    for(int i = index; i < min(events.length, index + 7); i++){
        if(events[i][0].date.isAfter(oneWeekFromToday)){
            break;
        }
        int daysInBetween = int(today.until(events[i][0].date, ChronoUnit.DAYS));
        week[daysInBetween] = new DayTile(events[i][0].date, events[i]);
    }
}
