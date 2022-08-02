package com.smhrd.model;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tbl_coordinateDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	public int insertcoordinate(String id){
		int cnt = 0;
		try {
			// 실행
			cnt = sqlSession.insert("com.smhrd.model.tbl_coordinateDAO.insertcoordinate", id);
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
	
	public int updatecoordinate(tbl_coordinate vo){
		int cnt = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			// 실행
			cnt = sqlSession.update("com.smhrd.model.tbl_coordinateDAO.updatecoordinate", vo);
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
	
	
	
	
	public List<tbl_coordinate> selectAllList() {
		List<tbl_coordinate> list =null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			list = sqlSession.selectList("com.smhrd.model.tbl_coordinateDAO.selectAllList");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}
	

	public tbl_coordinate selectme(String MEM_ID) {
		tbl_coordinate vo= null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
	try {
		vo= sqlSession.selectOne("com.smhrd.model.tbl_coordinateDAO.selectme",MEM_ID);
		// select - commit/rollback 생략
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	
	return vo;
	}
	
	public List<tbl_share> selectlistshare(String MEM_ID) {
		List<tbl_share> vo= null;
		SqlSession sqlSession = sqlSessionFactory.openSession();
	
	try {
		vo= sqlSession.selectList("com.smhrd.model.tbl_coordinateDAO.selectlistshare",MEM_ID);
		// select - commit/rollback 생략
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	
	return vo;
	}
	
	
}
