package manager.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import manager.model.dao.ManagerDao;
import manager.model.vo.Report;

import static common.JDBCTemplate.*;

public class ManagerService {

	public int getListCount() {
		Connection conn = getConnection();
		
		int count = new ManagerDao().getListCount(conn);
		
		close(conn);
		
		return count;
	}

	public ArrayList<Report> selectRlist(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<Report> rlist = new ManagerDao().selectRList(conn, currentPage, limit);
		
		close(conn);
		
		return rlist;
	}
	
}
