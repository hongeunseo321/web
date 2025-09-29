package com.sist.dao;
import java.util.*;

import com.sist.vo.MusicVO;

import java.sql.*;
public class MusicDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static MusicDAO dao;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	public MusicDAO()
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {}
	}
	public static MusicDAO newInstance()
	{
		if(dao==null)
			dao=new MusicDAO();
			return dao;
	}
	public void getConnection()
	{
		try
		{
			conn=DriverManager.getConnection(URL,"hr","happy");
		}catch(Exception ex) {}
	}
	public void disConnection()
	{
		try
		{
			if(ps!=null)
				ps.close();
			if(conn!=null)
				conn.close();
		}catch(Exception ex) {}		
	}
	// 클래스화 => 라이브러리 (MyBatis / JPA)
	/*
	 *	public List<MusicVO> musicListData(int cno)
	 *	{
	 *		return my.selectList(1)
	 *	} 
	 *
	 *	=> List<MusicVO> findAll();
	 *		findAll() : 전체 데이터를 조회할 수 있습니다.
	 *		findBy() : 조건을 추가하여 전체 데이터를 조회할 수 있습니다.
	 *		findTop5By() : 조건에 맞는 데이터 중 상위 5건만 가져옵니다.
	 *		findDistinctBy() : 중복을 제거하여 조회할 수 있습니다.
	 *		findFirstBy() : 조회된 데이터 중 1건만 가져옵니다.
	 *	 	count() : 전체 행 수를 조회합니다.
	 *		countBy() : 조건에 맞는 전체 행 수를 조회합니다.
	 *		save() : 단일 데이터를 저장합니다.
	 *		saveAll() : 여러 건의 데이터를 저장합니다.
	 *		delete() : 단일 데이터를 삭제합니다.
	 *		deleteAll() : 여러 건의 데이터를 삭제합니다.
	 *		deleteBy() : 조건에 맞는 데이터를 삭제합니다.
	 */
	public List<MusicVO> musicListData(int cno)
	{
		List<MusicVO> list=new ArrayList<MusicVO>();
		try
		{
			getConnection();
			String sql="SELECT no,cno,poster,title,singer "
					+ "FROM genie_music "
					+ "WHERE cno=? "
					+ "ORDER BY no";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cno);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				MusicVO vo=new MusicVO();
				vo.setNo(rs.getInt(1));
				vo.setCno(rs.getInt(2));
				vo.setPoster(rs.getString(3));
				vo.setTitle(rs.getString(4));
				vo.setSinger(rs.getString(5));
				
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return list;
	}
}
