package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tbl_applicantDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	

	
	
	public int insertBuyBoardMember(tbl_buy_applicant vo){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			// 실행
			System.out.println("여기가?");
			cnt = sqlSession.insert("com.smhrd.model.tbl_applicantDAO.insertBuyBoardMember", vo);
			System.out.println("여기가 문제구만");
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
	
	public int insertAccountBoardMember(tbl_account_applicant vo){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			// 실행
			cnt = sqlSession.insert("com.smhrd.model.tbl_applicantDAO.insertAccountBoardMember", vo);
			System.out.println("작성자 글등록시 참여자 자동등록여부 확인! tbl_applicantDAO, cnt >> "+cnt);
			if (cnt > 0) {
				sqlSession.commit(); // DML이지만 여기서는 커밋사용함.
				System.out.println("진짜? 작성자 글등록시 참여자 자동등록여부 확인! tbl_applicantDAO, cnt >> "+cnt);
			} else {
				sqlSession.rollback();
				System.out.println("롤백.., cnt >> "+cnt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;  
		
	}
	
	public int insertFreeBoardMember(tbl_free_applicant vo){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			// 실행
			cnt = sqlSession.insert("com.smhrd.model.tbl_applicantDAO.insertFreeBoardMember", vo);
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
	
	public int insertArbeitBoardMember(tbl_arbeit_applicant tbl_account_applicant){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			// 실행
			cnt = sqlSession.insert("com.smhrd.model.tbl_applicantDAO.insertArbeitBoardMember", tbl_account_applicant);
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
	
}
