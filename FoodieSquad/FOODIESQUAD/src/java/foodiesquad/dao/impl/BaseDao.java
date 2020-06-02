/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.dao.impl;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BaseDao {

	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	public static final String URL = "jdbc:mysql://localhost:3306/foodie?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone = GMT";
//URL = "jdbc:mysql://localhost:3306
//public static final String URL = "jdbc:mysql://localhost:3306/tickets?useUnicode=true&characterEncoding=utf8";
	// 加载驱动，只需加载一次
	static {
		try {
			Class.forName(DRIVER);
                        System.out.println("成功了！！！--1");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
                         System.out.println("没成功！！！--1");
		}
	}

	// 获得连接
	public Connection getConn() {
		Connection conn = null;
//    return (getConnection(url, info, Reflection.getCallerClass()));
//Connection con = aDriver.driver.connect(url, info);
		try { //conn = DriverManager.getConnection(URL, URL, DRIVER);
			conn = DriverManager.getConnection(URL,"root", "123");
                            System.out.println("成功了！！！--2");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
                          System.out.println("没成功！！！--2");
		}
		return conn;
	}

	// 关闭所有
	public void releaseAll(ResultSet rs, PreparedStatement pstmt, Connection conn) {

		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 增删改 封装
	public boolean operUpdate(String sql, List<Object> params) {
		Connection conn = null;//创建connection类对象conn
		PreparedStatement pstmt = null;//声明preparestatement对象pstmt
		int res = 0;//

		// 获得与数据库的连接对象
		conn = getConn();

		try {

			pstmt = conn.prepareStatement(sql);//赋值

			if (params != null) {
				for (int i = 0; i < params.size(); i++) {//i：sql里面的问号。代表值。
                          pstmt.setObject(i + 1, params.get(i));//完善sql语句，将？替换成list object 对象params的静态属性的值
                            //将表单里的第0个值（表单从0开始）传入到第1个问号里。//实现数据的传递。
				}
                                 }
			// 增刪改的統一方法
                        //    pst.executeUpdate();
                          res = pstmt.executeUpdate();//执行数据库。
                           System.out.println(pstmt.toString());
			//返回的是sql在数据库中影响的行数
                      
		} catch (SQLException e) {
			// TODO Auto-generated catch block
                      
			e.printStackTrace();
		} finally {
			releaseAll(null, pstmt, conn);
		}
        
		return res > 0 ? true : false;

	}

	public <T> List<T> operQuery(String sql, List<Object> params, Class<T> cls) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<T> list = new ArrayList<T>();
		conn = getConn();

		try {
			pstmt = conn.prepareStatement(sql);

			if (params != null) {
				for (int i = 0; i < params.size(); i++) {

					pstmt.setObject(i + 1, params.get(i));
}
}
			// 增刪改的統一方法
System.out.println(sql);
			rs = pstmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			while (rs.next()) {//取出数据集里的第i条数据。如果不为空。
				T m = cls.newInstance();//获得具体的类的对象 eg. movie hall ticket 类的对象

				for (int i = 0; i < rsmd.getColumnCount(); i++) {
					String col_name = rsmd.getColumnName(i + 1);//i=1,数据集里面的第1个列名称，例如电影的名字
                                        System.out.println(col_name);
					Object value = rs.getObject(col_name);//将电影名这个数据项的信息
                                           //获取该对象当前列的信息
					Field field;/*每个成员变量有类型和值。获取当前对象的成员变量的类型，和重新设值的方法。*/

					field = cls.getDeclaredField(col_name);//获取当前对象的成员变量的类型，和重新设值的方法。
                                        //获得某个类的所有声明的字段，即包括public、private和proteced，但是不包括父类的申明字段。
                                        /*
                                        
                                        public static void printField(Class<?> class1)
                                          {
	                                    // 获取类的所有声明的字段
	                                     Field[] sField = class1.getDeclaredFields();
                                             field = cls.getDeclaredField(col_name)；获取当前列的字段。
                                        
                                        
                                        */
                                        
                                        /*Class<?> getType() 
                                          返回一个 Class 对象，它标识了此 Field 对象所表示字段的声明类型。*/

					field.setAccessible(true);
					field.set(m, value);  //void set(Object obj, Object value) 
                                                              //将指定对象变量上此 Field 对象表示的字段设置为指定的新值。
				}
				list.add(m);
			}
		}
catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			releaseAll(rs, pstmt, conn);
		}
		return list;
}

}
