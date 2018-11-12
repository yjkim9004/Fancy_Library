package db.util;

public class DriverClassLoader {
	public static boolean load(String driver) {
		boolean r = false;
		try {
			Class.forName(driver);
			r = true;
		} catch (ClassNotFoundException e) {			
			System.out.printf("'%s' �ε� ����\n", driver);			
		}
		return r;
	}
}
