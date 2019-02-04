package com.tuding.spring.liked;

public interface LikedDao {
	void insert(Liked l);
	Liked selectByBoardNum(Liked l);
	Liked selectByMember(String id);
	void delete(Liked l);
}
