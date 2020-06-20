package qna.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import qna.model.vo.Comment;
import qna.model.vo.Notice;
import qna.model.vo.Qna;

public class QnaDao {

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM QNA";
		int listCount = 0;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return listCount;
	}

	public ArrayList<Qna> selectList(Connection conn, int currentPage, int displayRow) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Qna> list = new ArrayList<Qna>();
		String sql = "SELECT * FROM (SELECT ROWNUM AS \"RNO\", Q.QID AS \"QID\", Q.QTITLE AS \"TITLE\", M.MNICKNAME AS \"NICKNAME\", Q.QDATE AS \"QDATE\", Q.ANSWER AS \"ANSWER\" FROM (SELECT * FROM QNA ORDER BY 1 DESC) Q JOIN MEMBER M ON Q.MID = M.MID ORDER BY 2 DESC) WHERE RNO BETWEEN ? AND ?";
		try {
			pstmt = conn.prepareStatement(sql);
			int endRow = currentPage * displayRow;
			int startRow = endRow - displayRow + 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Qna qna = new Qna(rs.getInt("RNO"),
						rs.getInt("QID"),
						rs.getString("TITLE"),
						rs.getString("NICKNAME"),
						rs.getDate("QDATE"),
						rs.getString("ANSWER"));
				list.add(qna);
			}
