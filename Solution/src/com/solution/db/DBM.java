package com.solution.db;

import java.util.List;

import com.solution.bean.Client;
import com.solution.bean.Item;
import com.solution.bean.Log;
import com.solution.bean.Shopper;

public interface DBM {
	public boolean insertClient(Client c);
	public boolean updateClient(Client c);
	public Client getClient(String username);
	public List<Client> getAllClient();
	public boolean insertShopper(Shopper s);
	public boolean updateShopper(Shopper s);
	public Shopper getShopper(String username);
	public List<Shopper> getAllShopper();
	public boolean addItem(Item item);
	public boolean updateItem(Item item);
	public Item getItem(String itemname);
	public List<Item> getUserItems(String username);
	public List<String> getCategory();
	public List<String> getAllCategory();
	public List<Item> getAllItemsFromCategory(String category);
	public List<Item> doSearch(String dname);
	public boolean insertLog(Item item,Client client,int bquantity);
	public List<Log> shopperLog(String username);
	public List<Log> customerLog(String username);
}
