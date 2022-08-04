package com.smhrd.model;

import java.math.BigDecimal;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class updateStatepDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int updateStatepA(BigDecimal num, String state){  //복붙하면됨이제.
		SqlSession sqlSession = sqlSessionFactory.openSession();
		tbl_arbeit_applicant vo = new tbl_arbeit_applicant(state,num);
		int cnt =0;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			cnt=sqlSession.update("com.smhrd.model.updateStatepDAO.updateStatepA", vo); //왜 0줄이 나오?
			System.out.println("dao, updateStatepA cnt >> "+cnt);
			
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
	
	public int updateStatepI(BigDecimal num, String state){  //복붙하면됨이제.
		SqlSession sqlSession = sqlSessionFactory.openSession();
		tbl_account_applicant vo = new tbl_account_applicant(state,num);
		System.out.println(state);
		int cnt =0;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			System.out.println("dao, updateStatepI num, state >> "+vo.getBOARD_SEQ()+" ," +vo.getACCOUNT_P_STATE());
			cnt=sqlSession.update("com.smhrd.model.updateStatepDAO.updateStatepI", vo); //왜 0줄이 나오?
			System.out.println("dao, updateStatepI cnt >> "+cnt);
			
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
	
	public int updateStatepB(BigDecimal num, String state){  //복붙하면됨이제.
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BuyApplicant vo = new BuyApplicant(num,state);
		int cnt =0;
		try {
			System.out.println(state);
			//모든정보를 가져오려고하므로 인자필요없음.
			cnt=sqlSession.update("com.smhrd.model.updateStatepDAO.updateStatepB", vo); //왜 0줄이 나오?
			System.out.println("dao, updateStatepB cnt >> "+cnt);
			
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
	
	public int updateStatepF(BigDecimal num, String state){  //복붙하면됨이제.
		SqlSession sqlSession = sqlSessionFactory.openSession();
		tbl_free_applicant vo = new tbl_free_applicant(state,num);
		int cnt =0;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			cnt=sqlSession.update("com.smhrd.model.updateStatepDAO.updateStatepF", vo); //왜 0줄이 나오?
			System.out.println("dao, updateStatepF cnt >> "+cnt);
			
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
	
	
	
	
	public int updateStatepAA(BigDecimal num){  //복붙하면됨이제.
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		int cnt =0;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			cnt=sqlSession.update("com.smhrd.model.updateStatepDAO.updateStatepAA", num); //왜 0줄이 나오?
			System.out.println("dao, updateStatepA cnt >> "+cnt);
			
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
	
	public int updateStatepII(BigDecimal num){  //복붙하면됨이제.
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		int cnt =0;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			
			cnt=sqlSession.update("com.smhrd.model.updateStatepDAO.updateStatepII", num); //왜 0줄이 나오?
			System.out.println("dao, updateStatepI cnt >> "+cnt);
			
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
	
	public int updateStatepBB(BigDecimal num){  //복붙하면됨이제.
		SqlSession sqlSession = sqlSessionFactory.openSession();
	
		int cnt =0;
		try {
			
			//모든정보를 가져오려고하므로 인자필요없음.
			cnt=sqlSession.update("com.smhrd.model.updateStatepDAO.updateStatepBB", num); //왜 0줄이 나오?
			System.out.println("dao, updateStatepB cnt >> "+cnt);
			
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
	
	public int updateStatepFF(BigDecimal num){  //복붙하면됨이제.
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		int cnt =0;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			cnt=sqlSession.update("com.smhrd.model.updateStatepDAO.updateStatepFF",num); //왜 0줄이 나오?
			System.out.println("dao, updateStatepF cnt >> "+cnt);
			
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
