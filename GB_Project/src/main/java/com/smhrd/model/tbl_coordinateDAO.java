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
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = 0;
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
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<tbl_coordinate> list =null;
		try {
			list = sqlSession.selectList("com.smhrd.model.tbl_coordinateDAO.selectAllList");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}
	

	public tbl_coordinate selectOneme(String id){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		tbl_coordinate vo= null;
	try {
		vo= sqlSession.selectOne("com.smhrd.model.tbl_coordinateDAO.selectOneme",id);
		// select - commit/rollback 생략
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	
	return vo;
	}
	
	public List<tbl_share> selectListshare(String MEM_ID) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<tbl_share> vo= null;
	
	try {
		vo= sqlSession.selectList("com.smhrd.model.tbl_coordinateDAO.selectListshare",MEM_ID);
		// select - commit/rollback 생략
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	
	return vo;
	}
	
	
}
