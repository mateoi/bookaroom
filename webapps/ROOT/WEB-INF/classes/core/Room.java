package core;

import utils.DBAdapter;

public class Room {
	
	private String name;
	private String location;
	private int capacity;
	private int features;
	
	public Room(String name,
				String location,
				int capacity, 
				int features) 
	{
		this.name = name;
		this.location = location;
		this.capacity = capacity;
		this.features = features;
	}
	
	public String getLocation()	{
		return location;
	}

	public int getCapacity() {
		return capacity;
	}	
	
	public int getFeatures()	{
		return features;
	}

	public String getName() {
		return name;
	}	
}
