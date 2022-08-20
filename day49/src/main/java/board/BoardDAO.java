package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JDBCUtil;

public class BoardDAO {
	Connection conn;
	PreparedStatement pstmt;
	final String sql_selectAll="SELECT * FROM (SELECT * FROM BOARD ORDER BY BID DESC) WHERE ROWNUM <=?";
	final String sql_selectAll_R="SELECT * FROM REPLY WHERE BID=? ORDER BY RID DESC";
	final String sql_insert="INSERT INTO BOARD((SELECT NVL(MAX(BID),0)+1 FROM BOARD),MID,MSG) VALUES(?,?)";
	final String sql_delete="DELETE FROM BOARD WHERE BID=?";
	final String sql_insert_R="INSERT INTO REPLY(MID,BID,RMSG) VALUES(?,?,?)";
	final String sql_delete_R="DELETE FROM REPLY WHERE RID=?";
	final String sql_update="UPDATE BOARD SET FAVCNT=FAVCNT+1 WHERE BID=?";

	 public boolean insert(BoardVO bvo) {
	      conn=JDBCUtil.connect();
	      try {
	         pstmt=conn.prepareStatement(sql_insert);
	         pstmt.setString(1, bvo.getMid());
	         pstmt.setString(2, bvo.getMsg());
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	         return false;
	      } finally {
	         JDBCUtil.disconnect(pstmt, conn);
	      }
	      return true;
	   }
	   public boolean delete(BoardVO bvo) {
	      conn=JDBCUtil.connect();
	      try {
	         pstmt=conn.prepareStatement(sql_delete);
	         pstmt.setInt(1,bvo.getBid());
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	         return false;
	      } finally {
	         JDBCUtil.disconnect(pstmt, conn);
	      }
	      return true;
	   }
	   public boolean insertR(ReplyVO rvo) {
	      conn=JDBCUtil.connect();
	      try {
	         pstmt=conn.prepareStatement(sql_insert_R);
	         pstmt.setString(1, rvo.getMid());
	         pstmt.setInt(2, rvo.getBid());
	         pstmt.setString(3, rvo.getRmsg());
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	         return false;
	      } finally {
	         JDBCUtil.disconnect(pstmt, conn);
	      }
	      return true;
	   }
	   public boolean deleteR(ReplyVO rvo) {
	      conn=JDBCUtil.connect();
	      try {
	         pstmt=conn.prepareStatement(sql_delete_R);
	         pstmt.setInt(1, rvo.getRid());
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	         return false;
	      } finally {
	         JDBCUtil.disconnect(pstmt, conn);
	      }
	      return true;
	   }
	   public boolean update(BoardVO bvo) {
	      conn=JDBCUtil.connect();
	      try {
	         pstmt=conn.prepareStatement(sql_update);
	         pstmt.setInt(1, bvo.getBid());
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	         return false;
	      } finally {
	         JDBCUtil.disconnect(pstmt, conn);
	      }
	      return true;
	   }

	public ArrayList<BoardSet> selectAll(BoardVO bvo){	// 유지보수 용이
		ArrayList<BoardSet> datas=new ArrayList<BoardSet>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(sql_selectAll);
			pstmt.setInt(1, bvo.getCnt());
			// 글 1개 + 댓글 N개
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardSet bs = new BoardSet();
				
				BoardVO boardVO = new BoardVO();
				boardVO.setBid(rs.getInt("BID"));
				boardVO.setFavcnt(rs.getInt("FAVCNT"));
				boardVO.setMid(rs.getString("MID"));
				boardVO.setMsg(rs.getString("MSG"));
				boardVO.setRcnt(rs.getInt("RCNT"));	// rList.size();를 이용하면 DB비용 절감에 효과적. 포폴에 넣자.
				bs.setBoardVO(boardVO);
				
				ArrayList<ReplyVO> rList = new ArrayList<ReplyVO>(); 
				pstmt=conn.prepareStatement(sql_selectAll_R);
				pstmt.setInt(1, rs.getInt("BID"));
				ResultSet rs2 = pstmt.executeQuery();
				while(rs2.next()) {
					ReplyVO replyVO = new ReplyVO();
					
					replyVO.setBid(rs2.getInt("BID"));
					replyVO.setMid(rs2.getString("MID"));
					replyVO.setRid(rs2.getInt("RID"));
					replyVO.setRmsg(rs2.getString("RMSG"));
					rList.add(replyVO);
				}
				bs.setrList(rList);
				
				datas.add(bs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}		
		return datas;
	}
}
