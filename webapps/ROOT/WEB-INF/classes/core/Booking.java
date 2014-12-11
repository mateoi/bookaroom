package core;

/**
 * Created by Jack on 10/12/14.
 */
public class Booking {
    int id;
    Room room;
    String start;
    String end;

    public Booking(int anId, Room aRoom, String aStart, String anEnd) {
        this.id = anId;
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

    public int getId() {  return id;  }
}
