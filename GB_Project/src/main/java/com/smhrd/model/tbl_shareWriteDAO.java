package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tbl_shareWriteDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	public tbl_buy_applicant selectBuyOne(int num) {
		tbl_buy_applicant vo= null;
	
	try {
		vo = sqlSession.selectOne("com.smhrd.model.tbl_shareWriteDAO.selectBuyOne",num);
		// select - commit/rollback 생략
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	
	return vo;
	}
	
	public tbl_arbeit_applicant selectArbeitOne(int num) {
		tbl_arbeit_applicant vo= null;
	
	try {
		vo = sqlSession.selectOne("com.smhrd.model.tbl_shareWriteDAO.selectArbeitOne",num);
		// select - commit/rollback 생략
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	
	return vo;
	}
	
	public tbl_account_applicant selectAccountOne(int num) {
		tbl_account_applicant vo= null;
	
	try {
		vo = sqlSession.selectOne("com.smhrd.model.tbl_shareWriteDAO.selectAccountOne",num);
		// select - commit/rollback 생략
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	
	return vo;
	}
	
	public tbl_free_applicant selectFreeOne(int num) {
		tbl_free_applicant vo= null;
	
	try {
		vo = sqlSession.selectOne("com.smhrd.model.tbl_shareWriteDAO.selectFreeOne",num);
		// select - commit/rollback 생략
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	
	return vo;
	}
	
	
	
}
