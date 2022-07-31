package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class BuyApplicantDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	
	
	
	public int insertBuyApplicant(BuyApplicant vo){ //회원가입 메소드
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			cnt = sqlSession.insert("com.smhrd.model.BuyApplicantDAO.insertBuyApplicant", vo);
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
	
	public int SelectBuyApplicantCNT(int board_seq) { //로그인 메소드
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt =0;
		
		try {
			cnt = sqlSession.selectOne("com.smhrd.model.BuyApplicantDAO.SelectBuyApplicantCNT",board_seq);
			System.out.println("BuyApplicantDAO, cnt >>" +cnt);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return cnt;
	}
	
	public BuyApplicant selectOne(int board_seq) { 
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BuyApplicant vo =null;

		try {
			vo = sqlSession.selectOne("com.smhrd.model.BuyApplicantDAO.SelectOne",board_seq);
			System.out.println("BuyApplicant selectOne >>" +vo.getBuy_pay());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return vo;
	}
	
	public BuyApplicant selectOnePar(String id,int num) { 
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BigDecimal board_seq =new BigDecimal(num);
		BuyApplicant vo = new BuyApplicant(id, board_seq);
		BuyApplicant result = null;
		try {
			result = sqlSession.selectOne("com.smhrd.model.BuyApplicantDAO.selectOnePar",vo);
			System.out.println("BuyApplicant selectOnePar >>" +vo.getBuy_pay());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
}
