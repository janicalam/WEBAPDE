package edu.webapde.managers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import edu.webapde.dto.course.Course;
import edu.webapde.dto.db.DBConnection;
import edu.webapde.dto.profile.*;

public class Manager
{
	public Manager()
	{
	}
	
	public ArrayList<Course> getCourseList()
	{
		Connection conn = DBConnection.getConnection();
		ArrayList<Course> courseList = new ArrayList<Course>();
		String sql = "SELECT coursecode, section, B.lname, B.fname FROM webapde_db.courses A, webapde_db.accounts B WHERE A.idprofessor = B.idnum ";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Course c = new Course();
				c.setCourseCode(rs.getString("coursecode"));
				c.setSection(rs.getString("section"));
				c.setProfessorLast(rs.getString("lname"));
				c.setProfessorFirst(rs.getString("fname"));
				courseList.add(c);
			}
		} catch (SQLException e)
		{ // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return courseList;
	}
	
	public ArrayList<Course> getAllCourseStudent(int idnum)
	{
		Connection conn = DBConnection.getConnection();
		ArrayList<Course> courseList = new ArrayList<Course>();
		String sql ="SELECT C.coursecode, C.section, B.lname, B.fname FROM courses C, courseenrolled E, accounts A, accounts B WHERE E.idnum = ? and C.idcourse = E.idcourse and E.idnum = A.idnum and A.type = 'Student' and C.idprofessor = B.idnum";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idnum);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Course c = new Course();
				c.setCourseCode(rs.getString("coursecode"));
				c.setSection(rs.getString("section"));
				c.setProfessorFirst(rs.getString("fname"));
				c.setProfessorLast(rs.getString("lname"));
				courseList.add(c);
			}
		} catch (SQLException e)
		{ // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return courseList;
	}
	
	public void addRequest(Request r)
	{
		String sql = "INSERT INTO consultations(student,professor,date,fromtime,totime,course) "
				+ "VALUES (?,?,?,?,?,?);";
		Connection conn = DBConnection.getConnection();

		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, r.getStudentID());
			ps.setInt(2, r.getProfID());
			ps.setString(3, r.getDate());
			ps.setString(4, r.getFromTime());
			ps.setString(5, r.getToTime());
			ps.setString(6, r.getCourse());
			ps.executeUpdate();
			conn.close();
			ps.close();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<Request> getAllStudentRequest(int idnum)
	{
		Connection conn = DBConnection.getConnection();
		ArrayList<Request> reqList = new ArrayList<Request>();
		String sql ="SELECT * FROM consultations WHERE student =?;";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idnum);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Request r = new Request();
				r.setStudentID(rs.getInt("student"));
				r.setProfID(rs.getInt("professor"));
				r.setDate(rs.getString("date"));
				r.setFromTime(rs.getString("fromtime"));
				r.setToTime(rs.getString("totime"));
				r.setCourse(rs.getString("course"));
				reqList.add(r);
			}
		} catch (SQLException e)
		{ // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reqList;
	}
	
	public Profile getProfile(int idnum, String password)
	{
		String sql = "SELECT * from accounts where idnum=? and password=?";
		Profile p = null;
		try
		{
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idnum);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
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
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}

	

	public void addAccount(Profile p)
	{
		String sqlacct = "INSERT INTO accounts (idnum,password,type,email,lname,fname) "
				+ "VALUES (?,?,?,?,?,?);";
		Connection conn = DBConnection.getConnection();

		try
		{
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
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void changePassword(int idnum,String pw,String newPw)
	{
		String sql="UPDATE accounts SET password=?, WHERE idnum=? and password =?;";
		Connection conn = DBConnection.getConnection();

		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idnum);
			ps.setString(2, pw);
			ps.executeUpdate();
			conn.close();
			ps.close();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
