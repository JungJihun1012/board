package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import VO.Board;
import utill.DBConnection;

public class AddBoardDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	public int insertBoard(Board vo) {
		int result = 0;
		
		try {
			String sql  = "insert into board values((select nvl(max(seq), 1) + 1 seq from board)), ?, ?, ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, rs.getInt("seq"));
			result = stmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, stmt, conn);
		}
		return result;
	}
}
