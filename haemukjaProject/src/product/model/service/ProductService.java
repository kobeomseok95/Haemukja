package product.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import common.Attachment;
import product.model.dao.ProductDao;
import product.model.vo.Order;
import product.model.vo.Product;
import product.model.vo.Review;
import product.model.vo.SComment;
import product.model.vo.Sale;
import qna.model.dao.QnaDao;

public class ProductService {

	public int insertProudct(ArrayList<Product> plist) {
		Connection conn = getConnection();
		
		int result = new ProductDao().insertProduct(conn, plist);
		
		if(result > 0 && result == plist.size()) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Product selectProduct(int pId) {
		Connection conn = getConnection();
		
		Product p = new ProductDao().selectProduct(conn, pId);
		
		close(conn);
		
		return p;
	}

	public int insertSale(Sale s, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		ProductDao pd = new ProductDao();
		
		int result1 = pd.insertSale(conn, s);
		int result2 = pd.insertAttachment(conn, fileList);
		
		if(result1 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1;
	}

	public Sale selectSale(int sbNo) {
		Connection conn = getConnection();
		
		Sale s = new ProductDao().selectSale(conn, sbNo);
		
		close(conn);
		
		return s;
	}

	public int updateSale(Sale s, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		ProductDao pd = new ProductDao();
		
		int result1 = pd.updateSale(conn, s.getSbNo(), s);
		int result2 = pd.deleteAttachment(conn, s.getSbNo());
		int result3 = pd.insertAttachment2(conn, fileList, s.getSbNo());
		
		if(result1 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1;
	}

	public Sale selectSale2(int pId) {
		Connection conn = getConnection();
		
		Sale s = new ProductDao().selectSale2(conn, pId);
		
		close(conn);
		
		return s;
	}

	public int getAllCount() {
		Connection conn = getConnection();
		
		int result = new ProductDao().getAllCount(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Sale> selectSList() {
		Connection conn = getConnection();
		
		ArrayList<Sale> slist = new ProductDao().selectSList(conn);
		
		close(conn);
		
		return slist;
	}

	public Attachment selectThumbnail(int sbNo) {
		Connection conn = getConnection();
		
		Attachment at = new ProductDao().selectThumbnail(conn, sbNo);
		
		close(conn);
		
		return at;
	}

	public ArrayList<Product> selectPlist(int currentPage, int limit, String sId) {
		Connection conn = getConnection();
		
		ArrayList<Product> plist = new ProductDao().selectPlist(conn, currentPage, limit, sId);
		
		close(conn);
		
		return plist;
	}

	public int updateProduct(int pId) {
		Connection conn = getConnection();
		ProductDao pd = new ProductDao();
		int result = 0;
		
		Product p = pd.selectProduct(conn, pId);
		
		if(p.getSoldout().equals("N")) {
			result = new ProductDao().updateProduct(conn, pId, 1);			
		} else {
			result = new ProductDao().updateProduct(conn, pId, 2);
		}
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteProduct(int pId) {
		Connection conn = getConnection();
		
		int result = new ProductDao().deleteProduct(conn, pId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int getListCount(String sId) {
		Connection conn = getConnection();
		
		int count = new ProductDao().getListCount(conn, sId);
		
		close(conn);
		
		return count;
	}

	public int getListCount2(String sId) {
		Connection conn = getConnection();
		
		int count = new ProductDao().getListCount2(conn, sId);
		
		close(conn);
		
		return count;
	}

	public ArrayList<Order> selectOlist(int currentPage, int limit, String sId) {
		Connection conn = getConnection();
		
		ArrayList<Order> olist = new ProductDao().selectOlist(conn, currentPage, limit, sId);
		
		close(conn);
		
		return olist;
	}

	public ArrayList<String> selectPtitles(ArrayList<Order> olist) {
		Connection conn = getConnection();
		
		ArrayList<String> pTitles = new ProductDao().selectPtitles(conn, olist);
		
		close(conn);
		
		return pTitles;
	}

	public int updateOrder(int oId, String shipCom, int shipNo) {
		Connection conn = getConnection();
		ProductDao pd = new ProductDao();
		
		int result = pd.updateOrder(conn, oId, shipCom, shipNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	public ArrayList<Attachment> selectFileDetail(int sbNo) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> detailList = new ProductDao().selectFileDetail(conn,sbNo);
		close(conn);
		
		return detailList;
	}

	public int cartInsert(String userId, int pid, String count) {
		Connection conn = getConnection();
		
		ProductDao pDao = new ProductDao();
		int mcart = pDao.selectMcart(conn,userId,pid);
	
		int result=0;

		if(mcart>0) {
			result=pDao.updateMcartCount(conn,userId,pid,count);
			
		}else {
			result = pDao.cartInsert(conn,userId,pid,count);
		
		}
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int selectPid(int sbNo) {
		Connection conn = getConnection();
		
		int pId = new ProductDao().selectPid(conn, sbNo);
		
		close(conn);
		
		return pId;
	}
	
	public ArrayList<Review> getReview(int sbNo) {
	      Connection conn = getConnection();
	      
	      ArrayList<Review> review = new ProductDao().getReview(conn,sbNo);
	      System.out.println("service 리뷰 :" + review);
	      close(conn);
	      
	      return review;
	}
	
	public int review(String odate, int sbno, String review, String userId) {
	      Connection conn = getConnection();
	      int result = new ProductDao().review(conn,odate,sbno,review,userId);
	      if(result > 0) {
	         commit(conn);
	      } else {
	         rollback(conn);
	      }
	      
	      close(conn);
	      
	      return result;
	 }

	public int getListSCount(String sbKind) {
		Connection conn = getConnection();
		
		int listCount =  new ProductDao().getListSCount(conn, sbKind);
		
		close(conn);
		
		return listCount;
		
	}

	public ArrayList<Sale> selectCaList(int currentPage, int limit, String sbKind) {
		Connection conn = getConnection();
		
		ArrayList<Sale> sList = new ProductDao().selectCaList(conn, currentPage, limit, sbKind);
		
		close(conn);
		
		return sList;
	}

	public String selectCompany(String sId, int sbNo) {
		Connection conn = getConnection();
		
		String company = new ProductDao().selectCompany(conn, sId, sbNo);
		
		return company;
	}

	public int refundProduct(int oId) {
		Connection conn = getConnection();
		
		int result = new ProductDao().refundProduct(conn, oId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int exchangeProduct(int oId) {
		Connection conn = getConnection();
		
		int result = new ProductDao().exchangeProduct(conn, oId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int deleteSale(int sbno) {
	      Connection conn = getConnection();
	      int result = new ProductDao().deleteSale(conn, sbno);
	      if(result > 0) {
	         commit(conn);
	      } else {
	         rollback(conn);
	      }
	      close(conn);
	      return result;
	 }

	public ArrayList<Sale> selectSList(String searchContent) {
		Connection conn = getConnection();
		
		ArrayList<Sale> slist = new ProductDao().selectSList(conn, searchContent);
		
		close(conn);
		
		return slist;
	}

	public Product selectProduct(String pId) {
		Connection conn = getConnection();
		
		Product p = new ProductDao().selectProduct(conn, pId);
		
		close(conn);
		
		return p;
	}

	public Attachment selectThumbnail(String sbNo) {
		Connection conn = getConnection();
		
		Attachment at = new ProductDao().selectThumbnail(conn, sbNo);
		
		close(conn);
		
		return at;
	}

	public ArrayList<SComment> selectCommentList(int sbNo) {
		Connection conn = getConnection();
		ArrayList<SComment> list = new ProductDao().selectCommentList(conn, sbNo);
		close(conn);
		return list;
	}

	public int insertComment(SComment sc) {
		Connection conn = getConnection();
		int result = new ProductDao().insertComment(conn, sc);
		close(conn);
		return result;
	}

	public int selectGroupNo(int scno) {
		Connection conn = getConnection();
		int groupNo = new ProductDao().selectGroupNo(conn, scno);
		close(conn);
		return groupNo;
	}

	public int deleteComment(int scno) {
		Connection conn = getConnection();
		int result= new ProductDao().deleteComment(conn, scno);
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateGroupNo(int groupNo) {
		Connection conn = getConnection();
		int result = new ProductDao().updateGroupNo(conn, groupNo);
		if(result >= 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int selectReplyOrderNo(int scno) {
		Connection conn = getConnection();
		int orderNo = new ProductDao().selectReplyOrderNo(conn, scno);
		close(conn);
		return orderNo;
	}

	public int selectReplyParentNo(int scno) {
		Connection conn = getConnection();
		int parentNo = new ProductDao().selectReplyParentNo(conn, scno);
		close(conn);
		return parentNo;
	}

	public int updateReplyOrderNo(int orderNo, int parentNo) {
		Connection conn = getConnection();
		int result = new ProductDao().updateReplyOrderNo(conn, orderNo, parentNo);
		if(result >= 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateComment(int scno, String sComment) {
		Connection conn = getConnection();
		int result = new ProductDao().updateComment(conn, scno, sComment);
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	

	

}
