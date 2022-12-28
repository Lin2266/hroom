package com.example.demo.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Logger;

import com.example.demo.exception.ModuleException;

public class JdbcUtils {

/**
 * 獲取資料庫連接對象Connection物件
 * @return 
 *
 */
	public static Connection getConnection() {
		
		Connection connection = null;
	    try {
	      // 讀取jdbc.properties文件組態
	      InputStream is = JdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
	      Properties properties = new Properties();
	      properties.load(is);
	      is.close();

	      String driverClass = properties.getProperty("driverClass");
	      String jdbcUrl = properties.getProperty("jdbcUrl");
	      String user = properties.getProperty("user");
	      String password = properties.getProperty("password");

	      // 載入資料庫驅動並註冊
	      Class.forName(driverClass);

	      // 通過 DriverManager類的getConnection 獲取資料庫連接對象，並返回
	      connection = DriverManager.getConnection(jdbcUrl, user, password);
	    } catch (IOException e) {
	      new ModuleException("讀取組態文件異常" + e.getMessage());
	      e.printStackTrace();
	    } catch (ClassNotFoundException e) {
	      e.printStackTrace();
	      new ModuleException("無此資料庫驅動類" + e.getMessage());
	    } catch (SQLException e) {
	      e.printStackTrace();
	      new ModuleException("連線據庫出現異常" + e.getMessage());
	    }
	    return connection;
	}
}
