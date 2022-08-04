package com.smhrd.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tbl_account_applicantDAO {
	
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int updateState(BigDecimal num){  //복붙하면됨이제.
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		int cnt =0;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			cnt=sqlSession.update("com.smhrd.model.tbl_account_applicantDAO.updateState",num); //왜 0줄이 나오?
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
		BigDecimal board_seq =new BigDecimal(num);
		tbl_account_applicant vo = new tbl_account_applicant(id,board_seq);
//		tbl_account_applicant vo = new tbl_account_applicant(id,"I",board_seq);
		tbl_account_applicant result = null;
		try {
			//여기가 문제다
			result = sqlSession.selectOne("com.smhrd.model.tbl_account_applicantDAO.selectOnePar2",vo);
			System.out.println("dao tbl_account_applicant selectOnePar2 후 BUY_PAY >>" +vo.getBOARD_SEQ()+", "+result.getID_PAY());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	public List<tbl_account_applicant> selectOneI(String loginMember) { 
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<tbl_account_applicant> result =null;

		try {
			result = sqlSession.selectList("com.smhrd.model.tbl_account_applicantDAO.SelectOneI",loginMember);
			System.out.println("I 게시글 크기 >>" +result.size());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	
	}
}
