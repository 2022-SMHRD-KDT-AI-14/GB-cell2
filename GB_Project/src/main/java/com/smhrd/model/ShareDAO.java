package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ShareDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	SqlSession sqlSession = sqlSessionFactory.openSession();
	public List<Share> selectAllMyList(String loginMember){
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
	
	
	
	public List<Share> selectAllMyAlramList(String loginMember){

		List<Share> list =null;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			list=sqlSession.selectList("com.smhrd.model.ShareDAO.selectAllMyAlramList",loginMember); 
			System.out.println("dao,selectAllMyAlramList의 사이즈 "+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	
	
	public List<Share> selectAllMyParListB(String loginMember){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Share> list =null;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			list=sqlSession.selectList("com.smhrd.model.ShareDAO.selectAllMyParListB",loginMember); 
			System.out.println("참여글: "+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	public List<Share> selectAllMyParListA(String loginMember){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Share> list =null;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			list=sqlSession.selectList("com.smhrd.model.ShareDAO.selectAllMyParListA",loginMember); 
			System.out.println("참여글: "+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	public List<Share> selectAllMyParListI(String loginMember){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Share> list =null;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			list=sqlSession.selectList("com.smhrd.model.ShareDAO.selectAllMyParListI",loginMember); 
			System.out.println("참여글: "+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	public List<Share> selectAllMyParListF(String loginMember){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Share> list =null;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			list=sqlSession.selectList("com.smhrd.model.ShareDAO.selectAllMyParListF",loginMember); 
			System.out.println("참여글: "+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	
	
	public Share selectOne(int board_seq){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Share result =null;
		try {
			//모든정보를 가져오려고하므로 인자필요없음.
			result=sqlSession.selectOne("com.smhrd.model.ShareDAO.selectOne",board_seq); 
			//System.out.println("selectWriter, dao의 writer >> : "+result.getMem_id());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
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
