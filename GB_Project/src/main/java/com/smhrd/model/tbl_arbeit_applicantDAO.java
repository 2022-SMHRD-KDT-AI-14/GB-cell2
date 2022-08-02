package com.smhrd.model;

import java.math.BigDecimal;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tbl_arbeit_applicantDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	
	public int insertArbeitApplicant(tbl_arbeit_applicant vo){ // 참여결정시 추가~
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			cnt = sqlSession.insert("com.smhrd.model.tbl_arbeit_applicantDAO.insertArbeitApplicant", vo);
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
	
	public tbl_arbeit_applicant selectOnePar2(String id,int num) { 
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BigDecimal board_seq =new BigDecimal(num);
		tbl_arbeit_applicant vo = new tbl_arbeit_applicant(id, board_seq);
		System.out.println("tbl_arbeit_applicantDAO.selectOnePar2 진입했어");
		System.out.println("vo id >> "+vo.getMEM_ID());
		System.out.println("vo board_seq >> "+vo.getBOARD_SEQ());
		tbl_arbeit_applicant result = null;
		try {
			
			System.out.println("dao tbl_arbeit_applicant selectOnePar2 BOARD_SEQ >>" +vo.getBOARD_SEQ());
			result = sqlSession.selectOne("com.smhrd.model.tbl_arbeit_applicantDAO.selectOnePar2",vo);
			System.out.println("dao tbl_arbeit_applicant selectOnePar2 ARBEIT_PAY >>" +vo.getARBEIT_PAY());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
}
