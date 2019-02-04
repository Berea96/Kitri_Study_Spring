package com.tuding.spring.liked;

public interface LikedService {
	void addLiked(Liked l);
	Liked getByBoardNum(Liked l);
	Liked getByMember(String id);
	void delLiked(Liked l);
}
