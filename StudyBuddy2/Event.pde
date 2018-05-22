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
        return text + date;
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

void loadWeek() {
    weekPanel = new Panel(0, height/4, PADDING + 7 * (WEEK_TILE_WIDTH + PADDING), WEEK_TILE_HEIGHT + 2 * PADDING);
    //Initialize.
    for (int i = 0; i < 7; i++) {
        week[i] = new DayTile(5 + i * (WEEK_TILE_WIDTH + 5), 5, today.plusDays(i), new Event[]{});
        weekPanel.addElement(week[i]);
    }
    //Check if any new events.
    if (events[events.length - 1][0].date.isBefore(today)) {
        //If not, we're done here.
        return;
    }
    //Find today.
    int index = 0;
    for (int i = 0; i < events.length; i++) {
        if (events[i][0].date.equals(today)) {
            index = i;
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
        //println(events[i][0]);
        week[daysInBetween].events = events[i];
    }
}
