package com.smhrd.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tbl_paymentDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int insertPayment(String id) { // 1. 회원가입시 자동으로 지불테이블 생성(게시글null)
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

	public int insertPaymentPar(tbl_payment vo) { // 1. 고객이 참석결정시 해당게시글의 지불테이블 생성
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

	public tbl_payment selectPayment(tbl_payment vo) { // 로그인회원의 특정 게시글의 지불테이블 생성
		SqlSession sqlSession = sqlSessionFactory.openSession();
		tbl_payment result = null;

		try {
			vo = sqlSession.selectOne("com.smhrd.model.tbl_paymentDAO.selectPayment", vo);
			System.out.println("dao, selectPayment");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return result;
	}

	public int selectPaymentAllcnt(int board_seq) { // jsp가서 리스트 사이즈 고민하지말고 애초에 db에서 카운트한값을 뽑아내자!!!

		SqlSession sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		try {
			result = sqlSession.selectOne("com.smhrd.model.tbl_paymentDAO.selectPaymentTFcnt", board_seq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}

	public int selectPaymentTFcnt(int board_seq) { // jsp가서 리스트 사이즈 고민하지말고 애초에 db에서 카운트한값을 뽑아내자!!!

		SqlSession sqlSession = sqlSessionFactory.openSession();

		int result = 0;

		try {
			result = sqlSession.selectOne("com.smhrd.model.tbl_paymentDAO.selectPaymentTFcnt", board_seq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return result;
	}

	
	public List<tbl_payment> payComplete() { // jsp가서 리스트 사이즈 고민하지말고 애초에 db에서 카운트한값을 뽑아내자!!!

		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<tbl_payment> list = null;

		try {
			list = sqlSession.selectList("com.smhrd.model.tbl_paymentDAO.payComplete");
			//System.out.println("payCompleteDAO, 리스트(게시글) 수 >>"+list.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return list;
	}
	
	
	public List<tbl_payment> selectPaymentPar(int board_seq) { // jsp가서 리스트 사이즈 고민하지말고 애초에 db에서 카운트한값을 뽑아내자!!!

		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<tbl_payment> list = null;

		try {
			//System.out.println("tbl_paymentDAO.selectPaymentPar board_seq >>"+board_seq);
			list = sqlSession.selectList("com.smhrd.model.tbl_paymentDAO.selectPaymentPar", board_seq);
			//System.out.println("tbl_paymentDAO.selectPaymentPar list size >>"+ list.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return list;
	}

	public int updatePayment(String id, int pay, String state, int num) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = 0;
		BigDecimal money = new BigDecimal(pay);
		BigDecimal board_seq = new BigDecimal(num);
		tbl_payment vo = new tbl_payment(id, money, state, board_seq);

		try {
			cnt = sqlSession.update("com.smhrd.model.tbl_paymentDAO.updatePayment", vo);
			System.out.println("dao, updatePaymen >> " + cnt);

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

	public tbl_payment selectPayment2(String MEM_ID, int intNum) { // 1개의 참여한
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BigDecimal BOARD_SEQ = new BigDecimal(intNum);
		tbl_payment vo = new tbl_payment(MEM_ID, BOARD_SEQ);
		tbl_payment result = null;

		try {
			System.out.println("dao, selectPayment2 vo mem_id >> " + vo.getMEM_ID());
			System.out.println("dao, selectPayment2 vo mem_bOARDSEQ>> " + vo.getBOARD_SEQ());
			vo = sqlSession.selectOne("com.smhrd.model.tbl_paymentDAO.selectPayment2", vo);

			if (vo != null) {
				sqlSession.commit(); // DML이지만 여기서는 커밋사용함.
				System.out.println("dao, selectPayment2 vo mem_id >> " + vo.getMEM_ID());
				System.out.println("dao, selectPayment2 vo PAY_TF >> " + vo.getPAY_TF());
			} else {
				sqlSession.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}

}
