package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import member.model.vo.Seller;

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

		String id = new MemberDao().findId(conn, name, email);

		System.out.println("Service���� id : " + id);

		close(conn);

		return id;
	}

	public int findPwd(String id, String name, String email) {
		Connection conn = getConnection();
		MemberDao md = new MemberDao();
		int selectResult = 0;
		int updateResult = 0;
		selectResult = md.findPwd(conn, id, name, email);

		if (selectResult > 0) {
			updateResult = md.updatePwd(conn, id);

			if (updateResult > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			return -1;
		}
		close(conn);
		return updateResult;
	}

	public String selectPwd(String id) {
		Connection conn = getConnection();
		String pwd = new MemberDao().selectPwd(conn, id);
		close(conn);
		return pwd;
	}

	public void sendEmail(String email, String changedPwd) {
		String host = "smtp.naver.com";
		String user = "kobumssh@naver.com";
		String password = "rhqjatjrWkd";
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			message.setSubject("귀하의 임시 비밀번호가 전송되었습니다. -해먹자");
			message.setText("회원님의 임시 비밀번호는 " + changedPwd + " 입니다.");
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public int selectPid(String ptitle) {
		Connection conn = getConnection();

		int pid = new MemberDao().selectPid(conn, ptitle);
		close(conn);
		return pid;
	}

	public int oIdInsert(int allPrice) {
		Connection conn = getConnection();
		int result = new MemberDao().oIdInsert(conn, allPrice);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public int insertMember(Member member) {
		Connection conn = getConnection();

		int result = new MemberDao().insertMember(conn, member);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		return result;
	}

	public int insertMember(Seller seller) {
		Connection conn = getConnection();

		int result = new MemberDao().insertMember(conn, seller);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		return result;
	}

	public int updateMember(String mpw, String mtel, String email, String mnickname, String mid) {
		Connection conn = getConnection();

		int result = new MemberDao().updateMember(conn, mpw, mtel, email, mnickname, mid);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;

	}

	public int selectOid() {
		Connection conn = getConnection();
		int oid = new MemberDao().selectOid(conn);
		close(conn);
		return oid;
	}

	public int memOrder(int oid, String payment, String count, String userId, Integer pid) {
		Connection conn = getConnection();
		int result = new MemberDao().memOrder(conn, oid, payment, count, userId, pid);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updatePoint(int resultPoint, String userId) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePoint(conn, resultPoint, userId);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteCart(String cid) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteCart(conn, cid);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteMember(String mid) {

		Connection conn = getConnection();

		int result = new MemberDao().deleteMember(conn, mid);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		return result;
	}

	public int nMemOrder2(int oid, int payment, String count, int pid, int osid) {
		Connection conn = getConnection();
		int result = new MemberDao().nMemOrder2(conn, oid, payment, count, pid, osid);
		if (result > 0) {
			commit(conn);
		} else {
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
