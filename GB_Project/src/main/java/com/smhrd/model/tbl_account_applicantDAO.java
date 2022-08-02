package com.smhrd.model;

import java.math.BigDecimal;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tbl_account_applicantDAO {
	
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int insertAccountApplicant(tbl_account_applicant vo){ // 참여결정시 추가~
	
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			cnt = sqlSession.insert("com.smhrd.model.tbl_account_applicantDAO.insertAccountApplicant", vo);
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
	
	public tbl_account_applicant selectOnePar2(String id,int num) { 
		SqlSession sqlSession = sqlSessionFactory.openSession();
		System.out.println("tbl_account_applicantDAO.selectOnePar2 진입했어");
		BigDecimal board_seq =new BigDecimal(num);
		tbl_account_applicant vo = new tbl_account_applicant(id, board_seq);
		tbl_account_applicant result = null;
		try {
			
			System.out.println("dao tbl_account_applicant selectOnePar2 BOARD_SEQ >>" +vo.getBOARD_SEQ());
			result = sqlSession.selectOne("com.smhrd.model.tbl_account_applicantDAO.selectOnePar2",vo);
			System.out.println("dao tbl_account_applicant selectOnePar2 BUY_PAY >>" +vo.getID_PAY());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	
	
	
}
