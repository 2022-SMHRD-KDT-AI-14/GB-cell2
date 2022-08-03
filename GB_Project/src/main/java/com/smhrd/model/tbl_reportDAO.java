package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tbl_reportDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	public int insertreport(tbl_report vo){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			// 실행
			cnt = sqlSession.insert("com.smhrd.model.tbl_reportDAO.insertreport", vo);
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
	
	public List<tbl_report> selectAllListPage() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<tbl_report> list =null;
		try {
			list=sqlSession.selectList("com.smhrd.model.tbl_reportDAO.selectAllListPage"); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
}
