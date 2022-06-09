package com.shop.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.shop.dao.ProductDao;
import com.shop.domain.Product;

public class DBUtil {

	private static String driver;
	private static String url;
	private static String username;
	private static String password;
	public Connection conn = null;
	public PreparedStatement pstmt = null;
	public ResultSet rs = null;
    public Statement stmt = null;
	// 閫氳繃閰嶇疆鏂囦欢璁剧疆driver,username,username,password
	static {
//		Properties prop = new Properties();
//		Reader in;
//		try {
//			in = new FileReader("./src/config.properties");
//			prop.load(in);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		driver = prop.getProperty("driver");
//		url = prop.getProperty("url");
//		username = prop.getProperty("username");
//		password = prop.getProperty("password");
		driver = "com.mysql.cj.jdbc.Driver";
		url = "jdbc:mysql://127.0.0.1:3306/shopsystem?useUnicode=true&characterEncoding=utf-8&userSSL=false&serverTimezone=GMT";
	    username = "root";
		password = "9527";//鏀逛负鑷繁璁剧疆鐨勫瘑鐮�
	}

	public DBUtil() {
	}

	/**
	 * 杩炴帴鏁版嵁搴�
	 * 
	 * @return 鏁版嵁搴撹繛鎺ュ璞�
	 */
	public static Connection getConnection() {
		try {
			Class.forName(driver);
			// 杩斿洖杩炴帴
			return DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 鏁版嵁搴撴煡璇�
	 * 
	 * @param sql
	 *            棰勫鐞嗙殑SQL璇彞
	 * @param params
	 *            棰勫鐞嗕腑鐨凷QL璇彞涓殑鍙傛暟
	 * @return 鏌ヨ鍚庣殑缁撴灉闆�
	 */
	public ResultSet doQuery(String sql, Object[] params) {
		try {
			conn = DBUtil.getConnection();
			// 鑾峰彇PreparedStatement瀵硅薄
			pstmt = conn.prepareStatement(sql);
			// 璁剧疆pstmt鐨勫弬鏁�
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					pstmt.setObject(i + 1, params[i]);
				}
			}
			// 鎵ц鏌ヨ
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
    
	/**
	 * 鏁版嵁搴撴煡璇�
	 * 
	 * @param sql
	 *             澶勭悊鐨凷QL璇彞
	 * @return 鏌ヨ鍚庣殑缁撴灉闆�
	 */
	public ResultSet doQuery(String sql) {
		try {
			conn = DBUtil.getConnection();
			// 鑾峰彇PreparedStatement瀵硅薄
			stmt = conn.createStatement();
			// 鎵ц鏌ヨ
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	/**
	 * 鎵ц鏁版嵁搴撴洿鏂版搷浣�(DDL鍜孌ML)
	 * 
	 * @param sql
	 *            棰勫鐞嗙殑SQL璇彞
	 * @param params
	 *            棰勫鐞嗕腑鐨凷QL璇彞涓殑鍙傛暟
	 * @return 鍙楀奖鍝嶇殑琛屾暟
	 */
	public int doUpdate(String sql, Object[] params) {
		int n = 0;

		// 鍙栨秷Connection鐨勮嚜鍔ㄦ彁浜�
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			// 鑾峰彇PreparedStatement瀵硅薄
			pstmt = conn.prepareStatement(sql);
			// 璁剧疆pstmt鐨勫弬鏁�
			// 璁剧疆pstmt鐨勫弬鏁�
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					pstmt.setObject(i + 1, params[i]);
				}
			}
			// 鎵ц鏇存柊
			n = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			e.printStackTrace();
		}
		return n;
	}

	/**
	 * 鎵ц鏁版嵁搴撴洿鏂版搷浣�(DDL鍜孌ML)
	 * 
	 * @param sql
	 *            棰勫鐞嗙殑SQL璇彞
	 * @return 鍙楀奖鍝嶇殑琛屾暟
	 */
	public int doUpdate(String sql) {
		int n = 0;//鍙楀奖鍝嶇殑琛屾暟
		// 鍙栨秷Connection鐨勮嚜鍔ㄦ彁浜�
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			// 鑾峰彇Statement瀵硅薄
			stmt = conn.createStatement();
			// 鎵ц鏇存柊
			n = stmt.executeUpdate(sql);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			e.printStackTrace();
		}
		return n;
	}
	
	/**
	 * 鍏抽棴鏁版嵁搴撶殑杩炴帴锛岄噴鏀捐祫婧�
	 * @param stmt Steatemet瀵硅薄
	 * @param conn 鏁版嵁搴撹繛鎺ュ璞�
	 * @throws Exception 
	 */
	public void close() {
		if(rs != null){
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			stmt = null;
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			conn = null;
		}

	}

	
	
}
