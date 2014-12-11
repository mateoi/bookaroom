package core;


import java.util.ArrayList;
import java.util.List;

import utils.DBAdapter;

public class Room {

    private int id;
	private String name;
	private String location;
	private int capacity;
	private int features;
	
	public Room(int id, String name,
				String location,
				int capacity, 
				int features) 
	{
		this.id = id;
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

    public int getId() {
        return id;
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
