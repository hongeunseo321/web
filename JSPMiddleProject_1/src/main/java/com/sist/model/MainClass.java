package com.sist.model;
import java.text.SimpleDateFormat;
import java.util.*;
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		StringTokenizer st=new StringTokenizer(today,"-");
		String strYear=null;
		String strMonth=null;
		String strDay=null;
		
		 
	      String sy=st.nextToken();
	      String sm=st.nextToken();
	      String sd=st.nextToken();
	      if(strYear==null)
	      {
	    	  strYear=sy;
	      }
	      if(strMonth==null)
	      {
	    	  strMonth=sm;
	      }
	      strDay=sd;
	      System.out.println(strYear+" "+strMonth+" "+strDay);
	      int year=Integer.parseInt(strYear);
	      int month=Integer.parseInt(strMonth);
	      int day=Integer.parseInt(strDay);
	      
	      Calendar cal=Calendar.getInstance();
	      cal.set(Calendar.YEAR, year);
	      cal.set(Calendar.MONTH, month-1);
	      cal.set(Calendar.DATE, 1);
	      
	      String[] strWeek={"일","월","화","수",
	    		       "목","금","토"};
	      int week=cal.get(Calendar.DAY_OF_WEEK);
	      week=week-1;
	      int lastday=cal.getActualMaximum(Calendar.DATE);
	      System.out.println("요일:"+strWeek[week]);
	      System.out.println("마지막일:"+lastday);
	}

}
