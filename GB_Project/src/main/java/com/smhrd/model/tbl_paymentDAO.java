package com.smhrd.model;

import java.math.BigDecimal;

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
			 vo= sqlSession.selectOne("com.smhrd.model.tbl_paymentDAO.selectPayment",id);
			 System.out.println("dao, selectPayment");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return vo;
	}
	
	public tbl_payment selectPaymentTF(int num) { 
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		BigDecimal board_seq = new BigDecimal(num);
		tbl_payment vo= null;
		
		try {
			 vo= sqlSession.selectOne("com.smhrd.model.tbl_paymentDAO.selectPaymentTF",board_seq);
			 System.out.println("dao, selectPaymentTF");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return vo;
	}

}
