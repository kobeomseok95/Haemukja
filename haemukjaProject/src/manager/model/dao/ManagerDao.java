package manager.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import manager.model.vo.Report;

import static common.JDBCTemplate.*;

public class ManagerDao {

	public int getListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = "SELECT COUNT(*) FROM REPORT";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return count;
	}

	public ArrayList<Report> selectRList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Report> rlist = new ArrayList<>();
		
		String query = "SELECT * FROM  WHERE ROWNUM BETWEEN ? AND ?";
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Report r = new Report(rset.getInt("REPORT_NO"),
								rset.getString("REPORT_MID"),
								rset.getString("BAD_MEMBER"),
								rset.getInt("REPORT_BNO"),
								rset.getString("REPORT_CONTENT"),
								rset.getDate("REPORT_DATE"),
								rset.getString("CHECK_ADMIN"));
				
				rlist.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return rlist;
	}

}
