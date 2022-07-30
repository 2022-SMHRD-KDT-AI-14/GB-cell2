package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class shareDeleteConDAO {

	
	public int shareDeleteCon(int BOARD_SEQ) {
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession =sqlSessionFactory.openSession();
		
		int cnt=0;
		try {
			 cnt =sqlSession.update("com.smhrd.model.MyPageMemareaDAO.shareDeleteCon",BOARD_SEQ);
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
