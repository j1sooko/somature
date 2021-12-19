package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import model.Transaction;

public class TransactionDAO {
	private static final Logger log = LoggerFactory.getLogger(TransactionDAO.class);
	private JDBCUtil jdbcUtil = null;
		
		public TransactionDAO() {			
			jdbcUtil = new JDBCUtil();	
		}

		public int create(Transaction transaction) throws SQLException {

			String sql = "INSERT INTO TRANSACTION VALUES (id_seq.nextval, DEFAULT, ?, ?)";
			Object[] param = new Object[] { transaction.getUser().getUserId(), transaction.getPost().getPostId()};	
			System.out.println("sql: " + sql);
			System.out.println("param: " + param);
			for (Object p : param) {
				System.out.println(p);
			}

			jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil 占쎈퓠 insert�눧硫몃궢 筌띲끆而� 癰귨옙占쎈땾 占쎄퐬占쎌젟	
			try {
				int result = jdbcUtil.executeUpdate();
				return result;
			} catch (Exception ex) {
				jdbcUtil.rollback();
				ex.printStackTrace();
			} finally {	 
				jdbcUtil.commit();
				jdbcUtil.close();
			}
			return 0;			
		}

		public List<Transaction> findMyTransactionList(int userId) throws SQLException {
	        String sql = "SELECT * " 
	        		   + "FROM TRANSACTION "
	        		   + "WHERE userId=? ";
			jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});
						
			try {
				ResultSet rs = jdbcUtil.executeQuery();	
				List<Transaction> transactionList = new ArrayList<Transaction>();
				while (rs.next()) {
					Transaction transaction = new Transaction(		
							rs.getInt("transId"),
							rs.getDate("transDate"),
							userId,
							rs.getInt("postId"));
					transactionList.add(transaction);				
				}		
				return transactionList;					
				
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				jdbcUtil.close();
			}
			return null;
		}
		
}
