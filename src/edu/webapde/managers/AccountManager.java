package edu.webapde.managers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import edu.webapde.dto.db.DBConnection;
import edu.webapde.dto.profile.*;

public class AccountManager {
	public AccountManager() {
	}

	public Profile getProfile(int idnum, String password) {
		String sql = "SELECT * from accounts where idnum=? and password=?";
		Profile p = null;
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idnum);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new Profile();
				p.setIdNo(rs.getInt("idnum"));
				p.setPassword(rs.getString("password"));
				p.setType(rs.getString("type"));
				p.setEmail(rs.getString("email"));
				p.setLastName(rs.getString("lname"));
				p.setFirstName(rs.getString("fname"));
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}

	/*
	  public ArrayList<Pizza> getAllPizzas(){ Connection conn =
	  DBConnection.getConnection(); ArrayList<Pizza> pizzaList = new
	  ArrayList<Pizza>(); try { PreparedStatement pstmt =
	  conn.prepareStatement("SELECT * FROM PIZZA"); ResultSet rs =
	  pstmt.executeQuery(); while(rs.next()){ Pizza pizza =new Pizza();
	  pizza.setId(rs.getInt("idpizza"));
	  pizza.setDiameter(rs.getInt("diameter"));
	  pizza.setHasCheese(rs.getBoolean("hasCheese"));
	  pizza.setHasBacon(rs.getBoolean("hasBacon"));
	  pizza.setCrustThickness(rs.getInt("crustThickness"));
	  pizza.setSauce(rs.getString(Pizza.COLUMN_SAUCE));
	  pizza.setRestaurant(rs.getString("restaurant")); pizzaList.add(pizza); }
	  } catch (SQLException e) { // TODO Auto-generated catch block
	  e.printStackTrace(); } return pizzaList;
	  
	  }
	  
	  public void addPizza(Pizza p){ String sql =
	  "INSERT INTO PIZZA (diameter, hasCheese, " +
	  "hasBacon, sauce, crustThickness, restaurant) " +
	  "VALUES (?,?,?,?,?,?);"; Connection conn = DBConnection.getConnection();
	  
	  try { PreparedStatement pstmt = conn.prepareStatement(sql);
	  pstmt.setInt(1, p.getDiameter()); pstmt.setBoolean(2, p.isHasCheese());
	  pstmt.setBoolean(3, p.isHasBacon()); pstmt.setString(4, p.getSauce());
	  pstmt.setInt(5, p.getCrustThickness()); pstmt.setString(6,
	  p.getRestaurant()); pstmt.executeUpdate(); conn.close(); pstmt.close(); }
	  catch (SQLException e) { // TODO Auto-generated catch block
	  e.printStackTrace(); }
	  
	  }
	 */

	public void addAccount(Profile p) {
		String sqlacct = "INSERT INTO accounts (idnum,password,type,email,lname,fname) "
				+ "VALUES (?,?,?,?,?,?);";
		Connection conn = DBConnection.getConnection();

		try {
			PreparedStatement ps = conn.prepareStatement(sqlacct);
			ps.setInt(1, p.getIdNo());
			ps.setString(2, p.getPassword());
			ps.setString(3, p.getType());
			ps.setString(4, p.getEmail());
			ps.setString(5, p.getLastName());
			ps.setString(6, p.getFirstName());
			ps.executeUpdate();
			conn.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