//			if(list.isEmpty()) {
//				System.out.println("empty");
//			} else {
//				for(Qna q : list) {
//					System.out.println(q);
//				}
//			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
//		for(Qna q : list)
//			System.out.println(q + "dao");
		return list;
	}

	public Qna selectQna(Connection conn, int qid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Qna qna = null;
		String sql = "SELECT Q.QID AS \"QID\", M.MNICKNAME AS \"NICKNAME\", Q.QCONTENT AS \"CONTENT\", Q.QTITLE AS \"TITLE\", Q.QDATE AS \"QDATE\", Q.ANSWER AS \"ANSWER\" FROM QNA Q JOIN MEMBER M ON (M.MID = Q.MID) WHERE Q.QID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				qna = new Qna(rs.getInt("QID"),
						rs.getString("NICKNAME"),
						rs.getString("CONTENT"),
						rs.getString("TITLE"),
						rs.getDate("QDATE"),
						rs.getString("ANSWER"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return qna;
	}

	public int deleteQna(Connection conn, int qid) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "DELETE FROM QNA WHERE QID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qid);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertQna(Connection conn, Qna qna) {
		PreparedStatement pstmt = null;
		int result = 0;
		// 아이디 내용 제목순
		String sql = "INSERT INTO QNA VALUES (SEQ_QNA.NEXTVAL, ?, ?, ?, SYSDATE, 'N')";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qna.getMnickname()); //닉네임이라 쓰여있지만 아이디다.
			pstmt.setString(2, qna.getQcontent());
			pstmt.setString(3, qna.getQtitle());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateQna(Connection conn, int qid, String title, String content) {
		PreparedStatement pstmt = null;
		int result = 0;
		// 아이디 내용 제목순
		String sql = "UPDATE QNA SET QCONTENT = ?, QTITLE = ? WHERE QID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content); //닉네임이라 쓰여있지만 아이디다.
			pstmt.setString(2, title);
			pstmt.setInt(3, qid);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Qna> searchNickname(Connection conn, String searchContent) {
		PreparedStatement pstmt = null;
		ArrayList<Qna> list = new ArrayList<Qna>();
		ResultSet rs = null;
		String sql = "SELECT ROWNUM, F.* \r\n" + 
				"FROM \r\n" + 
				"(SELECT Q.QID, M.MNICKNAME, Q.QCONTENT, Q.QTITLE, Q.QDATE, Q.ANSWER \r\n" + 
				"FROM QNA Q \r\n" + 
				"JOIN MEMBER M ON (Q.MID = M.MID) \r\n" + 
				"WHERE M.MNICKNAME = ? \r\n" + 
				"ORDER BY Q.QID DESC) F";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchContent);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Qna q = new Qna(rs.getInt("ROWNUM"),
						rs.getInt("QID"),
						rs.getString("MNICKNAME"),
						rs.getString("QCONTENT"),
						rs.getString("QTITLE"),
						rs.getDate("QDATE"),
						rs.getString("ANSWER"));
				list.add(q);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Qna> searchTitle(Connection conn, String searchContent) {
		PreparedStatement pstmt = null;
		ArrayList<Qna> list = new ArrayList<Qna>();
		ResultSet rs = null;
		String sql = "SELECT ROWNUM, R.* FROM (SELECT Q.QID, M.MNICKNAME, Q.QCONTENT, Q.QTITLE, Q.QDATE, Q.ANSWER FROM QNA Q JOIN MEMBER M ON (Q.MID = M.MID) WHERE QTITLE LIKE '%' || ? || '%' ORDER BY Q.QID DESC) R";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchContent);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Qna q = new Qna(rs.getInt("ROWNUM"),
						rs.getInt("QID"),
						rs.getString("MNICKNAME"),
						rs.getString("QCONTENT"),
						rs.getString("QTITLE"),
						rs.getDate("QDATE"),
						rs.getString("ANSWER"));
				list.add(q);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Qna> searchContent(Connection conn, String searchContent) {
		PreparedStatement pstmt = null;
		ArrayList<Qna> list = new ArrayList<Qna>();
		ResultSet rs = null;
		String sql = "SELECT ROWNUM, R.* FROM (SELECT Q.QID, M.MNICKNAME, Q.QCONTENT, Q.QTITLE, Q.QDATE, Q.ANSWER FROM QNA Q JOIN MEMBER M ON (Q.MID = M.MID) WHERE QCONTENT LIKE '%' || ? || '%' ORDER BY Q.QID DESC) R";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchContent);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Qna q = new Qna(rs.getInt("ROWNUM"),
						rs.getInt("QID"),
						rs.getString("MNICKNAME"),
						rs.getString("QCONTENT"),
						rs.getString("QTITLE"),
						rs.getDate("QDATE"),
						rs.getString("ANSWER"));
				list.add(q);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Comment> selectReplyList(Connection conn, int qid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Comment> list = new ArrayList<Comment>();
		String sql = 
				"SELECT\r\n" + 
				"    QC.QCNO AS \"QCNO\",\r\n" + 
				"    QC.QID AS \"QID\",\r\n" + 
				"    QC.PARENTNO AS \"PARENTNO\",\r\n" + 
				"    QC.ORDERNO AS \"ORDERNO\",\r\n" + 
				"    QC.GROUPNO AS \"GROUPNO\",\r\n" + 
				"    LPAD( '└', (DEPTH) * 2 ) || QC.QCOMMENT AS \"QCOMMENT\",\r\n" + 
				"    M.MNICKNAME AS \"NICKNAME\",\r\n" + 
				"    QC.QDATE AS \"QDATE\",\r\n" + 
				"    QC.DEPTH AS \"DEPTH\"\r\n" + 
				"FROM \r\n" + 
				"    QNACOM QC\r\n" + 
				"    JOIN MEMBER M ON QC.MID = M.MID\r\n" + 
				"WHERE \r\n" + 
				"    QID = ?\r\n" + 
				"ORDER BY \r\n" + 
				"    GROUPNO ASC, ORDERNO ASC";
				
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Comment c = new Comment();
				c.setQcno(rs.getInt("QCNO"));
				c.setQid(rs.getInt("QID"));
				c.setParentNo(rs.getInt("PARENTNO"));
				c.setGroupNo(rs.getInt("GROUPNO"));
				c.setOrderNo(rs.getInt("ORDERNO"));
				c.setqComment(rs.getString("QCOMMENT"));
				c.setmNickname(rs.getString("NICKNAME"));
				c.setqDate(rs.getDate("QDATE"));
				c.setDepth(rs.getInt("DEPTH"));
				list.add(c);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public Notice getNotice(Connection conn, int nno) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Notice notice = null;
		String sql = "SELECT * FROM NOTICE WHERE NNO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				notice = new Notice(rs.getInt("NNO"),
						rs.getString("NTITLE"),
						rs.getString("NCONTENT"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally{
			close(rs);
			close(pstmt);
		}
		return notice;
	}
	public int answerComplete(Connection conn, int qid) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "UPDATE QNA SET ANSWER = 'Y' WHERE QID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qid);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Notice> selectNotice(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Notice> noticeList = new ArrayList<Notice>();
		String sql = "SELECT * FROM NOTICE";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Notice notice = new Notice(rs.getInt("NNO"),
						rs.getString("NTITLE"),
						rs.getString("NCONTENT"));
				noticeList.add(notice);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return noticeList;
	}

	public int deleteQnaComments(Connection conn, int qid) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "DELETE FROM QNACOM WHERE QID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qid);
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertComment(Connection conn, Comment c) {
		String sql = 
				"INSERT INTO QNACOM\r\n" + 
				"VALUES (SEQ_QNACOM.NEXTVAL, ?, ?, SYSDATE, ?, ?, ?, ?, ?)";
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getQid());
			pstmt.setString(2, c.getqComment());
			pstmt.setString(3, c.getmNickname());	//아이디가 들어갔다. 헷갈리지 말긔
			pstmt.setInt(4, c.getParentNo());
			pstmt.setInt(5, c.getOrderNo());
			pstmt.setInt(6, c.getGroupNo());
			pstmt.setInt(7, c.getDepth());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

	public int deleteComment(Connection conn, int qcno) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "DELETE FROM QNACOM WHERE QCNO = ? OR PARENTNO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qcno);
			pstmt.setInt(2, qcno);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

	public int selectReplyGroupNo(Connection conn, int qcno) {
		String sql = "SELECT ORDERNO FROM QNACOM WHERE QCNO = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int orderNo = 0;
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qcno);
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

	public int selectReplyParentNo(Connection conn, int qcno) {
		String sql = "SELECT PARENTNO FROM QNACOM WHERE QCNO = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int parentNo = 0;
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qcno);
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
		String sql = "UPDATE QNACOM\r\n" + 
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
		return result;
	}

	public int updateComment(Connection conn, int qcno, String qComment) {
		String sql = "UPDATE QNACOM\r\n" + 
				"SET QCOMMENT = ?, QDATE = SYSDATE\r\n" + 
				"WHERE QCNO = ?";
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qComment);
			pstmt.setInt(2, qcno);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

	public int updateQnaAnswer(Connection conn, int qid, boolean answer) {	
		//true:관리자가 답변을 달았을 경우
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "";
		if(answer) {
			sql = "UPDATE QNA\r\n" + 
					"SET ANSWER = 'Y'\r\n" + 
					"WHERE QID = ?";
		}
		else {
			sql = "UPDATE QNA\r\n" + 
					"SET ANSWER = 'N'\r\n" + 
					"WHERE QID = ?";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qid);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}
}




















