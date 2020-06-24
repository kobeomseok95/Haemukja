package product.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;

import common.Attachment;
import product.model.vo.Order;
import product.model.vo.Product;
import product.model.vo.Review;
import product.model.vo.SComment;
import product.model.vo.Sale;

public class ProductDao {

	public int insertProduct(Connection conn, ArrayList<Product> plist) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO PRODUCT VALUES(SEQ_P.NEXTVAL,?,?,?,DEFAULT,?,?,?)";
		
		try {
			for(int i = 0; i < plist.size(); i++) {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, plist.get(i).getpTitle());
				pstmt.setInt(2, plist.get(i).getPrice());
				pstmt.setInt(3, plist.get(i).getpAmount());
				pstmt.setString(4, plist.get(i).getsId());
				pstmt.setInt(5, plist.get(i).getpDiscount());
				
				String pCode = "";
				switch(plist.get(i).getpCode()) {
					case "veg": pCode = "VEG"; break;
					case "fnr": pCode = "FNR"; break;
					case "sea": pCode = "SEA"; break;
					case "me": pCode = "ME"; break;
					case "vm": pCode = "VM"; break;
					case "bc": pCode = "BC"; break;
					case "nso": pCode = "NSO"; break;
				}
				pstmt.setString(6, pCode);
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Product selectProduct(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		
		String query = "SELECT * FROM PRODUCT WHERE PID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				p = new Product(rset.getInt("PID"),
						rset.getString("PTITLE"),
						rset.getInt("PPRICE"),
						rset.getInt("PAMOUNT"),
						rset.getString("SOLDOUT"),
						rset.getString("SID"),
						rset.getInt("PDISCOUNT"),
						rset.getString("PCODE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return p;
	}

	public int insertSale(Connection conn, Sale s) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO SELL VALUES(SEQ_SB.NEXTVAL, ?, SYSDATE, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, s.getSbTitle());
			pstmt.setString(2, s.getSbContent());
			pstmt.setString(3, s.getSbKind());
			pstmt.setString(4, s.getsId());
			pstmt.setInt(5, s.getpId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO ATTACHMENT VALUES(SEQ_A.NEXTVAL,NULL,SEQ_SB.CURRVAL,?,?,SYSDATE,?,'N', ?)";
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				Attachment at = fileList.get(i);
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, at.getFileName());
				pstmt.setString(2, at.getFilePath());
				pstmt.setInt(3, at.getLevel());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertAttachment2(Connection conn, ArrayList<Attachment> fileList, int sbNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO ATTACHMENT VALUES(SEQ_A.NEXTVAL,NULL,?,?,?,SYSDATE,?,'N',NULL)";
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				Attachment at = fileList.get(i);
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, sbNo);
				pstmt.setString(2, at.getFileName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getLevel());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Sale selectSale(Connection conn, int sbNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Sale s = null;
		
		String query = "SELECT * FROM SELL WHERE SBNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sbNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				s = new Sale(rset.getInt("SBNO"),
						rset.getString("SBTITLE"),
						rset.getDate("SBDATE"),
						rset.getString("SBCONTENT"),
						rset.getString("SBKIND"),
						rset.getString("SID"),
						rset.getInt("PID"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return s;
	}

	public int updateSale(Connection conn, int sbNo, Sale s) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE SELL SET SBTITLE=?, SBDATE=SYSDATE, SBCONTENT=? WHERE SBNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, s.getSbTitle());
			pstmt.setString(2, s.getSbContent());
			pstmt.setInt(3, sbNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteAttachment(Connection conn, int sbNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "DELETE FROM ATTACHMENT WHERE SBNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sbNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Sale selectSale2(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Sale s = null;
		
		String query = "SELECT * FROM SELL WHERE PID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				s = new Sale(rset.getInt("SBNO"),
						rset.getString("SBTITLE"),
						rset.getDate("SBDATE"),
						rset.getString("SBCONTENT"),
						rset.getString("SBKIND"),
						rset.getString("SID"),
						rset.getInt("PID"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return s;
	}

	public int getAllCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "SELECT COUNT(*) FROM SELL";
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return result;
	}

	public ArrayList<Sale> selectSList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Sale> list = new ArrayList<>();
		
		String query = "SELECT * FROM (SELECT ROWNUM AS RNUM1, SBNO, SBTITLE, SBDATE, SBCONTENT, SBKIND, SID, PID FROM SLIST) WHERE RNUM1 BETWEEN 1 AND 9";
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Sale s = new Sale(rset.getInt("SBNO"),
						rset.getString("SBTITLE"),
						rset.getDate("SBDATE"),
						rset.getString("SBCONTENT"),
						rset.getString("SBKIND"),
						rset.getString("SID"),
						rset.getInt("PID"));
				
				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return list;
	}

	public Attachment selectThumbnail(Connection conn, int sbNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachment thumbnail = null;
		
		String query = "SELECT * FROM ATTACHMENT WHERE SBNO=? AND FILELEVEL=0";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sbNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				thumbnail = new Attachment(rset.getInt("AID"),
						rset.getInt("BNO"),
						rset.getInt("SBNO"),
						rset.getString("FILENAME"), 
						rset.getString("FILEPATH"),
						rset.getDate("UPLOADDATE"),
						rset.getInt("FILELEVEL"),
						rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return thumbnail;
	}

	public ArrayList<Product> selectPlist(Connection conn, int currentPage, int limit, String sId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> plist = new ArrayList<>();
		
		String query = "SELECT * FROM PRODUCT WHERE ROWNUM BETWEEN ? AND ? AND SID = ?";
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, sId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Product p = new Product(rset.getInt("PID"),
										rset.getString("PTITLE"),
										rset.getInt("PPRICE"),
										rset.getInt("PAMOUNT"),
										rset.getString("SOLDOUT"),
										rset.getString("SID"),
										rset.getInt("PDISCOUNT"),
										rset.getString("PCODE"));
				
				plist.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return plist;
	}

	public int updateProduct(Connection conn, int pId, int flag) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "";
		
		if(flag == 1) {
			query = "UPDATE PRODUCT SET SOLDOUT='Y' WHERE PID=?";
		} else {
			query = "UPDATE PRODUCT SET SOLDOUT='N' WHERE PID=?";
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteProduct(Connection conn, int pId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "DELETE FROM PRODUCT WHERE PID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection conn, String sId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = "SELECT COUNT(*) FROM PRODUCT WHERE SID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return count;
	}

	public int getListCount2(Connection conn, String sId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = "SELECT COUNT(*) FROM MORDERLIST M JOIN PRODUCT P ON(M.PID=P.PID) WHERE SID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sId);
			
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

	public ArrayList<Order> selectOlist(Connection conn, int currentPage, int limit, String sId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Order> olist = new ArrayList<>();
		
		String query = "SELECT * FROM MORDERLIST M JOIN PRODUCT P ON(M.PID=P.PID) WHERE SID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Order o = new Order(rset.getInt("OID"),
								rset.getDate("ODATE"),
								rset.getString("OWAY"),
								rset.getDate("OPAYDATE"),
								rset.getString("SHIPCOM"),
								rset.getInt("SHIPNO"),
								rset.getInt("PAMOUNT"),
								rset.getString("MID"),
								rset.getInt("PID"),
								rset.getInt("OSID"),
								rset.getDate("REFDATE"));
				
				olist.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return olist;
	}

	public ArrayList<String> selectPtitles(Connection conn, ArrayList<Order> olist) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> pTitles = new ArrayList<>();
		
		String query = "SELECT PTITLE FROM MORDERLIST M JOIN PRODUCT P ON(M.PID=P.PID) WHERE OID=?";
		
		try {
			for(int i = 0; i < olist.size(); i++) {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, olist.get(i).getoId());
				
				rset = pstmt.executeQuery();
				while(rset.next()) {
					pTitles.add(rset.getString(1));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return pTitles;
	}

	public int updateOrder(Connection conn, int oId, String shipCom, int shipNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE MORDERLIST SET SHIPCOM=?, SHIPNO=?, OSID=4 WHERE OID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, shipCom);
			pstmt.setInt(2, shipNo);
			pstmt.setInt(3, oId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Attachment> selectFileDetail(Connection conn,int sbNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> detailList = new ArrayList<Attachment>();
		
		String query = "SELECT * FROM ATTACHMENT WHERE SBNO=? AND FILELEVEL=1";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sbNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				detailList.add(new Attachment(rset.getInt("AID"),
						rset.getInt("BNO"),
						rset.getInt("SBNO"),
						rset.getString("FILENAME"), 
						rset.getString("FILEPATH"),
						rset.getDate("UPLOADDATE"),
						rset.getInt("FILELEVEL"),
						rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return detailList;
	}

	public int cartInsert(Connection conn, String userId, int pid, String count) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO MCART VALUES(SEQ_CID.NEXTVAL,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setInt(2, pid);
			pstmt.setString(3, count);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
	
		return result;
	}

	public int selectPid(Connection conn, int sbNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int pId = 0;
		
		String query = "SELECT PID FROM SELL WHERE SBNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sbNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				pId = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return pId;
	}
	
	public ArrayList<Review> getReview(Connection conn, int sbNo) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      ArrayList<Review> review= new ArrayList<Review>();
	      String query ="SELECT R.RNO,R.SBNO,R.MID,R.CONTENT,R.ODATE,M.MNAME,M.MNICKNAME FROM REVIEW R JOIN MEMBER M ON M.MID=R.MID WHERE SBNO=?";
	      try {
	         pstmt=conn.prepareStatement(query);
	         pstmt.setInt(1, sbNo);
	         
	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	            review.add(new Review(
	                     rset.getInt("rno"),
	                     rset.getInt("sbno"),
	                     rset.getString("mid"),
	                     rset.getString("content"),
	                     rset.getDate("odate"),
	                     rset.getString("mname"),
	                     rset.getString("mnickname")
	                     
	                  ));
	         }
	         System.out.println("dao 由щ럭 :" + review);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	         close(rset);
	      }
	      
	      return review;
	 }

	public int review(Connection conn, String odate, int sbno, String review, String userId) {
	      PreparedStatement pstmt = null;
	      int result = 0;
	      String query = "INSERT INTO REVIEW VALUES(SEQ_RNO.NEXTVAL,?,?,?,?)";
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setInt(1, sbno);
	         pstmt.setString(2, userId);
	         pstmt.setString(3, review);
	         pstmt.setString(4, odate);
	         result=pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      
	      return result;
	 }

	public int getListSCount(Connection conn, String sbKind) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = "SELECT COUNT(*) FROM SELL WHERE SBKIND=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sbKind);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		System.out.println(listCount);
		
		return listCount;
			
	}

	public ArrayList<Sale> selectCaList(Connection conn, int currentPage, int limit, String sbKind) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Sale s = null;
		ArrayList<Sale> sList = new ArrayList<>();

		String query = "SELECT * FROM (SELECT ROWNUM AS RNUM1, SBNO, SBTITLE, SBDATE, SBCONTENT, SBKIND, SID, PID FROM SLIST WHERE SBKIND=?) WHERE RNUM1 BETWEEN ? AND ?";
		
		int endRow = 9 * currentPage;
		int startRow = endRow - 8;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sbKind);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			sList = new ArrayList<>();
			
			while(rset.next()) {
				s = new Sale(rset.getInt("SBNO"),
						rset.getString("SBTITLE"),
						rset.getDate("SBDATE"),
						rset.getString("SBCONTENT"),
						rset.getString("SBKIND"),
						rset.getString("SID"),
						rset.getInt("PID"));
			
				sList.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return sList;
	
	}

	public String selectCompany(Connection conn, String sId, int sbNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String company = "";
		
		String query = "SELECT COMPANY FROM SELLER S1 JOIN SELL S2 ON(S1.SID=S2.SID) WHERE S2.SID=? AND S2.SBNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sId);
			pstmt.setInt(2, sbNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				company = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return company;
	}

	public int refundProduct(Connection conn, int oId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE MORDERLIST SET OSID=7 WHERE OID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, oId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int exchangeProduct(Connection conn, int oId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE MORDERLIST SET OSID=11 WHERE OID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, oId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteSale(Connection conn, int sbno) {
	      int result = 0;
	      PreparedStatement pstmt = null;
	      
	      String sqlOne = "DELETE FROM ATTACHMENT WHERE SBNO = ?";
	      String sqlTwo = "DELETE FROM SELL WHERE SBNO = ?";
	      
	      try {
	          pstmt = conn.prepareStatement(sqlOne);
	          pstmt.setInt(1, sbno);
	          if(pstmt.executeUpdate() > 0) {
	             pstmt = conn.prepareStatement(sqlTwo);
	             pstmt.setInt(1, sbno);
	             
	             result = pstmt.executeUpdate();
	          } else {
	             return 0;
	          }
	      } catch(Exception e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      return result;
	 }


	public int selectMcart(Connection conn, String userId, int pid) {
		PreparedStatement pstmt = null; 
		ResultSet rset = null;
		int mcart = 0;
		String query = "SELECT COUNT(*) FROM MCART WHERE MID=? AND PID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setInt(2, pid);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				mcart = rset.getInt(1);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return mcart;
	}

	public int updateMcartCount(Connection conn, String userId, int pid, String count) {
		PreparedStatement pstmt =null;
		int result=0;
		
		String query = "UPDATE MCART SET CAMOUNT=CAMOUNT+? WHERE MID=? AND PID=? ";
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, count);
			pstmt.setString(2, userId);
			pstmt.setInt(3, pid);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Sale> selectSList(Connection conn, String searchContent) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Sale> slist = new ArrayList<>();
		
		String query = "SELECT SBNO, SBTITLE, COMPANY FROM SELL S1 JOIN SELLER S2 ON(S1.SID=S2.SID) WHERE SBTITLE LIKE '%" + searchContent + "%' ORDER BY SBNO ASC";
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				Sale s = new Sale(rset.getInt("SBNO"),
								rset.getString("SBTITLE"),
								rset.getString("COMPANY"));
				
				slist.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return slist;

	}

	public Product selectProduct(Connection conn, String pId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		
		String query = "SELECT * FROM PRODUCT WHERE PID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				p = new Product(rset.getInt("PID"),
						rset.getString("PTITLE"),
						rset.getInt("PPRICE"),
						rset.getInt("PAMOUNT"),
						rset.getString("SOLDOUT"),
						rset.getString("SID"),
						rset.getInt("PDISCOUNT"),
						rset.getString("PCODE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return p;
	}

	public Attachment selectThumbnail(Connection conn, String sbNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachment thumbnail = null;
		
		String query = "SELECT * FROM ATTACHMENT WHERE SBNO=? AND FILELEVEL=0";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sbNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				thumbnail = new Attachment(rset.getInt("AID"),
						rset.getInt("BNO"),
						rset.getInt("SBNO"),
						rset.getString("FILENAME"), 
						rset.getString("FILEPATH"),
						rset.getDate("UPLOADDATE"),
						rset.getInt("FILELEVEL"),
						rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return thumbnail;
	}

	public ArrayList<SComment> selectCommentList(Connection conn, int sbNo) {
		String sql = "SELECT\r\n" + 
				"    SC.SCNO AS \"SCNO\",\r\n" + 
				"    SC.SBNO AS \"SBNO\",\r\n" + 
				"    SC.PARENTNO AS \"PARENTNO\",\r\n" + 
				"    SC.ORDERNO AS \"ORDERNO\",\r\n" + 
				"    SC.GROUPNO AS \"GROUPNO\",\r\n" + 
				"    LPAD( '└', (DEPTH) * 2 ) || SC.SCOMMENT AS \"SCOMMENT\",\r\n" + 
				"    M.MNICKNAME AS \"MEMBER\",\r\n" + 
				"    S.COMPANY AS \"SELLER\",\r\n" + 
				"    SC.SDATE AS \"SDATE\",\r\n" + 
				"    SC.DEPTH AS \"DEPTH\"\r\n" + 
				"FROM\r\n" + 
				"    SELLCOM SC\r\n" + 
				"        LEFT JOIN MEMBER M ON SC.MID = M.MID\r\n" + 
				"        LEFT JOIN SELLER S ON SC.SID = S.SID\r\n" + 
				"WHERE\r\n" + 
				"    SBNO = ?\r\n" + 
				"ORDER BY\r\n" + 
				"    GROUPNO ASC, ORDERNO ASC";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<SComment> list = new ArrayList<SComment>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sbNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SComment sc = new SComment();
				sc.setScno(rs.getInt("SCNO"));
				sc.setSbno(rs.getInt("SBNO"));
				sc.setParentNo(rs.getInt("PARENTNO"));
				sc.setOrderNo(rs.getInt("ORDERNO"));
				sc.setGroupNo(rs.getInt("GROUPNO"));
				sc.setsComment(rs.getString("SCOMMENT"));
				if(rs.getString("MEMBER") == null) {
					sc.setmNickname(rs.getString("SELLER"));					
				}
				else {
					sc.setmNickname(rs.getString("MEMBER"));
				}
				sc.setsDate(rs.getDate("SDATE"));
				sc.setDepth(rs.getInt("DEPTH"));
				list.add(sc);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		close(pstmt);
		return list;
	}

	public int insertComment(Connection conn, SComment sc) {
		String userType = sc.getmNickname().split(",")[1];
		String sql = 
				"INSERT INTO SELLCOM\r\n" + 
				"VALUES (SEQ_SELLCOM.NEXTVAL, ?, ?, SYSDATE, ?, ?, ?, ?, ?, ?)";
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sc.getSbno());
			pstmt.setString(2, sc.getsComment());
			pstmt.setInt(4, sc.getParentNo());
			pstmt.setInt(5, sc.getOrderNo());
			pstmt.setInt(6, sc.getGroupNo());
			pstmt.setInt(7, sc.getDepth());
			if(userType.equals("seller")) {
				pstmt.setNull(3, Types.VARCHAR);
				pstmt.setString(8, sc.getmNickname().split(",")[0]);
			}
			else {
				pstmt.setString(3, sc.getmNickname().split(",")[0]);
				pstmt.setNull(8, Types.VARCHAR);				
			}
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

	public int selectGroupNo(Connection conn, int scno) {
		String sql = "SELECT GROUPNO FROM SELLCOM WHERE SCNO = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int groupNo = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, scno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				groupNo = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		close(rs);
		return groupNo;
	}

	public int deleteComment(Connection conn, int scno) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "DELETE FROM SELLCOM WHERE SCNO = ? OR PARENTNO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, scno);
			pstmt.setInt(2, scno);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

	public int updateGroupNo(Connection conn, int groupNo) {
		String sql = "UPDATE SELLCOM\r\n" + 
				"SET GROUPNO = GROUPNO - 1\r\n" + 
				"WHERE GROUPNO > ?";
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, groupNo);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

	public int selectReplyOrderNo(Connection conn, int scno) {
		String sql = "SELECT ORDERNO FROM SELLCOM WHERE SCNO = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int orderNo = 0;
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, scno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				orderNo = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return orderNo;
	}

	public int selectReplyParentNo(Connection conn, int scno) {
		String sql = "SELECT PARENTNO FROM SELLCOM WHERE SCNO = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int parentNo = 0;
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, scno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				parentNo = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return parentNo;
	}

	public int updateReplyOrderNo(Connection conn, int orderNo, int parentNo) {
		String sql = "UPDATE SELLCOM\r\n" + 
				"SET ORDERNO = ORDERNO - 1\r\n" + 
				"WHERE PARENTNO = ?\r\n" + 
				"    AND ORDERNO > ?";
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, parentNo);
			pstmt.setInt(2, orderNo);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

	public int updateComment(Connection conn, int scno, String sComment) {
		String sql = "UPDATE SELLCOM\r\n" + 
				"SET SCOMMENT = ?, SDATE = SYSDATE\r\n" + 
				"WHERE SCNO = ?";
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sComment);
			pstmt.setInt(2, scno);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

	

	
	

}
