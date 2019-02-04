package board;

import java.util.ArrayList;

public interface Service {
	void addArticle(Article a);
	ArrayList<Article> GetAll();
	Article getByNum(int num);
	ArrayList<Article> getByWriter(String writer);
	ArrayList<Article> getTitle(String title);
	void editArticle(Article a);
	void delArticle(int num);
}
