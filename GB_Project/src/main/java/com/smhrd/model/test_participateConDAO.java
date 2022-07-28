package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class test_participateConDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	public String selectOneBoardnumber(int num) {		
		String vo = null;
	
	try {
		vo = sqlSession.selectOne("com.smhrd.model.test_participateConDAO.selectOneBoardnumber",num);
		// select - commit/rollback 생략
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	
	return vo;
	}
	
	
}


