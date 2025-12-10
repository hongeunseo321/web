package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
import com.sist.vo.*;
public class MusicDAO {
  private static SqlSessionFactory ssf;
  static
  {
	  try
	  {
		  Reader reader=Resources.getResourceAsReader("Config.xml");
		  ssf=new SqlSessionFactoryBuilder().build(reader);
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
  }
  /*
   *   <select id="musicListData" resultType="MusicVO"
	   parameterType="hashmap"
	  >
	    SELECT no,title,poster,singer,album,num
	    FROM (SELECT no,title,poster,singer,album,rownum as num
	    FROM (SELECT no,title,poster,singer,album
	    FROM genie_music ORDER BY no ASC))
	    WHERE num BETWEEN #{start} AND #{end}
	  </select>
	  <select id="musicTotalPage" resultType="int">
	    SELECT CEIL(COUNT(*)/30.0) FROM genie_music
	  </select>
   */
  // 목록 
  /*
   *  Spring : MVC구조 
   *   => Controller를 지원 
   *      DispatcherServlet => 라이브러리 : 등록 : web.xml
   *      
   *      = Model : 기능 (요청에 대한 처리)
   *        = Model => 브라우저 연결 ==
   *                                 | ==> VO
   *        = DAO  => 오라클 연결    ==
   *      = View
   *        = JSP 화면 출력 
   *          --------
   *          HTML / VueJS / ReactJS(TypeScript)
   *                         => tanStack-query
   *                         = react 
   *                         = redux 
   *           |     ---------------
   *        ThymeLeaf 
   *           2차 최종 프로젝트 
   *           -------------
   *           | 
   */
  public static List<MusicVO> musicListData(Map map)
  {
	  List<MusicVO> list=null;
	  try
	  {
		  SqlSession session=ssf.openSession();
		  list=session.selectList("musicListData",map);
		  session.close();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  return list;
  }
  // 총페이지
  public static int musicTotalPage()
  {
	  int total=0;
	  try
	  {
		  SqlSession session=ssf.openSession();
		  total=session.selectOne("musicTotalPage");
		  session.close();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  return total;
  }
}
