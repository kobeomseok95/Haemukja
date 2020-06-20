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

	public int getListCount(String searchOption, String searchContent) {
		Connection conn = getConnection();
		int listCount = 0;
		
		if(!searchContent.equals("")) {
			listCount = new RecipeDao().getListCount(conn, searchOption, searchContent);			
		}
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Recipe> selectRList(int currentPage, int limit, String searchOption, String searchContent) {
		Connection conn = getConnection();
		ArrayList<Recipe> rlist = new ArrayList<>();
		
		if(!searchContent.equals("")) {
			rlist = new RecipeDao().selectRList(conn, currentPage, limit, searchOption, searchContent);			
		}
		
		close(conn);
		
		return rlist;
	}

	public int updateRecipe(int bNo, String title, String[] contentArr, ArrayList<Attachment> fileList, ArrayList<String> tlist,
			ArrayList<String> talist, ArrayList<String> alist) {
		
		Connection conn = getConnection();
		RecipeDao rd = new RecipeDao();
		
		int result1 = 0;										// 제목 수정한 결과
		if(!title.equals("")) {
			result1 = rd.updateRecipe(conn,bNo,title);			
		}
		
		int result2 = rd.deleteContent(conn, bNo);				// 게시글 내용 전부 삭제한 결과
		int result3 = 0;										// 게시글 내용 다시 추가한 결과
		if(result2 > 0) {
			result3 = rd.insertContent(conn, bNo, contentArr);
		}
		
		int result4 = 0;										// 사진 수정한 결과
		
		int checkThumbnail = 9;									// checkThumbnail이 1일 경우 섬네일 포함(0일 경우 미포함)
		if(alist.size() > 0) {
			checkThumbnail = rd.selectFileLevel(conn, alist.get(0));			
		}
		
		int updateAtCount = 0;
		int insertAtCount = 0;
		int start = 0;
		if(fileList.size() > alist.size() && checkThumbnail == 1) {				// 섬네일 수정과 다른 사진 수정, 사진 추가가 동시에 일어난 경우
			// 섬네일 먼저 업데이트 하기
			updateAtCount += rd.updateAttachment(conn, alist.get(0), fileList.get(0).getFileName());
			
			for(int i = 1; i < fileList.size(); i++) {
				if(i < alist.size()) {
					updateAtCount += rd.updateAttachment(conn, alist.get(i), fileList.get(i).getFileName());
				} else {
					insertAtCount += rd.insertAttachment(conn, bNo, fileList.get(i));
				}
			}
			
		} else if(fileList.size() > alist.size() && checkThumbnail == 0) {		// 섬네일 수정 없이 다른 사진 수정, 사진 추가가 일어난 경우
			for(int i = 0; i < fileList.size(); i++) {
				if(i < alist.size()) {
					updateAtCount += rd.updateAttachment(conn, alist.get(i), fileList.get(i).getFileName());
				} else {
					insertAtCount += rd.insertAttachment(conn, bNo, fileList.get(i));
				}
			}
		} else if(fileList.size() == alist.size() && checkThumbnail == 1) {		// 섬네일 수정과 다른 사진 수정이 일어난 경우
			// 섬네일 먼저 업데이트 하기
			updateAtCount += rd.updateAttachment(conn, alist.get(0), fileList.get(0).getFileName());
			
			for(int i = 1; i < fileList.size(); i++) {
				updateAtCount += rd.updateAttachment(conn, alist.get(i), fileList.get(i).getFileName());
			}
		} else if(fileList.size() == alist.size() && checkThumbnail == 0){
			for(int i = 0; i < fileList.size(); i++) {							// 섬네일 수정 없이 다른 사진 수정만 일어난 경우
				updateAtCount += rd.updateAttachment(conn, alist.get(i), fileList.get(i).getFileName());
			}
		} else {																// 사진 추가만 일어난 경우
			for(int i = 0; i < fileList.size(); i++) {
				insertAtCount += rd.insertAttachment(conn, bNo, fileList.get(i));
			}
		}
		
		result4 = updateAtCount + insertAtCount;
		
		int result5 = rd.deleteTag(conn, fileList);				// 태그 삭제
		int result6 = 0;										// 태그 다시 추가한 결과
		if(!tlist.isEmpty()) {
			for(int i = 0; i < tlist.size(); i++) {
				int aId = Integer.parseInt(talist.get(i));
				
				int countTag = rd.getTagCount(conn, aId);
				
				if(countTag == 0) {
					result6 += rd.insertTag(conn, aId, 0, tlist.get(i));				
				} else if(countTag == 1) {
					result6 += rd.insertTag(conn, aId, 1, tlist.get(i));
				} else {
					result6 += rd.insertTag(conn, aId, 2, tlist.get(i));
				}
			}
		}
		
		if(result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result3;
	}

	public ArrayList<Tag> addPTitles(ArrayList<Tag> tags) {
		Connection conn = getConnection();
		
		ArrayList<Tag> tagsPTitles = new RecipeDao().addPTitles(conn, tags);
		
		close(conn);
		
		return tagsPTitles;
	}

}














