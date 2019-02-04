package member;

import java.util.Scanner;

public interface MemberMenu {
	void run(Scanner sc);
	void join(Scanner sc);
	void login(Scanner sc);
	void loginSuccess(Scanner sc);
	void info(Scanner sc);
	boolean logout();
	void delMember(Scanner sc);
}
