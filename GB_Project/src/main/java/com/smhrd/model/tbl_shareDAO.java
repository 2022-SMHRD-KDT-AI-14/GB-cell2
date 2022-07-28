package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tbl_shareDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	
	
	
	public List<tbl_share> selectAllList() {
		List<tbl_share> list =null;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			list=sqlSession.selectList("com.smhrd.model.BoardDAO.selectAllList"); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	
	public List<tbl_share> selectAllListPage(int num) {
		List<tbl_share> list =null;
		try {
			list=sqlSession.selectList("com.smhrd.model.tbl_shareDAO.selectAllListPage",num); 

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	public int insertShareBuyBoard(tbl_share tbl_share){
		int cnt = 0;
		try {
			// 실행
			cnt = sqlSession.insert("com.smhrd.model.tbl_shareDAO.insertShareBuyBoard", tbl_share);
			if (cnt > 0) {
				sqlSession.commit(); // DML이지만 여기서는 커밋사용함.
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
		
	}
	
	public int insertShareArbeitBoard(tbl_share tbl_share){
		int cnt = 0;
		try {
			// 실행
			cnt = sqlSession.insert("com.smhrd.model.tbl_shareDAO.insertShareArbeitBoard", tbl_share);
			if (cnt > 0) {
				sqlSession.commit(); // DML이지만 여기서는 커밋사용함.
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
		
	}
	
	public int insertShareFreeBoard(tbl_share tbl_share){
		int cnt = 0;
		try {
			// 실행
			cnt = sqlSession.insert("com.smhrd.model.tbl_shareDAO.insertShareFreeBoard", tbl_share);
			if (cnt > 0) {
				sqlSession.commit(); // DML이지만 여기서는 커밋사용함.
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
		
	}
	
	public int insertShareAccountBoard(tbl_share tbl_share){
		int cnt = 0;
		try {
			// 실행
			cnt = sqlSession.insert("com.smhrd.model.tbl_shareDAO.insertShareAccountBoard", tbl_share);
			if (cnt > 0) {
				sqlSession.commit(); // DML이지만 여기서는 커밋사용함.
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
		
	}

	
}
