Event[][] events = new Event[1][0];
DayTile[] week = new DayTile[7];

Object[] remove(Object[] array, int index){
    Object[] before = (Object[]) subset(array, 0, index);
    Object[] after = (Object[]) subset(array, index + 1);
    return (Object[]) concat(before, after);
}
