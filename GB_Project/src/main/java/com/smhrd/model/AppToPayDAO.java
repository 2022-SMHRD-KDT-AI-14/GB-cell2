package com.smhrd.model;

import java.math.BigDecimal;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class AppToPayDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	public int updateAppToPay(AppToPay vo){  //복붙하면됨이제.
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		int cnt =0;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			cnt=sqlSession.update("com.smhrd.model.AppToPayDAO.updateAppToPay", vo); //왜 0줄이 나오?
			
			
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
