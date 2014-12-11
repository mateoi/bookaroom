package core;

/**
 * Created by Jack on 10/12/14.
 */
public class Booking {
    Room room;
    String start;
    String end;

    public Booking(Room aRoom, String aStart, String anEnd) {
        this.room = aRoom;
        this.start = aStart;
        this.end = anEnd;
    }

    public Room getRoom() {
        return room;
    }

    public String getStart() {
        return start;
    }

    public String getEnd() {
        return end;
    }
}
