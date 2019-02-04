package board;

import java.util.ArrayList;
import java.util.Scanner;

public interface BoardMenu {
	void run(Scanner sc);
	void write(Scanner sc);
	void boardView(Scanner sc);
	void boardViewMenu(Scanner sc);
	void boardDetail(Scanner sc);
	void boardDelete(Scanner sc);
	void boardSearch(Scanner sc);
	void showList(ArrayList<Article> list);
}
