package net.developia.restful.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> getBoardList() throws Exception {
		return boardDAO.getBoardList();
	}

	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		boardDAO.insertBoard(boardVO);
	}

	@Override
	public void insertArticle(ArticleVO articleVO) throws Exception {
		boardDAO.insertArticle(articleVO);
	}

	@Override
	public List<ArticleVO> getArticleList(int boa_no) throws Exception {
		return boardDAO.getArticleList(boa_no);
	}

	@Override
	public BoardVO getBoard(int boa_no) throws Exception {
		BoardVO boardVO = boardDAO.getBoard(boa_no);
		return null;
	}


	@Override
	public ArticleVO getArticle(long art_no) throws Exception {
		ArticleVO articleVO = boardDAO.getArticle(art_no);
		if (articleVO == null) {
			throw new RuntimeException(art_no + "번 글이 존재하지 않습니다.");
		}
		return articleVO;
		//return boardDAO.getArticle(art_no);
	}

	@Override
	public void updateReadcnt(long art_no) throws Exception {
		if (boardDAO.updateReadcnt(art_no) == 0) {
			throw new RuntimeException(art_no + "번 글이 존재하지 않습니다.");
		} 
		
	}

	@Override
	public void deleteArticle(ArticleVO articleVO) throws Exception {
		if (boardDAO.deleteArticle(articleVO) == 0) {
			throw new RuntimeException("존재하지 않거나 접근 권한이 없습니다.");
		}
		
	}

	@Override
	public void updateArticle(ArticleVO articleVO) throws Exception {
		if (boardDAO.updateArticle(articleVO) == 0) {
			throw new RuntimeException("존재하지 않거나 접근 권한이 없습니다.");
		}
		
	}
	

}
