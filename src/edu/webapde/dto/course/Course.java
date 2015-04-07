package edu.webapde.dto.course;

public class Course
{
	private int idCourse;
	private String courseCode;
	private String section;
	private String professor;
	private String day;
	private String startTime;
	private String endTime;

	public Course()
	{

	}

	public Course(int idCourse, String course, String section, String professor, String day,
			String startTime, String endTime)
	{
		this.idCourse = idCourse;
		this.courseCode = course;
		this.professor = professor;
		this.section = section;
		this.day = day;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public int getIdCourse()
	{
		return idCourse;
	}

	public void setIdCourse(int idCourse)
	{
		this.idCourse = idCourse;
	}

	public String getCourseCode()
	{
		return courseCode;
	}

	public void setCourseCode(String courseCode)
	{
		this.courseCode = courseCode;
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
