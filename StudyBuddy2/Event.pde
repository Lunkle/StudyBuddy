import java.time.YearMonth;

class Event {
    String text;
    LocalDate date;
    Time time;
    Event(String text, LocalDate date, Time time) {
        this.text = text;
        this.date = date;
        this.time = time;
    }

    String toString() {
        return text;
    }
    
    String toStringForSave(){
        return "";
    }
}

void loadEvents() {
    String[] eventDataRaw = loadStrings("Events.txt");
    Event[][] eventData = {};
    int index = 0;
    LocalDate lastDate = null;
    for (int i = 0; i < eventDataRaw.length; i++) {
        String[] eventRaw = eventDataRaw[i].split("//");
        LocalDate thisEventDate = LocalDate.parse(eventRaw[1]);
        Time thisEventTime = convertFromString(eventRaw[2]);
        Event thisEvent = new Event(eventRaw[0], thisEventDate, thisEventTime);
        try {
            if (thisEventDate.isAfter(lastDate)) {
                index += 1;
                eventData = (Event[][]) append(eventData, new Event[][]{});
                lastDate = thisEventDate;
            }
        }
        catch(Exception e) {
            eventData = (Event[][]) append(eventData, new Event[]{});
            lastDate = thisEventDate;
        }
        eventData[index] = (Event[]) append(eventData[index], thisEvent);
    }
    events = eventData;
}

Event[] getEventsForDay(LocalDate date) {
    for (int i = 0; i < events.length; i++) {
        if (events[i][0].date.isAfter(date)) {
            return new Event[]{};
        }else if(events[i][0].date.equals(date)){
            return events[i];
        }
    }
    return new Event[]{};
}

void loadMonth() {
    month = new DayTile[today.lengthOfMonth()];
    for (int i = 0; i < 7; i++) {
        Label label = new Label(daysOfWeek[i], PADDING + i * (PADDING + MONTH_TILE_WIDTH), PADDING, MONTH_TILE_WIDTH, 30);
        calendarPanel.addComponent(label);
    }
    int firstDayOfMonth = (today.withDayOfMonth(1).getDayOfWeek().getValue() - 1)%7;
    YearMonth month = YearMonth.from(today);
    for (int i = 0; i < 5; i++) {
        for (int j = i>0?0:(firstDayOfMonth + 1); j < (i<5?7:7); j++) {
            LocalDate date = today.withDayOfMonth(i * 7 + j - firstDayOfMonth);
            DayTile tile = new DayTile(PADDING + j * (MONTH_TILE_WIDTH + PADDING), 2 * PADDING + 30 + i * (MONTH_TILE_HEIGHT + PADDING), MONTH_TILE_WIDTH, MONTH_TILE_HEIGHT, date, getEventsForDay(date));
            calendarPanel.addComponent(tile);
        }
    }
}

void loadWeek() {
    //Initialize.
    for (int i = 0; i < 7; i++) {
        week[i] = new DayTile(PADDING, 26 + 2 * PADDING + i * (WEEK_TILE_HEIGHT + PADDING), WEEK_TILE_WIDTH, WEEK_TILE_HEIGHT, today.plusDays(i), new Event[]{}, weekPanel);
    }
    //Check if any new events.
    if (events[events.length - 1][0].date.isBefore(today)) {
        //If not, we're done here.
        return;
    }
    //Otherwise, find today.
    int index = 0;
    for (int i = 0; i < events.length; i++) {
        if (events[i][0].date.isAfter(today)) {
            index = i - 1;
            break;
        }
    }
    //Calculate day one week from now.
    LocalDate oneWeekFromToday = today.plusDays(7);
    for (int i = index; i < min(events.length, index + 7); i++) {
        if (events[i][0].date.isAfter(oneWeekFromToday)) {
            return;
        }
        int daysInBetween = int(today.until(events[i][0].date, ChronoUnit.DAYS));
        week[daysInBetween].updateEvents(events[i]);
    }
}
