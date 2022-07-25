package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	
	public Member selectMember(Member vo) {
		Member loginMember= null;
		
		try {
			loginMember = sqlSession.selectOne("com.smhrd.model.MemberDAO.selectMember",vo);
			// select - commit/rollback 생략
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return loginMember;
	}
	
}
