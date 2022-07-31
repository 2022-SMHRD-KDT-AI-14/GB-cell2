package com.smhrd.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tbl_paymentDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	

	public int insertPayment(String id){ 	//1. 회원가입시 자동으로 지불테이블 생성
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			cnt = sqlSession.insert("com.smhrd.model.tbl_paymentDAO.insertPayment", id);
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
	
	public int insertPaymentPar(tbl_payment vo){ 	//1. 회원가입시 자동으로 지불테이블 생성
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = 0;
		try {
			cnt = sqlSession.insert("com.smhrd.model.tbl_paymentDAO.insertPaymentPar", vo);
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
	
	

	
	
	public tbl_payment selectPayment(tbl_payment vo) { 
		SqlSession sqlSession = sqlSessionFactory.openSession();
		tbl_payment result= null;
		
		try {
			 vo= sqlSession.selectOne("com.smhrd.model.tbl_paymentDAO.selectPayment",vo);
			 System.out.println("dao, selectPayment");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	
	public tbl_payment selectPayment2(String MEM_ID, int intNum) { 
		BigDecimal BOARD_SEQ = new BigDecimal(intNum);
		tbl_payment vo = new tbl_payment(MEM_ID, BOARD_SEQ);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		tbl_payment result= null;
		
		try {
			System.out.println("dao, selectPayment2 vo mem_id >> " +vo.getMEM_ID());
			System.out.println("dao, selectPayment2 vo mem_bOARDSEQ>> " +vo.getBOARD_SEQ());
			 vo= sqlSession.selectOne("com.smhrd.model.tbl_paymentDAO.selectPayment2",vo);
			 System.out.println("dao, selectPayment2 vo mem_id >> " +vo.getMEM_ID());
			 System.out.println("dao, selectPayment2 vo PAY_TF >> " +vo.getPAY_TF());
			 System.out.println("dao, selectPayment2 재조함~");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	
	
	
	
	public int selectPaymentTFcnt(int board_seq) { //jsp가서 리스트 사이즈 고민하지말고 애초에 db에서 카운트한값을 뽑아내자!!!
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		int result=0;
		
		try {
				result= sqlSession.selectOne("com.smhrd.model.tbl_paymentDAO.selectPaymentTFcnt", board_seq);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	public List<tbl_payment> selectPaymentPar(int board_seq) { //jsp가서 리스트 사이즈 고민하지말고 애초에 db에서 카운트한값을 뽑아내자!!!
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<tbl_payment> list = null;
		
		try {
				list= sqlSession.selectList("com.smhrd.model.tbl_paymentDAO.selectPaymentPar", board_seq);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return list;
	}

}
