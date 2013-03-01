package com.indicrowd.util;

import java.text.DateFormatSymbols;
import java.util.Calendar;

public class DateUtil {
	public static String getFormedDate(Calendar calendar){
		return getMonthString(calendar)+" "+calendar.get(Calendar.DATE)+"일, "+calendar.get(Calendar.YEAR)+"년";
	}
	
	public static String getMonthString(Calendar calendar){
		
		return new DateFormatSymbols().getMonths()[calendar.get(Calendar.MONTH)];
	}
}
