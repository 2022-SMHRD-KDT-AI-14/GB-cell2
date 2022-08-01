package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class BuyApplicantDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	
	public int updateState(BigDecimal num, String state){  //복붙하면됨이제.
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BuyApplicant vo = new BuyApplicant(num,state);
		int cnt =0;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			cnt=sqlSession.update("com.smhrd.model.BuyApplicantDAO.updateState", vo); //왜 0줄이 나오?
			System.out.println("dao, UpdateState cnt >> "+cnt);
			
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
	
	public int insertBuyApplicant(BuyApplicant vo){ // 참여결정시 추가~
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
			System.out.println("BuyApplicant selectOne dao 작성자? >>" +vo.getMem_id());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return vo;
	}
	
	public BuyApplicant selectOnePar(String id,int num) { 
		SqlSession sqlSession = sqlSessionFactory.openSession();
		System.out.println("진입했어?");
		BigDecimal board_seq =new BigDecimal(num);
		BuyApplicant vo = new BuyApplicant(id, board_seq);
		BuyApplicant result = null;
		try {
			
			System.out.println("BuyApplicant selectOnePar BOARD_SEQ >>" +vo.getBoard_seq());
			result = sqlSession.selectOne("com.smhrd.model.BuyApplicantDAO.selectOnePar",vo);
			System.out.println("BuyApplicant selectOnePar BUY_PAY >>" +vo.getBuy_pay());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
}
