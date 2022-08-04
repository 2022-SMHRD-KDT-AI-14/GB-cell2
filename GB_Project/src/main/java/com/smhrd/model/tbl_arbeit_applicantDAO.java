package com.smhrd.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tbl_arbeit_applicantDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int updateState(BigDecimal num){  //복붙하면됨이제.
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		int cnt =0;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			cnt=sqlSession.update("com.smhrd.model.tbl_arbeit_applicantDAO.updateState",num); //왜 0줄이 나오?
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
		tbl_arbeit_applicant result = null;
		try {
			result = sqlSession.selectOne("com.smhrd.model.tbl_arbeit_applicantDAO.selectOnePar2",vo);
			System.out.println("dao tbl_arbeit_applicant selectOnePar2 ARBEIT_PAY >>"+result.getBOARD_SEQ()+", "+result.getARBEIT_PAY());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	
	public List<tbl_arbeit_applicant> selectOneA(String loginMember) { 
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<tbl_arbeit_applicant> result =null;

		try {
			result = sqlSession.selectList("com.smhrd.model.tbl_arbeit_applicantDAO.SelectOneA",loginMember);
			System.out.println("A 게시글 크기 >>" +result.size());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	
	}
}
