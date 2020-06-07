package product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import common.Attachment;
import common.HaemukjaFileRenamePolicy;
import member.model.vo.Seller;
import product.model.service.ProductService;
import product.model.vo.Product;
import product.model.vo.Sale;

/**
 * Servlet implementation class UpdateSaleServlet
 */
@WebServlet("/update.sa")
public class UpdateSaleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSaleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService ps = new ProductService();
		
		String id = ((Seller)(request.getSession().getAttribute("loginSeller"))).getSid();
	
		int maxSize = 1024 * 1024 * 10;
		
		String root = request.getSession().getServletContext().getRealPath("/");
		
		String savePath = root + "uploadFiles/";
		
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize,
											"UTF-8", new HaemukjaFileRenamePolicy());
		
		ArrayList<String> saveFiles = new ArrayList<>();
		
		Enumeration<String> files = multiRequest.getFileNames();
		while(files.hasMoreElements()) {
			String name = files.nextElement();
			
			if(multiRequest.getFilesystemName(name) != null) {
				saveFiles.add(multiRequest.getFilesystemName(name));
			}
		}
				
		int sbNo = 0;
		try {
			String saleBoardNo = multiRequest.getParameter("sbNo");
			sbNo = Integer.parseInt(saleBoardNo);	
		} catch(NumberFormatException e) {
			e.getStackTrace();
		}
		
		String title = multiRequest.getParameter("title");
		String content = multiRequest.getParameter("content");
		
		Sale sale = ps.selectSale(sbNo);
				
		int pId = sale.getpId();
		Product p = ps.selectProduct(pId);
		
		
		int result = 0;
		String sellerId = "";
		if(p.getsId() != null) {
			sellerId = p.getsId();
		}
		
		if(sellerId.equals(id)) {
			Sale s = new Sale();
			s.setpId(pId);
			s.setSbTitle(title);
			s.setSbContent(content);
			s.setSbKind(p.getpCode());
			s.setsId(p.getsId());
			s.setSbNo(sbNo);
			
			ArrayList<Attachment> fileList = new ArrayList<>();
			for(int i = saveFiles.size() - 1; i >= 0; i--) {
				Attachment at = new Attachment();
				
				at.setFileName(saveFiles.get(i));
				at.setFilePath(savePath);
				
				if(i == saveFiles.size() - 1) {
					at.setLevel(0);
				} else {
					at.setLevel(1);
				}
				
				fileList.add(at);
			}
			
			result = ps.updateSale(s, fileList);
		}
		
		RequestDispatcher view = null;
		if(result > 0) {
			view = request.getRequestDispatcher("seller/sellerPageExplain.jsp");
		} else {
			// errorPage
			for(int i = 0; i < saveFiles.size(); i++) {
				File failedFile = new File(savePath + saveFiles.get(i));
				failedFile.delete();				
			}
		}
		
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
