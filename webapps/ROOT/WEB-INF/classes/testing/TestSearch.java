package testing;

import static org.junit.Assert.*;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;

import core.Room;
import utils.Search;

public class TestSearch {

	private static List<Room> l0, l1, l2, l3, l4, l5;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Timestamp start = new Timestamp(2014,10,19,7,0,0,0);
		Timestamp end = new Timestamp(2014,10,19,14,0,0,0);
		/*
		 * We can't test for searching rooms with existing bookings because
		 * that would mean altering the database
		 */
		l0 = Search.search(start, end, 0, 31);
		l1 = Search.search(start, end, 0, 11);
	}

	@Test
	public void testL0() {
		assertTrue(l0.size() == 1);
		assertTrue(l0.get(0).getCapacity() == 34);
		assertTrue(l0.get(0).getFeatureEncoding() == 31);
	}
	
	@Test
	public void testL1() {
		assertTrue(l1.size() == 4);
		assertTrue(l1.get(2).getCapacity() == 8);
		assertTrue(l1.get(2).getFeatureEncoding() == 11);
	}

	
	@Test
	public void testL2() {
		assertTrue(l1.size() == 4);
		assertTrue(l1.get(0).getCapacity() == 34);
		assertTrue(l1.get(0).getFeatureEncoding() == 31);
	}
	


}
