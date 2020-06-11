package member.model.service;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import member.model.vo.Seller;

import static common.JDBCTemplate.*;

public class MemberService {
	
	public Member loginMember(Member member) {
		Connection conn = getConnection();
		
	    Member loginMember = new MemberDao().loginMember(conn, member);

	    close(conn);
	    
	    return loginMember;
	}

	public Seller loginSeller(Seller seller) {
		Connection conn = getConnection();
	    
		Seller loginSeller = new MemberDao().loginSeller(conn, seller);
	    
		close(conn);
	    
		return loginSeller;
	}
	
	public String findId(String name, String email) {
		Connection conn = getConnection();
		
		String id = new MemberDao().findId(conn,name,email);

		System.out.println("Service���� id : " + id);
		
		close(conn);
		
		return id;
	}

	public String findPwd(String id, String name, String email) {
		Connection conn = getConnection();
		
		MemberDao mDao = new MemberDao();
		
		int result = mDao.findPwd(conn,id,name,email);
		
		String changePwd = mDao.selectPwd(conn,id,name,email);

		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return changePwd;
	}



	public int selectPid(String ptitle) {
		Connection conn = getConnection();

		int pid = new MemberDao().selectPid(conn,ptitle);
		close(conn);
		return pid;
	}

	public int oIdInsert(int allPrice) {
		Connection conn = getConnection();
		int result = new MemberDao().oIdInsert(conn, allPrice);

		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int insertMember(Member member) {
        Connection conn = getConnection();
        
        int result = new MemberDao().insertMember(conn, member);
        
        if(result > 0) {
        	commit(conn);
        }else {
        	rollback(conn);
        }
		
		return result;
	}
	
	public int insertMember(Seller seller) {
		 Connection conn = getConnection();
	        
	        int result = new MemberDao().insertMember(conn, seller);
	        
	        if(result > 0) {
	        	commit(conn);
	        }else {
	        	rollback(conn);
	        }
			
			return result;
	}
	
	public int updateMember(String mpw, String mtel, String email, String mnickname, String mid) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, mpw, mtel, email, mnickname, mid);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	public int selectOid() {
		Connection conn =getConnection();
		int oid = new MemberDao().selectOid(conn);
		close(conn);
		return oid;
	}

	public int memOrder(int oid, String payment, String count, String userId, Integer pid) {
		Connection conn = getConnection();
		int result = new MemberDao().memOrder(conn,oid,payment,count,userId,pid);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updatePoint(int resultPoint, String userId) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePoint(conn,resultPoint,userId);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteCart(String cid) {
		Connection conn = getConnection();
		int result= new MemberDao().deleteCart(conn,cid);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteMember(String mid) {
		
		Connection conn =getConnection();
		
		int result = new MemberDao().deleteMember(conn, mid);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		  
		return result;
	}

	

	public int nMemOrder2(int oid, int payment, String count, int pid, int osid) {
		Connection conn = getConnection();
		int result = new MemberDao().nMemOrder2(conn,oid,payment,count,pid,osid);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int checkMemberId(int joinType, String userId) {
		Connection conn = getConnection();
		int result = new MemberDao().checkMemberId(conn, joinType, userId);
		close(conn);
		return result;
	}

	
}
