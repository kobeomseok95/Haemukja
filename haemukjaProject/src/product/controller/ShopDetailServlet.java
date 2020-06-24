package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Attachment;
import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.Review;
import product.model.vo.SComment;
import product.model.vo.Sale;

/**
 * Servlet implementation class ShopDetailServlet
 */
@WebServlet("/detail.sh")
public class ShopDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ProductService ps = new ProductService();

		int sbNo = Integer.valueOf(request.getParameter("sbno"));
		int pId = ps.selectPid(sbNo);
		
		Sale sale = ps.selectSale2(pId);	// 게시글 정보
		Product p = ps.selectProduct(pId);	// 상품정보
		
		Attachment thumbnail = ps.selectThumbnail(sbNo); //썸네일
		
		ArrayList<Attachment> detailList = ps.selectFileDetail(sbNo); // 디테일사진
		
		ArrayList<Review> review = ps.getReview(sbNo);
		
		String company = ps.selectCompany(sale.getsId(), sbNo);
		
		ArrayList<SComment> comment = ps.selectCommentList(sbNo);
		
		RequestDispatcher view = null;
		request.setAttribute("sale", sale);
		request.setAttribute("p", p);
		request.setAttribute("thumbnail", thumbnail);
		request.setAttribute("detailList", detailList);
		request.setAttribute("review", review);
		request.setAttribute("company", company);
		request.setAttribute("comment", comment);
		view = request.getRequestDispatcher("haemukshop/haemukshopDetail.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
