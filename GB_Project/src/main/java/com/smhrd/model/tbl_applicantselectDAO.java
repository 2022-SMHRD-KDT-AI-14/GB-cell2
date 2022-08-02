package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tbl_applicantselectDAO {
		
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	
	public String selectB(tbl_applicantselect vo){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String cnt = null;
		try {
			// 실행
			cnt = sqlSession.selectOne("com.smhrd.model.tbl_applicantselectDAO.selectB",vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
		
	}
	
	public String selectA(tbl_applicantselect vo){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String cnt = null;
		try {
			// 실행
			cnt = sqlSession.selectOne("com.smhrd.model.tbl_applicantselectDAO.selectA",vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
		
	}
	
	public String selectI(tbl_applicantselect vo){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String cnt = null;
		try {
			// 실행
			cnt = sqlSession.selectOne("com.smhrd.model.tbl_applicantselectDAO.selectI",vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
		
	}
	
	public String selectF(tbl_applicantselect vo){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String cnt = null;
		try {
			// 실행
			cnt = sqlSession.selectOne("com.smhrd.model.tbl_applicantselectDAO.selectF",vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
		
	}
	
}
