package com.indicrowd.concert;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
public class Event {
	String title;
	int startYear;
	int startMonth;
	int startDay;
	int startHours;
	int startMinutes;
	
	int endYear;
	int endMonth;
	int endDay;
	int endHours;
	int endMinutes;
	
	String hallName;
}
