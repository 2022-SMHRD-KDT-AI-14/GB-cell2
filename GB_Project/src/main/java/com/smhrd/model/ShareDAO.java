package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ShareDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<Share> selectAllMyList(String loginMember){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Share> list =null;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			list=sqlSession.selectList("com.smhrd.model.ShareDAO.selectAllMyList",loginMember); 
			System.out.println("등록글: "+list.size());
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
			System.out.println("참여글: "+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	
	
	public String selectWriter(int board_seq){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String writer =null;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			writer=sqlSession.selectOne("com.smhrd.model.ShareDAO.selectWriter",board_seq); 
			System.out.println("selectWriter, dao의 writer >> : "+writer);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return writer;
	}
	
	public int updateState(ShareForUpdate vo){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt =0;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			cnt=sqlSession.update("com.smhrd.model.ShareDAO.updateState", vo); //왜 0줄이 나오?
			System.out.println("dao, UpdateState cnt >> "+cnt);
			
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
