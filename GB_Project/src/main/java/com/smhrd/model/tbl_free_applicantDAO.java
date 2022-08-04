package com.smhrd.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tbl_free_applicantDAO {
	
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int insertFreeApplicant(tbl_free_applicant vo){ // 참여결정시 추가~
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			cnt = sqlSession.insert("com.smhrd.model.tbl_free_applicantDAO.insertFreeApplicant", vo);
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
	
	
	public List<tbl_free_applicant> selectOneF(String loginMember) { 
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<tbl_free_applicant> result =null;

		try {
			result = sqlSession.selectList("com.smhrd.model.tbl_free_applicantDAO.SelectOneF",loginMember);
			System.out.println("F 게시글 크기 >>" +result.size());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	
	}
	
	
	
	public tbl_free_applicant selectOnePar2(String id,int num) { 
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BigDecimal board_seq =new BigDecimal(num);
		tbl_free_applicant vo = new tbl_free_applicant(id, board_seq);
		tbl_free_applicant result = null;
		try {
			result = sqlSession.selectOne("com.smhrd.model.tbl_free_applicantDAO.selectOnePar2",vo);
			System.out.println("dao tbl_free_applicant selectOnePar2 거래상황 >>"+result.getBOARD_SEQ()+", "+result.getFREE_P_STATE());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
}
