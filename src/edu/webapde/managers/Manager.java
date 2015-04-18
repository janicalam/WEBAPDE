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

	public void changePassword(int idnum, String newPw)
	{
		String sql = "UPDATE accounts SET password=? WHERE idnum=?";
		Connection conn = DBConnection.getConnection();

		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPw);
			ps.setInt(2, idnum);
			ps.executeUpdate();
			ps.close();
			conn.close();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<String> getAllCourseCodes()
	{
		Connection conn = DBConnection.getConnection();
		ArrayList<String> courseCode = new ArrayList<String>();
		String sql = "SELECT coursecode FROM courses GROUP BY coursecode ORDER BY coursecode;";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				String s = (rs.getString("coursecode"));
				courseCode.add(s);
			}
		} catch (SQLException e)
		{ // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return courseCode;
	}
	
	public ArrayList<String> getAllSections()
	{
		Connection conn = DBConnection.getConnection();
		ArrayList<String> sections = new ArrayList<String>();
		String sql = "SELECT section FROM courses GROUP BY section ORDER BY section;";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				String s = (rs.getString("section"));
				sections.add(s);
			}
		} catch (SQLException e)
		{ // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sections;
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
	
	public ArrayList<Course> getCourseList(String course, String section)
	{
		Connection conn = DBConnection.getConnection();
		ArrayList<Course> courseList = new ArrayList<Course>();
		if(course.equalsIgnoreCase("all") && section.equalsIgnoreCase("all"))
		{
			courseList = getCourseList();
		} 
		else if(section.equalsIgnoreCase("all"))
		{
			courseList = getCourseListByCourse(course);
			
		}
		else if (course.equalsIgnoreCase("all"))
		{
			courseList = getCourseListBySection(section);
		}
		else
		{
			String sql = "SELECT coursecode, section, B.lname, B.fname FROM webapde_db.courses C, webapde_db.accounts B WHERE C.idprofessor = B.idnum and coursecode=? and section=?";
			try
			{
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, course);
				ps.setString(2, section);
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
		}
		return courseList;
	}
	
	public ArrayList<Course> getCourseListByCourse(String course)
	{
		Connection conn = DBConnection.getConnection();
		ArrayList<Course> courseList = new ArrayList<Course>();
		String sql = "SELECT coursecode, section, B.lname, B.fname FROM webapde_db.courses A, webapde_db.accounts B WHERE A.idprofessor = B.idnum  and coursecode=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, course);
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
	
	public ArrayList<Course> getCourseListBySection(String section)
	{
		Connection conn = DBConnection.getConnection();
		ArrayList<Course> courseList = new ArrayList<Course>();
		String sql = "SELECT coursecode, section, B.lname, B.fname FROM webapde_db.courses A, webapde_db.accounts B WHERE A.idprofessor = B.idnum and section=?";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, section);
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

	public ArrayList<Course> getAllStudentCourses(int idnum)//get all coursesenrolled by a student
	{
		Connection conn = DBConnection.getConnection();
		ArrayList<Course> courseList = new ArrayList<Course>();
		String sql = "SELECT C.coursecode, C.section, B.lname, B.fname FROM courses C, courseenrolled E, accounts A, accounts B WHERE E.idnum = ? and C.idcourse = E.idcourse and E.idnum = A.idnum and A.type = 'Student' and C.idprofessor = B.idnum";
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

	public ArrayList<Course> getAllProfessorCourses(int idnum)
	{
		Connection conn = DBConnection.getConnection();
		ArrayList<Course> courseList = new ArrayList<Course>();
		String sql = "SELECT coursecode, section, date, fromtime, totime FROM courses WHERE idprofessor = ?";
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
				c.setDay(rs.getString("date"));
				c.setStartTime(rs.getString("fromtime"));
				c.setEndTime(rs.getString("totime"));
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
		String sql = "INSERT INTO consultations(student,professor,date,fromtime,totime,course,status) "
				+ "VALUES (?,?,?,?,?,?);";
		Connection conn = DBConnection.getConnection();

		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, r.getStudentID());
			ps.setInt(2, r.getProfId());
			ps.setString(3, r.getDate());
			ps.setString(4, r.getFromTime());
			ps.setString(5, r.getToTime());
			ps.setString(6, r.getCourse());
			ps.setInt(7, 0);
			ps.executeUpdate();
			conn.close();
			ps.close();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Request> getAllStudentRequest(int idnum, String prof, String course,String status)
	{
		Connection conn = DBConnection.getConnection();
		ArrayList<Request> reqList = new ArrayList<Request>();
		String sql="";
		String name[]= new String[2];
		if(prof.equalsIgnoreCase("All") && course.equalsIgnoreCase("All") && status.equalsIgnoreCase("All"))
			sql ="SELECT C.student,C.date,C.fromtime,C.totime,C.course,C.status, A.lname,A.fname FROM consultations C, accounts A where C.professor = A.idnum  and student = ?;";
		else if(prof.equalsIgnoreCase("All") && course.equalsIgnoreCase("All")) //search by status
			sql ="SELECT C.student,C.date,C.fromtime,C.totime,C.course,C.status, A.lname,A.fname FROM consultations C, accounts A where C.professor = A.idnum  and student = ? and C.status =?;";
		else if(course.equalsIgnoreCase("All") && status.equalsIgnoreCase("All"))//search by prof
		{
			name=prof.split(", ");
			sql ="SELECT C.student,C.date,C.fromtime,C.totime,C.course,C.status, A.lname,A.fname FROM consultations C, accounts A, accounts B where C.professor = A.idnum  and student = ? and B.lname =? and B.fname =? and C.professor = B.idnum;";
		}
		else if(prof.equalsIgnoreCase("All") && status.equalsIgnoreCase("All"))//search by course
			sql ="SELECT C.student,C.date,C.fromtime,C.totime,C.course,C.status, A.lname,A.fname FROM consultations C, accounts A where C.professor = A.idnum  and student = ? and C.course = ?;";
		else if(prof.equalsIgnoreCase("All"))//search by course and status
			sql ="SELECT C.student,C.date,C.fromtime,C.totime,C.course,C.status, A.lname,A.fname FROM consultations C, accounts A where C.professor = A.idnum  and student = ? and C.status =? and C.course = ?;";
		else if(status.equalsIgnoreCase("All"))//search by prof and course
		{
			name=prof.split(", ");
			sql ="SELECT C.student,C.date,C.fromtime,C.totime,C.course,C.status, A.lname,A.fname FROM consultations C, accounts A, accounts B where C.professor = A.idnum  and student = ? and B.lname =? and B.fname =? and C.professor = B.idnum and C.course = ?;";
		}
		else if(course.equalsIgnoreCase("All"))//search by prof and status
			sql ="SELECT C.student,C.date,C.fromtime,C.totime,C.course,C.status, A.lname,A.fname FROM consultations C, accounts A, accounts B where C.professor = A.idnum  and student = ? and B.lname =? and B.fname =? and C.professor = B.idnum and C.status = ?;";
		else//search by prof,course and status
			sql ="SELECT C.student,C.date,C.fromtime,C.totime,C.course,C.status, A.lname,A.fname FROM consultations C, accounts A, accounts B where C.professor = A.idnum  and student = ? and B.lname =? and B.fname =? and C.professor = B.idnum and C.status = ? and C.course =?;";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idnum);
			if(prof.equalsIgnoreCase("All") && course.equalsIgnoreCase("All") && status.equalsIgnoreCase("All"))
				ps.setInt(1, idnum);
			else if(prof.equalsIgnoreCase("All") && course.equalsIgnoreCase("All"))
				ps.setString(2, status);
			else if(course.equalsIgnoreCase("All") && status.equalsIgnoreCase("All"))
			{
				ps.setString(2, name[0]);
				ps.setString(3, name[1]);
			}
			else if(prof.equalsIgnoreCase("All") && status.equalsIgnoreCase("All"))
			{
				ps.setString(2, course);
			}
			else if(prof.equalsIgnoreCase("All"))
			{
				ps.setString(2, status);
				ps.setString(3, course);
			}
			else if(status.equalsIgnoreCase("All"))
			{
				ps.setString(2, name[0]);
				ps.setString(3, name[1]);
				ps.setString(4, course);
			}
			else if(course.equalsIgnoreCase("All"))
			{
				ps.setString(2, name[0]);
				ps.setString(3, name[1]);
				ps.setString(4, status);
			}
			else
			{
				ps.setString(2, name[0]);
				ps.setString(3, name[1]);
				ps.setString(4, status);
				ps.setString(5, course);
			}
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Request r = new Request();
				r.setStudentID(rs.getInt("student"));
				r.setDate(rs.getString("date"));
				r.setFromTime(rs.getString("fromtime"));
				r.setToTime(rs.getString("totime"));
				r.setCourse(rs.getString("course"));
				r.setStatus(rs.getString("status"));
				r.setLastName(rs.getString("lname"));
				r.setFirstName(rs.getString("fname"));
				reqList.add(r);
			}
		} catch (SQLException e)
		{ // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reqList;
	}
	
	public ArrayList<Request> getAllProfRequest(int idnum,String student, String course,String status)
	{
		Connection conn = DBConnection.getConnection();
		ArrayList<Request> reqList = new ArrayList<Request>();
		String sql="";
		String name[]= new String[2];
		if(student.equalsIgnoreCase("All") && course.equalsIgnoreCase("All") && status.equalsIgnoreCase("All"))
			sql ="SELECT C.student,C.date,C.fromtime,C.totime,C.course,C.status, A.lname,A.fname FROM consultations C, accounts A where C.student = A.idnum  and professor = ?;";
		else if(student.equalsIgnoreCase("All") && course.equalsIgnoreCase("All")) //search by status
			sql ="SELECT C.student,C.date,C.fromtime,C.totime,C.course,C.status, A.lname,A.fname FROM consultations C, accounts A where C.student = A.idnum  and professor = ? and C.status =?;";
		else if(course.equalsIgnoreCase("All") && status.equalsIgnoreCase("All"))//search by student
		{
			name=student.split(", ");
			sql ="SELECT C.student,C.date,C.fromtime,C.totime,C.course,C.status, A.lname,A.fname FROM consultations C, accounts A, accounts B where where C.student = A.idnum  and professor = ? and B.lname =? and B.fname =? and C.student = B.idnum;";
		}
		else if(student.equalsIgnoreCase("All") && status.equalsIgnoreCase("All"))//search by course
			sql ="SELECT C.student,C.date,C.fromtime,C.totime,C.course,C.status, A.lname,A.fname FROM consultations C, accounts A where C.student = A.idnum  and professor = ? and C.course = ?;";
		else if(student.equalsIgnoreCase("All"))//search by course and status
			sql ="SELECT C.student,C.date,C.fromtime,C.totime,C.course,C.status, A.lname,A.fname FROM consultations C, accounts A where C.student = A.idnum  and professor = ? and C.status =? and C.course = ?;";
		else if(status.equalsIgnoreCase("All"))//search by student and course
		{
			name=student.split(", ");
			sql ="SELECT C.student,C.date,C.fromtime,C.totime,C.course,C.status, A.lname,A.fname FROM consultations C, accounts A, accounts B where C.student = A.idnum  and professor = ? and B.lname =? and B.fname =? and C.student = B.idnum and C.course = ?;";
		}
		else if(course.equalsIgnoreCase("All"))//search by student and status
			sql ="SELECT C.student,C.date,C.fromtime,C.totime,C.course,C.status, A.lname,A.fname FROM consultations C, accounts A, accounts B where C.student = A.idnum  and professor = ? and B.lname =? and B.fname =? and C.student = B.idnum and C.status = ?;";
		else//search by student,course and status
			sql ="SELECT C.student,C.date,C.fromtime,C.totime,C.course,C.status, A.lname,A.fname FROM consultations C, accounts A, accounts B where C.student = A.idnum  and professor = ? and B.lname =? and B.fname =? and C.student = B.idnum and C.status = ? and C.course =?;";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idnum);
			if(student.equalsIgnoreCase("All") && course.equalsIgnoreCase("All") && status.equalsIgnoreCase("All"))
				ps.setInt(1, idnum);
			else if(student.equalsIgnoreCase("All") && course.equalsIgnoreCase("All"))
				ps.setString(2, status);
			else if(course.equalsIgnoreCase("All") && status.equalsIgnoreCase("All"))
			{
				ps.setString(2, name[0]);
				ps.setString(3, name[1]);
			}
			else if(student.equalsIgnoreCase("All") && status.equalsIgnoreCase("All"))
			{
				ps.setString(2, course);
			}
			else if(student.equalsIgnoreCase("All"))
			{
				ps.setString(2, status);
				ps.setString(3, course);
			}
			else if(status.equalsIgnoreCase("All"))
			{
				ps.setString(2, name[0]);
				ps.setString(3, name[1]);
				ps.setString(4, course);
			}
			else if(course.equalsIgnoreCase("All"))
			{
				ps.setString(2, name[0]);
				ps.setString(3, name[1]);
				ps.setString(4, status);
			}
			else
			{
				ps.setString(2, name[0]);
				ps.setString(3, name[1]);
				ps.setString(4, status);
				ps.setString(5, course);
			}
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				Request r = new Request();
				r.setStudentID(rs.getInt("student"));
				r.setDate(rs.getString("date"));
				r.setFromTime(rs.getString("fromtime"));
				r.setToTime(rs.getString("totime"));
				r.setCourse(rs.getString("course"));
				r.setStatus(rs.getString("status"));
				r.setLastName(rs.getString("lname"));
				r.setFirstName(rs.getString("fname"));
				reqList.add(r);
			}
		} catch (SQLException e)
		{ // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reqList;
	}
	
	public ArrayList<String> getAllProfOfStudent(int idnum)
	{
		Connection conn = DBConnection.getConnection();
		ArrayList<String> profList = new ArrayList<String>();
		String sql ="SELECT B.lname,B.fname FROM accounts A,accounts B, courseenrolled E,courses C WHERE E.idnum = A.idnum  and C.idcourse =E.idcourse and C.idprofessor = B.idnum and A.idnum = ? GROUP BY b.lname, b.fname ORDER BY b.lname;";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idnum);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				String name = rs.getString("lname");
				name+= ", ";
				name+=rs.getString("fname");
				profList.add(name);
			}
		} catch (SQLException e)
		{ // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return profList;
	}
	
	
}
