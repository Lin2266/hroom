package com.example.demo.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Logger;

import com.example.demo.exception.ErrorInputException;
import com.example.demo.exception.ModuleException;
import org.apache.commons.lang3.StringUtils;

public class JdbcUtils {
/**
 * 獲取資料庫連接對象Connection物件
 * @return 
 *
 */
	public static Connection getConnection() throws ModuleException {
		Connection connection = null;
	    try {
	      // 讀取jdbc.properties文件組態
	      InputStream is = JdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
	      Properties properties = new Properties();
	      properties.load(is);
	      is.close();

	      String driverClass = properties.getProperty("driverClass");
		  if(StringUtils.isBlank(driverClass)){
			  throw new ErrorInputException("driverClass是空的，請確認jdbc.propertties資料是否正確");
		  }

	      String jdbcUrl = properties.getProperty("jdbcUrl");
			if(StringUtils.isBlank(driverClass)){
				throw new ErrorInputException("jdbcUrl是空的，請確認jdbc.propertties資料是否正確");
			}

	      String user = properties.getProperty("user");
			if(StringUtils.isBlank(driverClass)){
				throw new ErrorInputException("user是空的，請確認jdbc.propertties資料是否正確");
			}

	      String password = properties.getProperty("password");
			if(StringUtils.isBlank(driverClass)){
				throw new ErrorInputException("password是空的，請確認jdbc.propertties資料是否正確");
			}

	      // 載入資料庫驅動並註冊
	      Class.forName(driverClass);

	      // 通過 DriverManager類的getConnection 獲取資料庫連接對象，並返回
	      connection = DriverManager.getConnection(jdbcUrl, user, password);
	    } catch (IOException e) {
		  e.printStackTrace();
	      throw new ModuleException("讀取組態文件異常" + e.getMessage());
	    } catch (ClassNotFoundException e) {
	      e.printStackTrace();
		  throw new ModuleException("無此資料庫驅動類" + e.getMessage());
	    } catch (SQLException e) {
	      e.printStackTrace();
		  throw new ModuleException("連線據庫出現異常" + e.getMessage());
	    }
	    return connection;
	}
}
