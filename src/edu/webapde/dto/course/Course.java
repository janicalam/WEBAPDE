package edu.webapde.dto.course;

public class Course
{
	private int idCourse;
	private String courseCode="";
	private String section="";
	private String professorLast="";
	private String professorFirst="";
	private String day="";
	private String startTime="";
	private String endTime="";

	public Course()
	{

	}

	public Course(String course, String section, String professorl, String professorf, String day,
			String startTime, String endTime)
	{
		this.courseCode = course;
		this.professorLast = professorl;
		this.professorFirst = professorf;
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


	public String getProfessorLast()
	{
		return professorLast;
	}

	public void setProfessorLast(String professorLast)
	{
		this.professorLast = professorLast;
	}

	public String getProfessorFirst()
	{
		return professorFirst;
	}

	public void setProfessorFirst(String professorFirst)
	{
		this.professorFirst = professorFirst;
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
