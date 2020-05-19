package service;

import java.util.List;

import entity.Item;

public interface ItemsDAO {

	public List<Item> queryAllitems();
	
	public Item queryItemByName(String name);
	
	public Item queryItemById(String id);
	
	public boolean insertItem(Item i);
	
	public boolean updateItem(Item i);
	
	public boolean deleteItemById(String id);
}
