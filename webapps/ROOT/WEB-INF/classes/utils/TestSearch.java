package utils;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;

import core.Room;

public class TestSearch {

	private static List<Room> l0, l1, l2, l3, l4, l5;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Date start = new Date(0);
		Date end = new Date(3600000);
		/*
		 * We can't test for searching rooms with existing bookings because
		 * that would mean altering the database
		 */
		l0 = Search.search(start, end, 0, 0);
		l1 = Search.search(start, end, 100, 13);
		l2 = Search.search(start, end, 105, 13);
		l3 = Search.search(start, end, 8, 0);
		l4 = Search.search(start, end, 8, 20);
		l5 = Search.search(start, end, 8, 1);
		
		
	}

	@Test
	public void testL0() {
		assertTrue(l0.size() == 10);
		assertTrue(l0.get(0).getCapacity() == 34);
		assertTrue(l0.get(7).getFeatureEncoding() == 27);
	}
	
	@Test
	public void testL1() {
		assertTrue(l0.size() == 1);
		assertTrue(l0.get(0).getCapacity() == 104);
		assertTrue(l0.get(0).getFeatureEncoding() == 13);
	}
	
	@Test
	public void testL2() {
		assertTrue(l0.size() == 0);
	}
	
	@Test
	public void testL3() {
		assertTrue(l0.size() == 5);
		assertTrue(l0.get(0).getCapacity() == 8);
		assertTrue(l0.get(4).getFeatureEncoding() == 28);
	}
	
	@Test
	public void testL4() {
		assertTrue(l0.size() == 2);
		assertTrue(l0.get(0).getCapacity() == 16);
		assertTrue(l0.get(1).getFeatureEncoding() == 28);
	}
	
	@Test
	public void testL5() {
		assertTrue(l0.size() == 3);
		assertTrue(l0.get(0).getCapacity() == 8);
		assertTrue(l0.get(2).getFeatureEncoding() == 7);
	}

}
