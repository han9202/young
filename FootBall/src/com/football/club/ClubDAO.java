package com.football.club;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.football.db.DBUtil;


public class ClubDAO {
	private Connection conn = null;
	
	public ClubDAO() {
		conn = DBUtil.open();
	}
	
	public ArrayList<ClubDTO> list() {

		try {

			String sql = "select c.seq,EMBLEM,c.NAME,u.USERNAME,minage,maxage,maxusers,c.POINT,d.DOSI,a.SIGU,cl.CLUBLEVEL, (select count(*) from tblclub subc inner join tbluser u on u.CLUB_SEQ = subc.SEQ where c.seq = u.club_seq group by u.CLUB_SEQ) as nowcount from tblclub c inner join tbluser u on u.CLUB_SEQ = c.SEQ inner join tblarea a on a.SEQ = c.AREA_SEQ  inner join tbldosi d on d.SEQ = a.DOSI_SEQ inner join tblclublevel cl    on cl.SEQ = c.CLUBLEVEL_SEQ where userlevel_seq = 2";
			
			PreparedStatement stat = conn.prepareStatement(sql);
			
			ResultSet rs = stat.executeQuery();
			
			ArrayList<ClubDTO> list = new ArrayList<ClubDTO>();
			
			while(rs.next()){
				
				ClubDTO dto = new ClubDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setEmblem(rs.getString("emblem"));
				dto.setName(rs.getString("name"));
				dto.setUsername(rs.getString("username"));
				dto.setMinage(rs.getInt("minage"));
				dto.setMaxage(rs.getInt("maxage"));
				dto.setNowcount(rs.getInt("nowcount"));
				dto.setMaxusers(rs.getInt("maxusers"));
				dto.setDosi(rs.getString("dosi"));
				dto.setSigu(rs.getString("sigu"));
				dto.setClublevel(rs.getString("clublevel"));
				
				list.add(dto);
				
			}
			
			return list;

		} catch (Exception e) {

			System.out.println(e.toString());

		}
		
		return null;
	}

	public int getTotal(SearchDTO sdto) {
		
		try {

			String where = "";
			if (sdto.isSearch()) {
				where = String.format(" WHERE %s like '%%%s%%'"
														, sdto.getColumn()
														, sdto.getWord());
			}
			
			String sql = "SELECT COUNT(*) AS CNT FROM TBLclub" + where;
			PreparedStatement stat = conn.prepareStatement(sql);
			ResultSet rs = stat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}

		} catch (Exception e) {

			System.out.println(e.toString());

		}
		
		return 0;
	}
	
}
