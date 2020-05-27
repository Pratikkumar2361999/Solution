package com.solution.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.solution.bean.Client;
import com.solution.bean.Item;
import com.solution.bean.Log;
import com.solution.bean.Shopper;
import com.solution.connection.ConnectionProvider;

public class DBMImp implements DBM {

	public boolean insertClient(Client c) {
		boolean b=false;
		Connection con=ConnectionProvider.getConnection();
		try {
			
			String q="insert into client(username,name,pno,pass) values(?,?,?,?);";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, c.getUsername());
			ps.setString(2,c.getName());
			ps.setString(3, c.getPno());
			ps.setString(4, c.getPassword());
			int i=ps.executeUpdate();
			if(i>0)
			{
				b=true;
			}
			con.close();
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
		
		
		return b;
	}

	public boolean updateClient(Client c) {
		boolean b=false;
		Connection con=ConnectionProvider.getConnection();
		try {
			String q="update client set name=?, pno=?, pass=? where username=?";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, c.getName());
			ps.setString(2, c.getPno());
			ps.setString(3, c.getPassword());
			ps.setString(4, c.getUsername());
			int i=ps.executeUpdate();
			if(i>0) {
				b=true;
			}
			con.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return b;
	}

	public Client getClient(String username) {
		Client c=null;
		Connection con=ConnectionProvider.getConnection();
		try {
			String q="select * from client where username=?";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, username);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
			c=new Client();
			c.setCid(rs.getInt(1));
			c.setUsername(rs.getString(2));
			c.setName(rs.getString(3));
			c.setPno(rs.getString(4));
			c.setPassword(rs.getString(5));
			}
			con.close();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		return c;
	}

	public List<Client> getAllClient() {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean insertShopper(Shopper s) {
		boolean b=false;
		Connection con=ConnectionProvider.getConnection();
		try {
			
			String q=" insert into shopper(username,name,pno,address,city,state,country,pass) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, s.getUsername());
			ps.setString(2,s.getName());
			ps.setString(3, s.getPno());
			ps.setString(4, s.getAddress());
			ps.setString(5, s.getCity());
			ps.setString(6, s.getState());
			ps.setString(7, s.getCountry());
			ps.setString(8, s.getPassword());
			
			int i=ps.executeUpdate();
			if(i>0)
			{
				b=true;
			}
			con.close();
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
		
		
		return b;
	}

	public boolean updateShopper(Shopper s) {
		boolean b=false;
		Connection con=ConnectionProvider.getConnection();
		try {
			String q="update shopper set name=?, pno=?, address=?, city=?, state=?, country=?, pass=? where username=?";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, s.getName());
			ps.setString(2, s.getPno());
			ps.setString(3, s.getAddress());
			ps.setString(4, s.getCity());
			ps.setString(5, s.getState());
			ps.setString(6, s.getCountry());
			ps.setString(7, s.getPassword());
			ps.setString(8, s.getUsername());
			int i=ps.executeUpdate();
			if(i>0) {
				b=true;
			}
			con.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return b;
	}

	public Shopper getShopper(String username) {
		Shopper s=null;
		Connection con=ConnectionProvider.getConnection();
		try {
			String q="select * from shopper where username=?";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, username);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
			s=new Shopper();
			s.setSid(rs.getInt(1));
			s.setUsername(rs.getString(2));
			s.setName(rs.getString(3));
			s.setPno(rs.getString(4));
			s.setAddress(rs.getString(5));
			s.setCity(rs.getString(6));
			s.setCountry(rs.getString(7));
			s.setState(rs.getString(8));
			s.setPassword(rs.getString(9));
			}
			con.close();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		return s;
	}

	public List<Shopper> getAllShopper() {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean addItem(Item item) {
		boolean b=false;
		Connection con=ConnectionProvider.getConnection();
		try {
			
			String q="insert into items(itemname,category,username,dname,oneunitsize,quantity,unit,price) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, item.getItemname());
			ps.setString(2,item.getCategory());
			ps.setString(3, item.getUsername());
			ps.setString(4, item.getDname());
			ps.setInt(5, item.getOneunitsize());
			ps.setInt(6, item.getQuantity());
			ps.setString(7, item.getUnit());
			ps.setInt(8, item.getPrice());
			int i=ps.executeUpdate();
			if(i>0)
			{
				b=true;
			}
			con.close();
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
		
		
		return b;
	}

	public boolean updateItem(Item item) {
		boolean b=false;
		Connection con=ConnectionProvider.getConnection();
		try {
			String q="update items set  category=?, username=?, dname=?, oneunitsize=?, quantity=?, unit=?, itemname=?, price=?  where iid=?";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1,item.getCategory());
			ps.setString(2, item.getUsername());
			ps.setString(3, item.getDname());
			ps.setInt(4, item.getOneunitsize());
			ps.setInt(5, item.getQuantity());
			ps.setString(6, item.getUnit());
			ps.setString(7, item.getItemname());
			ps.setInt(8, item.getPrice());
			ps.setInt(9, item.getIid());
			int i=ps.executeUpdate();
			if(i>0) {
				b=true;
			}
			con.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return b;
	}

	public Item getItem(String itemname) {
		Item item=new Item();
		Connection con=ConnectionProvider.getConnection();
		try {
			String q="select * from items where itemname=?";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, itemname);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				item.setIid(rs.getInt(1));
				item.setItemname(rs.getString(2));
				item.setCategory(rs.getString(3));
				item.setUsername(rs.getString(4));
				item.setDname(rs.getString(5));
				item.setOneunitsize(rs.getInt(6));
				item.setQuantity(rs.getInt(7));
				item.setUnit(rs.getString(8));
				item.setPrice(rs.getInt(9));
	
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return item;
	}

	public List<Item> getUserItems(String username) {
		List<Item> l=new ArrayList<Item>();
		Connection con=ConnectionProvider.getConnection();
		try {
			String q="select * from items where username=?";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, username);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Item item = new Item();
				item.setIid(rs.getInt(1));
				item.setItemname(rs.getString(2));
				item.setCategory(rs.getString(3));
				item.setUsername(rs.getString(4));
				item.setDname(rs.getString(5));
				item.setOneunitsize(rs.getInt(6));
				item.setQuantity(rs.getInt(7));
				item.setUnit(rs.getString(8));
				item.setPrice(rs.getInt(9));
				
				l.add(item);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return l;
	}

	public List<String> getCategory() {
		List<String> l=new ArrayList<String>();
		Connection con=ConnectionProvider.getConnection();
		try {
			String q="select distinct category from items";
			PreparedStatement ps=con.prepareStatement(q);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				String category =new String(rs.getString(1));
				l.add(category);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return l;
	}
	
	public List<String> getAllCategory() {
		List<String> l=new ArrayList<String>();
		Connection con=ConnectionProvider.getConnection();
		try {
			String q="select cname from category";
			PreparedStatement ps=con.prepareStatement(q);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				String category =new String(rs.getString(1));
				l.add(category);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return l;
	}

	public List<Item> getAllItemsFromCategory(String category) {
		List<Item> l=new ArrayList<Item>();
		Connection con=ConnectionProvider.getConnection();
		try {
			String q="select * from items where category=?";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, category);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Item item = new Item();
				item.setIid(rs.getInt(1));
				item.setItemname(rs.getString(2));
				item.setCategory(rs.getString(3));
				item.setUsername(rs.getString(4));
				item.setDname(rs.getString(5));
				item.setOneunitsize(rs.getInt(6));
				item.setQuantity(rs.getInt(7));
				item.setUnit(rs.getString(8));
				item.setPrice(rs.getInt(9));
				
				l.add(item);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return l;
	}

	public List<Item> doSearch(String dname) {
		List<Item> l=new ArrayList<Item>();
		Connection con=ConnectionProvider.getConnection();
		try {
			String q="select * from items where dname like ?";
			PreparedStatement ps=con.prepareStatement(q);
			dname="%"+dname+"%";
			ps.setString(1, dname);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Item item = new Item();
				item.setIid(rs.getInt(1));
				item.setItemname(rs.getString(2));
				item.setCategory(rs.getString(3));
				item.setUsername(rs.getString(4));
				item.setDname(rs.getString(5));
				item.setOneunitsize(rs.getInt(6));
				item.setQuantity(rs.getInt(7));
				item.setUnit(rs.getString(8));
				item.setPrice(rs.getInt(9));
				
				l.add(item);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return l;
	}

	public boolean insertLog(Item item, Client client, int bquantity) {
		boolean b=false;
		Connection con=ConnectionProvider.getConnection();
		try {
			String q="insert into log(itemname,bquantity,rquantity,oneunitsize,susername,cusername,price,dname) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1,item.getItemname());
			ps.setInt(2, bquantity);
			ps.setInt(3, item.getQuantity());
			ps.setInt(4, item.getOneunitsize());
			ps.setString(5, item.getUsername());
			ps.setString(6, client.getUsername());
			ps.setInt(7, item.getPrice());
			ps.setString(8, item.getDname());
			int i=ps.executeUpdate();
			if(i>0) {
				b=true;
			}
			con.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return b;
	}

	public List<Log> shopperLog(String username) {
		List<Log> l=new ArrayList<Log>();
		Connection con=ConnectionProvider.getConnection();
		try {
			String q="select * from log where susername=?";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, username);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				
				Log log = new Log();
				log.setLid(rs.getInt(1));
				log.setItemname(rs.getString(2));
				log.setBquantity(rs.getInt(3));
				log.setRquantity(rs.getInt(4));
				log.setOneunitsize(rs.getInt(5));
				log.setSusername(rs.getString(6));
				log.setCusername(rs.getString(7));
				log.setPrice(rs.getInt(8));
				log.setBoughtat(rs.getTimestamp(9));
				log.setDname(rs.getString(10));
				l.add(log);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return l;
	}

	public List<Log> customerLog(String username) {
		List<Log> l=new ArrayList<Log>();
		Connection con=ConnectionProvider.getConnection();
		try {
			String q="select * from log where cusername=?";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, username);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				
				Log log = new Log();
				log.setLid(rs.getInt(1));
				log.setItemname(rs.getString(2));
				log.setBquantity(rs.getInt(3));
				log.setRquantity(rs.getInt(4));
				log.setOneunitsize(rs.getInt(5));
				log.setSusername(rs.getString(6));
				log.setCusername(rs.getString(7));
				log.setPrice(rs.getInt(8));
				log.setBoughtat(rs.getTimestamp(9));
				log.setDname(rs.getString(10));
				l.add(log);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return l;
	}

	



}
