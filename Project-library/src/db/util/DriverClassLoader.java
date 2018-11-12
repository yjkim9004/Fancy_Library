package db.util;

public class DriverClassLoader {
	public static boolean load(String driver) {
		boolean r = false;
		try {
			Class.forName(driver);
			r = true;
		} catch (ClassNotFoundException e) {			
			System.out.printf("'%s' 로딩 실패\n", driver);			
		}
		return r;
	}
}
