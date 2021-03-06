package recipe.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.Attachment;
import recipe.model.vo.RComment;
import recipe.model.vo.Recipe;
import recipe.model.vo.Tag;

public class RecipeDao {

	public int insertRecipe(Connection conn, Recipe r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO RECIPE VALUES(SEQ_R.NEXTVAL,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT,?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getbTitle());
			pstmt.setString(2, r.getmId());
			pstmt.setString(3, r.getnCode());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertContent(Connection conn, int bNo, String[] contentArr) {
		PreparedStatement pstmt = null;
		int result = 0;
			
		try {
			for(int i = 0; i < contentArr.length; i++) {
				if(!contentArr[i].equals("")) {
					String query = "INSERT INTO RCONTENT VALUES(?,?,?)";
					
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, bNo);
					pstmt.setInt(2, i);
					pstmt.setString(3, contentArr[i]);
					
					result += pstmt.executeUpdate();
				}
			}
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
		
		String query = "INSERT INTO ATTACHMENT VALUES(SEQ_A.NEXTVAL,SEQ_R.CURRVAL,NULL,?,?,SYSDATE,?,'N')";
		
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
	
	public int selectAId(Connection conn, Attachment at) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int aId = 0;
		
		String query = "SELECT AID FROM ATTACHMENT WHERE FILENAME=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, at.getFileName());
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				aId = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return aId;
	}
	
	public int insertTag(Connection conn, int aId, int tNo, String tag) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO TAG VALUES(?,?,?)";
		
		try {
			if(!tag.equals("")) {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, aId);
				pstmt.setInt(2, tNo);
				pstmt.setString(3, tag);
				
				result = pstmt.executeUpdate();				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Recipe selectRecipe(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Recipe r = null;
		
		String query = "SELECT * FROM RECIPE WHERE BNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				r = new Recipe(rset.getInt("BNO"),
						rset.getString("BTITLE"),
						rset.getDate("BDATE"),
						rset.getInt("BUP"),
						rset.getInt("BDOWN"),
						rset.getInt("BVIEWS"),
						rset.getString("MID"),
						rset.getString("NCODE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return r;
	}

	public int updateViews(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE RECIPE SET BVIEWS = BVIEWS+1 WHERE BNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Attachment> selectFiles(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachment at = null;
		ArrayList<Attachment> files = new ArrayList<>();
		
		String query = "SELECT * FROM ATTACHMENT WHERE BNO=? AND FILELEVEL=1";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				at = new Attachment(rset.getInt("AID"),
						rset.getInt("BNO"),
						rset.getInt("SBNO"),
						rset.getString("FILENAME"),
						rset.getString("FILEPATH"),
						rset.getDate("UPLOADDATE"),
						rset.getInt("FILELEVEL"),
						rset.getString("STATUS"));
				
				files.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return files;
	}

	public Attachment selectThumbnail(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachment thumbnail = null;
		
		String query = "SELECT * FROM ATTACHMENT WHERE BNO=? AND FILELEVEL=0";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
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

	public ArrayList selectRList(Connection conn, int currentPage, int limit, String nCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Recipe> list = new ArrayList<>();
		
		String query = "";
		if(nCode.length() == 3) {
			query = "SELECT * "
					+ "FROM (SELECT ROWNUM AS RNUM1, BNO, BTITLE, BDATE, BUP, BDOWN, BVIEWS, MID, NCODE FROM RLIST WHERE NCODE=?)"
					+ "WHERE RNUM1 BETWEEN ? AND ?";			
		} else {
			if(nCode.equals("AS")) {
				query = "SELECT * "
						+ "FROM (SELECT ROWNUM AS RNUM1, BNO, BTITLE, BDATE, BUP, BDOWN, BVIEWS, MID, NCODE FROM RLIST WHERE NCODE LIKE 'AS%')"
						+ "WHERE RNUM1 BETWEEN ? AND ?";				
			} else if(nCode.equals("EU")) {
				query = "SELECT * "
						+ "FROM (SELECT ROWNUM AS RNUM1, BNO, BTITLE, BDATE, BUP, BDOWN, BVIEWS, MID, NCODE FROM RLIST WHERE NCODE LIKE 'EU%')"
						+ "WHERE RNUM1 BETWEEN ? AND ?";
			} else {
				query = "SELECT * "
						+ "FROM (SELECT ROWNUM AS RNUM1, BNO, BTITLE, BDATE, BUP, BDOWN, BVIEWS, MID, NCODE FROM RLIST WHERE NCODE LIKE 'AM%')"
						+ "WHERE RNUM1 BETWEEN ? AND ?";
			}
			
		}
		
		
		int endRow = 9 * currentPage;
		int startRow = endRow - 8;
	
		try {
			if(nCode.length() == 3) {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, nCode);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);				
			} else {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);				
			}
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Recipe r = new Recipe(rset.getInt("BNO"),
						rset.getString("BTITLE"),
						rset.getDate("BDATE"),
						rset.getInt("BUP"),
						rset.getInt("BDOWN"),
						rset.getInt("BVIEWS"),
						rset.getString("MID"),
						rset.getString("NCODE"));
				
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int selectBNo(Connection conn, Recipe r) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int bNo = 0;
		
		String query = "SELECT * FROM RECIPE WHERE BTITLE=? AND MID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getbTitle());
			pstmt.setString(2, r.getmId());
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				bNo = rset.getInt("BNO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return bNo;
	}
	
	public String selectMNickname(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String nickname = null;
		
		String query = "SELECT MNICKNAME FROM MEMBER M JOIN RECIPE R ON (M.MID=R.MID) WHERE BNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				nickname = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return nickname;
	}

	public int plusUp(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE RECIPE SET BUP = BUP+1 WHERE BNO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int plusDown(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE RECIPE SET BDOWN = BDOWN+1 WHERE BNO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection conn, String nCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = "";
		if(nCode.length() == 3) {
			query = "SELECT COUNT(*) FROM RECIPE WHERE NCODE=?";
		} else {
			if(nCode.equals("AS")) {
				query = "SELECT COUNT(*) FROM RECIPE WHERE NCODE LIKE 'AS%'";
			} else if(nCode.equals("EU")) {
				query = "SELECT COUNT(*) FROM RECIPE WHERE NCODE LIKE 'EU%'";
			} else {
				query = "SELECT COUNT(*) FROM RECIPE WHERE NCODE LIKE 'AM%'";
			}
		}
		
		try {
			if(nCode.length() == 3) {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, nCode);				
			} else {
				pstmt = conn.prepareStatement(query);
			}
			
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
		
		return listCount;
	}

	public int deleteRecipe(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "DELETE FROM RECIPE WHERE BNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteAttachment(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "DELETE FROM ATTACHMENT WHERE BNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<RComment> selectComments(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<RComment> comments = new ArrayList<RComment>();
		String sql = "SELECT\r\n" + 
				"    RC.RCNO AS \"RCNO\",\r\n" + 
				"    RC.BNO AS \"BNO\",\r\n" + 
				"    RC.PARENTNO AS \"PARENTNO\",\r\n" + 
				"    RC.ORDERNO AS \"ORDERNO\",\r\n" + 
				"    RC.GROUPNO AS \"GROUPNO\",\r\n" + 
				"    LPAD( '└', (DEPTH) * 2 ) || RC.RCOMMENT AS \"RCOMMENT\",\r\n" + 
				"    M.MNICKNAME AS \"NICKNAME\",\r\n" + 
				"    RC.RDATE AS \"RDATE\",\r\n" + 
				"    RC.DEPTH AS \"DEPTH\"\r\n" + 
				"FROM\r\n" + 
				"    RECIPECOM RC\r\n" + 
				"        JOIN MEMBER M ON RC.MID = M.MID\r\n" + 
				"WHERE\r\n" + 
				"    BNO = ?\r\n" + 
				"ORDER BY\r\n" + 
				"    GROUPNO ASC, ORDERNO ASC";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RComment r = new RComment();
				r.setRcno(rs.getInt("RCNO"));
				r.setBno(rs.getInt("BNO"));
				r.setrComment(rs.getString("RCOMMENT"));
				r.setrDate(rs.getDate("RDATE"));
				r.setmNickname(rs.getString("NICKNAME"));
				r.setParentNo(rs.getInt("PARENTNO"));
				r.setOrderNo(rs.getInt("ORDERNO"));
				r.setGroupNo(rs.getInt("GROUPNO"));
				r.setDepth(rs.getInt("DEPTH"));
				comments.add(r);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return comments;
		
	}

	public int insertComment(Connection conn, RComment rc) {
		String sql = 
				"INSERT INTO RECIPECOM\r\n" + 
				"VALUES (SEQ_RECIPECOM.NEXTVAL, ?, ?, SYSDATE, ?, ?, ?, ?, ?)";
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rc.getBno());
			pstmt.setString(2, rc.getrComment());
			pstmt.setString(3, rc.getmNickname());	//아이디가 들어갔다. 헷갈리지 말긔
			pstmt.setInt(4, rc.getParentNo());
			pstmt.setInt(5, rc.getOrderNo());
			pstmt.setInt(6, rc.getGroupNo());
			pstmt.setInt(7, rc.getDepth());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

	public ArrayList<Recipe> selectRList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Recipe> rlist = new ArrayList<>();
		
		String query = "SELECT * "
				+ "FROM (SELECT ROWNUM AS RNUM1, BNO, BTITLE, BDATE, BUP, BDOWN, BVIEWS, MID, NCODE FROM RLIST_BEST)"
				+ "WHERE RNUM1 BETWEEN 1 AND 6";
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Recipe r = new Recipe(rset.getInt("BNO"),
						rset.getString("BTITLE"),
						rset.getDate("BDATE"),
						rset.getInt("BUP"),
						rset.getInt("BDOWN"),
						rset.getInt("BVIEWS"),
						rset.getString("MID"),
						rset.getString("NCODE"));
				
				rlist.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return rlist;
	}
	
	public ArrayList<String> selectContents(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> contents = new ArrayList<>();
		
		String query = "SELECT * FROM RCONTENT WHERE BNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				String str = rset.getString("BCONTENT");
				contents.add(str);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return contents;
	}

	public ArrayList<Tag> selectTags(Connection conn, ArrayList<Attachment> files) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Tag> tags = new ArrayList<>();
		
		try {
			String query = "SELECT * FROM TAG T JOIN ATTACHMENT A ON(T.AID=A.AID) WHERE A.BNO=?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, files.get(0).getbNo());
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Tag t = new Tag(rset.getInt("AID"),
								rset.getInt("TNO"),
								rset.getString("TAG"));
				
				tags.add(t);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return tags;
	}
	
	public int getListCount(Connection conn, String searchOption, String searchContent) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = "";
		if(searchOption.equals("title")) {
			query = "SELECT COUNT(*) FROM RECIPE WHERE BTITLE LIKE '%" + searchContent + "%'";
		} else {
			query = "SELECT COUNT(*) FROM RECIPE R JOIN MEMBER M ON(R.MID=M.MID) WHERE MNICKNAME LIKE '%" + searchContent + "%'";
		}
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}
	
	public ArrayList<Recipe> selectRList(Connection conn, int currentPage, int limit, String searchOption,
			String searchContent) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Recipe> rlist = new ArrayList<>();
		
		int endRow = 9 * currentPage;
		int startRow = endRow - 8;
		
		String query = "";
		if(searchOption.equals("title")) {
			query = "SELECT * "
					+ "FROM (SELECT ROWNUM AS RNUM1, BNO, BTITLE, BDATE, BUP, BDOWN, BVIEWS, MID, NCODE FROM RLIST WHERE BTITLE LIKE '%" + searchContent + "%')"
					+ "WHERE RNUM1 BETWEEN " + startRow + " AND " + endRow;			
		} else {
			query = "SELECT *\r\n" + 
					"FROM (SELECT ROWNUM AS RNUM1, BNO, BTITLE, BDATE, BUP, BDOWN, BVIEWS, R.MID, NCODE \r\n" + 
					"    FROM RLIST R\r\n" + 
					"    JOIN MEMBER M ON (R.MID=M.MID)\r\n" + 
					"    WHERE MNICKNAME LIKE '%" + searchContent + "%')\r\n" + 
					"WHERE RNUM1 BETWEEN " + startRow + " AND " + endRow;
		}
	
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				Recipe r = new Recipe(rset.getInt("BNO"),
						rset.getString("BTITLE"),
						rset.getDate("BDATE"),
						rset.getInt("BUP"),
						rset.getInt("BDOWN"),
						rset.getInt("BVIEWS"),
						rset.getString("MID"),
						rset.getString("NCODE"));
				
				rlist.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return rlist;
	}

	public int updateRecipe(Connection conn, int bNo, String title) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE RECIPE SET BTITLE=? WHERE BNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setInt(2, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteContent(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "DELETE RCONTENT WHERE BNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int selectFileLevel(Connection conn, String checkAId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int checkThumbnail = 0;
		
		String query = "SELECT COUNT(*) FROM ATTACHMENT WHERE AID=? AND FILELEVEL=0";
		
		try {
			int aId = 0;
			try {
				aId = Integer.parseInt(checkAId);				
			} catch(NumberFormatException e) {
				e.printStackTrace();
			}
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, aId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				checkThumbnail = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return checkThumbnail;
	}

	public int updateAttachment(Connection conn, String updateAId, String fileName) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE ATTACHMENT SET FILENAME=?, UPLOADDATE=SYSDATE WHERE AID=?";
		
		try {
			int aId = Integer.parseInt(updateAId);
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fileName);
			pstmt.setInt(2, aId);
			
			result += pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAttachment(Connection conn, int bNo, Attachment at) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO ATTACHMENT VALUES(SEQ_A.NEXTVAL,?,NULL,?,?,SYSDATE,1,'N')";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			pstmt.setString(2, at.getFileName());
			pstmt.setString(3, at.getFilePath());
				
			result += pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteTag(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "DELETE TAG WHERE AID=?";
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, fileList.get(i).getaId());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getTagCount(Connection conn, int aId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "SELECT COUNT(*) FROM TAG WHERE AID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, aId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

	public ArrayList<Tag> addPTitles(Connection conn, ArrayList<Tag> tags) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT *\r\n" + 
				"FROM (SELECT PTITLE\r\n" + 
				"    FROM PRODUCT P\r\n" + 
				"    JOIN SELL S ON(P.PID=S.PID)\r\n" + 
				"    WHERE S.SBNO=?)";
		
		try {
			for(int i = 0; i < tags.size(); i++) {
				int sbNo = Integer.parseInt(tags.get(i).getTag());
				
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, sbNo);
				
				rset = pstmt.executeQuery();
				while(rset.next()) {
					tags.get(i).setpTitle(rset.getString(1));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return tags;
	}

	public int selectGroupNo(Connection conn, int rcno) {
		String sql = "SELECT GROUPNO FROM RECIPECOM WHERE RCNO = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int groupNo = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rcno);
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

	public int deleteComment(Connection conn, int rcno) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "DELETE FROM RECIPECOM WHERE RCNO = ? OR PARENTNO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rcno);
			pstmt.setInt(2, rcno);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

	public int updateGroupNo(Connection conn, int groupNo) {
		String sql = "UPDATE RECIPECOM\r\n" + 
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

	public int selectReplyOrderNo(Connection conn, int rcno) {
		String sql = "SELECT ORDERNO FROM RECIPECOM WHERE RCNO = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int orderNo = 0;
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rcno);
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

	public int selectReplyParentNo(Connection conn, int rcno) {
		String sql = "SELECT PARENTNO FROM RECIPECOM WHERE RCNO = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int parentNo = 0;
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rcno);
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
		String sql = "UPDATE RECIPECOM\r\n" + 
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

	public int updateComment(Connection conn, int rcno, String rComment) {
		String sql = "UPDATE RECIPECOM\r\n" + 
				"SET RCOMMENT = ?, RDATE = SYSDATE\r\n" + 
				"WHERE RCNO = ?";
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rComment);
			pstmt.setInt(2, rcno);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

}













