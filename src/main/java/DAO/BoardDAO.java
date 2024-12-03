package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import VO.Board;
import utill.DBConnection;

public class BoardDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	public ArrayList<Board> getBoardList(String searchCondition, String searchKeyword) {
		ArrayList<Board> list = null;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT * FROM board ORDER BY seq";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, stmt, conn);
		}
		return list;
	}
	
	public ArrayList<Board> getBoard() {
		ArrayList<Board> list = null;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from board order by seq";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Board bo = new Board();
				bo.setSeq(rs.getInt("seq"));
				bo.setTitle(rs.getString("title"));
				bo.setContent(rs.getString("content"));
				bo.setRegdate(rs.getDate("regdate"));
				bo.setCnt(rs.getInt("cnt"));
				
				list.add(bo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, stmt, conn);
		}
		return list;
	}
	
	public int getSeq() {
		int seq = 0;
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT NVL(MAX(seq), 1000000)+1 seq FROM board";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				seq = rs.getInt("seq");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, stmt, conn);
		}
		return seq;
	}
}
