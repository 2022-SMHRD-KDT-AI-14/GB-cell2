package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ChattingDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	public int updatechat(int chatnum){
		int cnt = 0;
		try {
			// 실행
			cnt = sqlSession.update("com.smhrd.model.ChattingDAO.updatechat", chatnum);
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
	
	public int selectchat(int num) {
		int vo=0;
	
	try {
		vo = sqlSession.selectOne("com.smhrd.model.ChattingDAO.selectchat",num);
		// select - commit/rollback 생략
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	return vo;
}
}