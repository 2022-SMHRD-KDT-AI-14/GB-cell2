package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tbl_paymentDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	

	public int insertPayment(String id){ 	//1. 회원가입시 자동으로 지불테이블 생성
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			cnt = sqlSession.insert("com.smhrd.model.tbl_paymentDAO.insertPayment", id);
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
	
	
	
	
	public tbl_payment selectPayment(String id) { 
		SqlSession sqlSession = sqlSessionFactory.openSession();
		tbl_payment vo= null;
		
		try {
			 vo= sqlSession.selectOne("com.smhrd.model.tbl_paymentDAO.selectPayment",vo);
			 System.out.println("dao, selectPayment");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return vo;
	}
	
	
	
	//2. 멤버ID 지불의 멤버ID > N이면

}
