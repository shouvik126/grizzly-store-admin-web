package com.pack;

import org.apache.commons.dbcp.BasicDataSource;

public class DBUtility {
	private static BasicDataSource dataSource;
	static
	{
		try
		{
			dataSource=new BasicDataSource();
			dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
			dataSource.setUsername("system");
			dataSource.setPassword("password1$");
			dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
			dataSource.setMaxIdle(1000);
			dataSource.setMinIdle(100);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	public static BasicDataSource getDatasourse(){
		return dataSource;
	}
	public static void setDatasourse(BasicDataSource dataSource)
	{
		DBUtility.dataSource=dataSource;
	}

}
