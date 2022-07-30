package com.smhrd.model;

import java.math.BigDecimal;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class shareDeleteConDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession =sqlSessionFactory.openSession();
	
	
	public int shareDeleteCon(BigDecimal BOARD_SEQ) {
		int cnt=0;
		try {
			 cnt =sqlSession.update("com.smhrd.model.shareDeleteConDAO.shareDeleteCon",BOARD_SEQ);
			if(cnt>0) {
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return cnt;
	}
}
