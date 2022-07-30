package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MyPageMemareaDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	
	public int updateMyPageMemarea(MyPageMemarea vo) {
		SqlSession sqlSession =sqlSessionFactory.openSession();
		int cnt=0;
		try {
			 cnt =sqlSession.update("com.smhrd.model.MyPageMemareaDAO.updateMyPageMemarea",vo);
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
	
	public String selectMyPageMemarea(String id) {
		SqlSession sqlSession =sqlSessionFactory.openSession();
		String cnt = null;
	
	try {
		cnt = sqlSession.selectOne("com.smhrd.model.MyPageMemareaDAO.selectMyPageMemarea",id);
		// select - commit/rollback 생략
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	
	return cnt;
	}
}
