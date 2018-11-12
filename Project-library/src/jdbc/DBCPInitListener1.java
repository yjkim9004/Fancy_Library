package jdbc;

import java.io.IOException;
import java.io.StringReader;
import java.sql.DriverManager;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

@WebListener
public class DBCPInitListener1 implements ServletContextListener {
	private Properties prop;
	
    public void contextInitialized(ServletContextEvent sce)  { 
    	
    	String poolConfig = sce.getServletContext().getInitParameter("poolConfig");
    	prop = new Properties();
    	try {
			prop.load(new StringReader(poolConfig));
		} catch (IOException e) {
			throw new RuntimeException("config load fail", e);
		}
    	loadJDBCDriver();
    	initConnectionPool();
    	System.out.println("jdbc load complete");
    }
    
    private void loadJDBCDriver() {
		try {
			Class.forName(prop.getProperty("jdbcdriver"));
		} catch (ClassNotFoundException ex) {
			throw new RuntimeException("fail to load JDBC Driver", ex);
		}
	}
   
    private void initConnectionPool() {
		try {
			ConnectionFactory connFactory = 
					new DriverManagerConnectionFactory(prop.getProperty("jdbcUrl"), 
							prop.getProperty("dbUser"), 
							prop.getProperty("dbPass"));

			PoolableConnectionFactory poolableConnFactory = 
					new PoolableConnectionFactory(connFactory, null);
			poolableConnFactory.setValidationQuery(prop.getProperty("validationQuery"));

			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			poolConfig.setTestWhileIdle(true);
			poolConfig.setMinIdle(Integer.parseInt(prop.getProperty("minIdle")));
			poolConfig.setMaxTotal(Integer.parseInt(prop.getProperty("maxTotal")));			

			GenericObjectPool<PoolableConnection> connectionPool = 
					new GenericObjectPool<>(poolableConnFactory, poolConfig);
			poolableConnFactory.setPool(connectionPool);
			
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = 
					(PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:library");
			driver.registerPool(prop.getProperty("poolName"), connectionPool);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}
    public void contextDestroyed(ServletContextEvent sce)  { 
    }

}
