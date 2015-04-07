package edu.webapde.dto.profile;

public class Request
{
	private int studentID;
	private int profID;
	private String date;
	private String fromTime;
	private String toTime;
	private String course;

	public Request()
	{
		
	}
	
	public int getStudentID()
	{
		return studentID;
	}

	public void setStudentID(int studentID)
	{
		this.studentID = studentID;
	}

	public int getProfID()
	{
		return profID;
	}

	public void setProfID(int profID)
	{
		this.profID = profID;
	}

	public String getDate()
	{
		return date;
	}

	public void setDate(String date)
	{
		this.date = date;
	}

	public String getFromTime()
	{
		return fromTime;
	}

	public void setFromTime(String fromTime)
	{
		this.fromTime = fromTime;
	}

	public String getToTime()
	{
		return toTime;
	}

	public void setToTime(String toTime)
	{
		this.toTime = toTime;
	}

	public String getCourse()
	{
		return course;
	}

	public void setCourse(String course)
	{
		this.course = course;
	}


}
