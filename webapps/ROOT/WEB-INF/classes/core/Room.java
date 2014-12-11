package core;


import java.util.ArrayList;
import java.util.List;

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
	
	public int getFeatureEncoding()	{
		return features;
	}

	public String getName() {
		return name;
	}
	
	public List<String> getFeatures() {
		int f = this.features;
		String[] available = {"Laptop A/V", "Round table", "Overhead projector", "Smartboard", "Whiteboard"};
		List<String> result = new ArrayList<String>();
		for(int i = 0 ; i < 5 ; i++){
			if((f & (1<<i)) != 0) {
				result.add(available[i]);
			}
		}
		
		return result;
	}
}
