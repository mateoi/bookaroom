package testing;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;

import core.Room;

public class TestRoom {

	private static Room r0, r23, r17, r31, r6, r10, r164;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		int room_id = 0;
		String name = "name";
		String location = "location";
		int capacity = 1235;
		
		r0 = new Room(room_id, name, location, capacity, 0);
		r23 = new Room(room_id, name, location, capacity, 0b10111);
		r17 = new Room(room_id, name, location, capacity, 0b10001);
		r31 = new Room(room_id, name, location, capacity, 0b11111);
		r6 = new Room(room_id, name, location, capacity, 0b110);
		r10 = new Room(room_id, name, location, capacity, 0b1010);
	}

	@Test
	public void testGetFeatureEncoding() {
		assertTrue(r0.getFeatureEncoding() == 0);
		assertTrue(r23.getFeatureEncoding() == 23);
	}

	@Test
	public void testGetFeatures() {
		assertTrue(r0.getFeatures().isEmpty());
		assertTrue(r23.getFeatures().size() == 4);
		assertTrue(r17.getFeatures().get(1).equals("Whiteboard"));
		assertTrue(r31.getFeatures().get(4).equals("Whiteboard"));
		assertTrue(r6.getFeatures().get(0).equals("Round table"));
		assertTrue(r10.getFeatures().get(1).equals("Smartboard"));
	}

}
