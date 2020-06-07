package recipe.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import common.Attachment;
import recipe.model.dao.RecipeDao;
import recipe.model.vo.RComment;
import recipe.model.vo.Recipe;
import recipe.model.vo.Tag;

public class RecipeService {

	public int insertRecipe(Recipe r, String[] contentArr, ArrayList<Attachment> fileList, String[] tagArr) {
		Connection conn = getConnection();
		RecipeDao rd = new RecipeDao();
		
		int result1 = rd.insertRecipe(conn,r);
		int bNo = rd.selectBNo(conn, r);
		int result2 = rd.insertContent(conn, bNo, contentArr);
		int result3 = rd.insertAttachment(conn, fileList);
		int result4 = 0;
		int start = 0;
		for(int i = 1; i < fileList.size(); i++) {
			int aId = rd.selectAId(conn, fileList.get(i));
			for(int j = start; j < start+3; j++) {
				if(j % 3 == 0) {
					result4 += rd.insertTag(conn, aId, 0, tagArr[j]);
				} else if(j % 3 == 1) {
					result4 += rd.insertTag(conn, aId, 1, tagArr[j]);
				} else {
					result4 += rd.insertTag(conn, aId, 2, tagArr[j]);
				}
			}
			start += 3;
		}
		
		close(conn);
		
		return result1;
	}

	public Recipe selectRecipe(int bNo) {
		Connection conn = getConnection();
		
		RecipeDao rd = new RecipeDao();
		
		int result = rd.updateViews(conn, bNo);
		
		Recipe r = null;
		if(result > 0) {
			commit(conn);
			r = rd.selectRecipe(conn, bNo);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return r;
	}

	public ArrayList<Attachment> selectFiles(int bNo) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> files = new RecipeDao().selectFiles(conn, bNo);
		
		close(conn);
		
		return files;
	}

	public Attachment selectThumbnail(int bNo) {
		Connection conn = getConnection();
		
		Attachment thumbnail = new RecipeDao().selectThumbnail(conn, bNo);
		
		close(conn);
		
		return thumbnail;
	}

	public int selectBNo(Recipe r) {
		Connection conn = getConnection();
		
		int bNo = new RecipeDao().selectBNo(conn, r);
		
		close(conn);
		
		return bNo;
	}

	public int plusUp(int bNo) {
		Connection conn = getConnection();
		
		int result = new RecipeDao().plusUp(conn, bNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int plusDown(int bNo) {
		Connection conn = getConnection();
		
		int result = new RecipeDao().plusDown(conn, bNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public String selectMNickname(int bNo) {
		Connection conn = getConnection();
		
		String nickname = new RecipeDao().selectMNickname(conn, bNo);
		
		close(conn);
		
		return nickname;
	}

	public int getListCount(String nCode) {
		Connection conn = getConnection();
		
		int listCount = new RecipeDao().getListCount(conn, nCode);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Recipe> selectRList(int currentPage, int limit, String nCode) {
		Connection conn = getConnection();
		
		ArrayList<Recipe> rlist = new RecipeDao().selectRList(conn, currentPage, limit, nCode);
		
		close(conn);
		
		return rlist;
	}

	public int deleteRecipe(int bNo) {
		Connection conn = getConnection();
		RecipeDao rd = new RecipeDao();
		
		int result1 = 0;
		int result2 = 0;
		
		result1 = rd.deleteAttachment(conn, bNo);
		if(result1 > 0) {
			commit(conn);
			result2 = rd.deleteRecipe(conn, bNo);			
		} else {
			rollback(conn);
		}
		
		if(result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result2;
	}

	public ArrayList<RComment> selectComments(int bNo) {
		Connection conn = getConnection();
		ArrayList<RComment> comments = new RecipeDao().selectComments(conn, bNo);
		close(conn);
		return comments;
	}

	public ArrayList<RComment> insertComment(RComment rc) {
		Connection conn = getConnection();
		RecipeDao rd = new RecipeDao();
		int result = new RecipeDao().insertComment(conn, rc);
		ArrayList<RComment> list = new ArrayList<RComment>();
		if(result > 0) {
			commit(conn);
			list = rd.selectComments(conn, rc.getbNo());
		} else {
			rollback(conn);
		}
		close(conn);
		return list;
	}

	public ArrayList<Recipe> selectRList() {
		Connection conn = getConnection();
		
		ArrayList<Recipe> rlist = new RecipeDao().selectRList(conn);
		
		close(conn);
		
		return rlist;
	}
	
	public int getListCount(String recipeSearchOption, String recipeSearchContent) {
		Connection conn = getConnection();
		int listCount = new RecipeDao().getListCount(conn, recipeSearchOption, recipeSearchContent);
		close(conn);
		return listCount;
	}

	public ArrayList<Recipe> selectRList(int currentPage, int limit, String recipeSearchOption,
			String recipeSearchContent) {
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectRList(currentPage, limit, recipeSearchOption, conn, recipeSearchContent);
		close(conn);
		return list;
	}
	
	public ArrayList<String> selectContents(int bNo) {
		Connection conn = getConnection();
		
		ArrayList<String> contents = new RecipeDao().selectContents(conn, bNo);
		
		close(conn);
		
		return contents;
	}

	public ArrayList<Tag> selectTags(ArrayList<Attachment> files) {
		Connection conn = getConnection();
		
		ArrayList<Tag> tags = new RecipeDao().selectTags(conn, files);
		
		close(conn);
		
		return tags;
	}

}














