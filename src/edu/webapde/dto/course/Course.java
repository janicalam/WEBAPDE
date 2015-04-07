package edu.webapde.dto.course;

public class Course
{
	private String course;
	private String section;
	private String professor;
	private String day;
	private String startTime;
	private String endTime;

	public Course()
	{

	}

	public Course(String course, String section, String professor, String day,
			String startTime, String endTime)
	{
		this.course = course;
		this.professor = professor;
		this.section = section;
		this.day = day;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public String getCourse()
	{
		return course;
	}

	public void setCourse(String course)
	{
		this.course = course;
	}

	public String getSection()
	{
		return section;
	}

	public void setSection(String section)
	{
		this.section = section;
	}

	public String getProfessor()
	{
		return professor;
	}

	public void setProfessor(String professor)
	{
		this.professor = professor;
	}

	public String getDay()
	{
		return day;
	}

	public void setDay(String day)
	{
		this.day = day;
	}

	public String getStartTime()
	{
		return startTime;
	}

	public void setStartTime(String startTime)
	{
		this.startTime = startTime;
	}

	public String getEndTime()
	{
		return endTime;
	}

	public void setEndTime(String endTime)
	{
		this.endTime = endTime;
	}

}
