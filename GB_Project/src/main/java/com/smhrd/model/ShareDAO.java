package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ShareDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	//SqlSession sqlSession = sqlSessionFactory.openSession();
	
	public List<Share> selectAllMyList(String loginMember){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Share> list =null;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			list=sqlSession.selectList("com.smhrd.model.ShareDAO.selectAllMyList",loginMember); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	
	public List<Share> selectAllMyParList(String loginMember){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Share> list =null;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			list=sqlSession.selectList("com.smhrd.model.ShareDAO.selectAllMyParList",loginMember); 
			System.out.println("여기함수");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	
}
