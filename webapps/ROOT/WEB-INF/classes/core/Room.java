package core;

import utils.DBAdapter;

public class Room {
	
	private String name;
	private String streetAddress;
	private String floor; // accounting for strange floor names such as Floor G
	private String roomNumber; // again: strange room numbers e.g. Room 16A
	private int capacity;
	private String[] features;
	public final DBAdapter database;
	
	public Room(String name,
				String streetAddress,
				String floor, 
				String roomNumber, 
				int capacity, 
				DBAdapter database,
				String... features) 
	{
		this.name = name;
		this.streetAddress = streetAddress;
		this.floor = floor;
		this.roomNumber = roomNumber;
		this.capacity = capacity;
		this.features = features;
		this.database = database;
	}
	
	public String[] getLocation()	{
		String[] location = {name, streetAddress, floor, roomNumber};
		return location;
	}

	public int getCapacity() {
		return capacity;
	}	
	
	public String[] getFeatures()	{
		return features;
	}
	
	
	
}
