package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class myPagePWDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	public int updateMyPagePW(myPagePW vo) {
		SqlSession sqlSession =sqlSessionFactory.openSession();
		int cnt=0;
		try {
			 cnt =sqlSession.update("com.smhrd.model.myPagePWDAO.updateMyPagePW",vo);
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
