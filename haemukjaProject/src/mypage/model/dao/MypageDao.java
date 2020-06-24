package mypage.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.Attachment;
import mypage.model.vo.MCart;
import mypage.model.vo.MyOrder;
import mypage.model.vo.NMOrder;
import product.model.vo.Review;
import product.model.vo.Sale;

public class MypageDao {
	
	public int getListCount(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet reset =null;
		
		String query = "SELECT COUNT(*) FROM MCART WHERE MID=?";
		int listCount = 0;
		
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			reset = pstmt.executeQuery();
			
			if(reset.next()) {
				listCount = reset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(reset);
		}
		
		return listCount;
	}

	public ArrayList<MCart> selectList(Connection conn, int currentPage, int limit, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<MCart> list = new ArrayList<MCart>();
		
		String query = "SELECT * FROM (SELECT ROWNUM AS RNUM, CID, MID, PTITLE, CAMOUNT, PPRICE, SBNO,PID\r\n" + 
				"FROM MCART_VIEW WHERE MID=?)\r\n" + 
				"WHERE RNUM BETWEEN ? AND ?";
		int startRow = (currentPage-1)*limit+1;
		int endRow = startRow + (limit -1);
		try {
			pstmt =conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
			
				MCart mcart = new MCart(rset.getInt("cid"),
						rset.getString("mid"),
						rset.getInt("pid"),
						rset.getInt("camount"),
						rset.getString("ptitle"),
						rset.getInt("pprice"),
						rset.getInt("sbno")
						);
				list.add(mcart);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	public int getOrderListCount(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet reset =null;
		
		String query = "SELECT COUNT(*) FROM MORDERLIST WHERE MID=?";
		int listCount = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			reset = pstmt.executeQuery();
			
			if(reset.next()) {
				listCount = reset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(reset);
		}
		
		return listCount;
	}

	public ArrayList<MyOrder> selectOrderList(Connection conn, int currentPage, int limit, String userId) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      ArrayList<MyOrder> list = new ArrayList<MyOrder>();
	      
	      String query = "SELECT * FROM (SELECT ROWNUM AS RNUM, ODATE, SHIPCOM, SHIPNO, MID, O_NAME, OSID,OID,PAMOUNT,PID,SBNO,PTITLE \r\n" + 
	      		"FROM MORDERLIST_VIEW WHERE MID=?)\r\n" + 
	      		"WHERE RNUM BETWEEN ? AND ?";
	      int startRow = (currentPage-1)*limit+1;
	      int endRow = startRow + (limit -1);
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, userId);
	         pstmt.setInt(2, startRow);
	         pstmt.setInt(3, endRow);
	         
	         
	         rset = pstmt.executeQuery();
	         while(rset.next()) {
	            MyOrder mo = new MyOrder(               rset.getInt("pid"),
	                                             rset.getString("ptitle"),
	                                             rset.getDate("odate"),
	                                             rset.getString("shipcom"),
	                                             rset.getInt("shipno"),
	                                             rset.getString("mid"),
	                                             rset.getInt("osid"),
	                                             rset.getString("o_name"),
	                                             rset.getInt("oid"),
	                                             rset.getInt("pamount"),
	                                             rset.getInt("sbno")
	                                             );
	            list.add(mo);
	         }
	         System.out.println(list);
	         
	      } catch (SQLException e) {
	         
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	         
	      }
	      
	      return list;
	   }

	public int getRefundListCount(Connection conn, String userId) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet reset =null;
		
		String query = "SELECT COUNT(*) FROM REFUNDLIST_VIEW WHERE MID=?";
		
		int listCount = 0;
		
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			reset = pstmt.executeQuery();
			
			if(reset.next()) {
				listCount = reset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(reset);
		}
		
		return listCount;
	}

	public ArrayList<MyOrder> selectRefundList(Connection conn, int currentPage, int limit, String userId) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      ArrayList<MyOrder> list = new ArrayList<MyOrder>();
	      
	      String query = "SELECT * FROM (SELECT ROWNUM AS RNUM, ODATE, REFDATE, O_NAME, MID, SBNO, PTITLE\r\n" + 
	      		"FROM REFUNDLIST_VIEW WHERE MID=?)\r\n" + 
	      		"WHERE RNUM BETWEEN ? AND ?";
	      int startRow = (currentPage-1)*limit+1;
	      int endRow = startRow + (limit -1);
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, userId);
	         pstmt.setInt(2, startRow);
	         pstmt.setInt(3, endRow);
	        
	         
	         rset= pstmt.executeQuery();
	         while(rset.next()) {
	            MyOrder mo = new MyOrder(rset.getString("ptitle"),
	                                             rset.getDate("odate"),
	                                             rset.getDate("refdate"),
	                                             rset.getString("o_name"),
	                                             rset.getInt("sbno")
	                  );
	            
	            list.add(mo);
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      
	      return list;
	}
	

	public int cancelOrder(Connection conn, int oid, int pid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query ="DELETE FROM MORDERLIST WHERE OID=? AND PID=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, oid);
			pstmt.setInt(2, pid);
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<Attachment> selectThumbnail(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList<Attachment> list =  new ArrayList<>();
		
		String query = "SELECT * FROM ATTACHMENT WHERE FILELEVEL=0";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			
			
			while(rs.next()) {
				Attachment ac = new Attachment(
						rs.getInt("aid"),
						rs.getInt("bno"),
						rs.getInt("sbno"),
						rs.getString("fileName"),
						rs.getString("filePath"),
						rs.getDate("uploaddate"),
						rs.getInt("filelevel"),
						rs.getString("status")
						);	
				
				list.add(ac);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public int updateCount(Connection conn, Integer count, String cid, String userId) {
	      PreparedStatement pstmt = null;
	      int result= 0;
	      
	      String query = "UPDATE MCART SET CAMOUNT = ? WHERE CID=? AND MID=?";
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setInt(1, count);
	         pstmt.setString(2, cid);
	         pstmt.setString(3, userId);
	         
	         result=pstmt.executeUpdate();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      
	      
	      return result;
	   }

	public ArrayList<NMOrder> selectNmOrder(Connection conn ,String oid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query ="SELECT * FROM PRODUCT P JOIN NMORDERLIST N ON P.PID = N.PID JOIN OSTATE O ON N.OSID=O.OSID WHERE OID = ?";
		ArrayList<NMOrder> no=new ArrayList<NMOrder>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, oid);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				no.add(new NMOrder(
						rset.getString("ptitle"),
						rset.getInt("pprice"),
						rset.getDate("odate"),
						rset.getInt("osid"),
						rset.getInt("pid"),
						rset.getInt("pcount"),
						rset.getString("o_name")
						));
			}
		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return no;
	}

	public ArrayList<Review> selectReview(String userId, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> review = new ArrayList<Review>();
		String query = "SELECT R.RNO, R.SBNO,M.MID,R.CONTENT,R.ODATE,M.MNAME,M.MNICKNAME,R.OID,R.PID\r\n" + 
				"FROM REVIEW R\r\n" + 
				"JOIN MEMBER M ON(R.MID=M.MID)\r\n" + 
				"WHERE R.MID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				review.add(new Review(rset.getInt("RNO"),
								rset.getInt("SBNO"),
								rset.getString("MID"),
								rset.getString("CONTENT"),
								rset.getDate("ODATE"),
								rset.getString("MNAME"),
								rset.getString("MNICKNAME"),
								rset.getInt("oid"),
								rset.getInt("pid")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return review;
	}


}
