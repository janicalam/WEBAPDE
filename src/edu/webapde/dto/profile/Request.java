package edu.webapde.dto.profile;

public class Request
{
	private int studentID;
	private String lastName;
	private String firstName;
	private int profId;
	private String date;
	private String fromTime;
	private String toTime;
	private String course;
	private String status;

	public Request()
	{
		
	}
	
	public int getStudentID()
	{
		return studentID;
	}

	public String getStatus()
	{
		return status;
	}

	public void setStatus(String status)
	{
		this.status = status;
	}

	public void setStudentID(int studentID)
	{
		this.studentID = studentID;
	}

	public String getLastName()
	{
		return lastName;
	}

	public void setLastName(String last)
	{
		this.lastName = last;
	}

	public String getFirstName()
	{
		return firstName;
	}
	
	public int getProfId() {
		return profId;
	}

	public void setProfId(int profId) {
		this.profId = profId;
	}


	public void setFirstName(String first)
	{
		this.firstName = first;
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
