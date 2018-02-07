package com.project.LoginReg.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.LoginReg.models.Post;
import com.project.LoginReg.models.User;

import com.project.LoginReg.repositories.PostRepository;


@Service
public class PostService {
	// Member variables / service initializations go here
	private PostRepository _pr;
		
	public PostService(PostRepository _pr){
		this._pr = _pr;
	}

	public void create(User poster, Post post){
		
		post.setUser(poster);
		_pr.save(post);
		
	}
	
	public Post findById(Long id){
		return (Post) _pr.findOne(id);
	}

	public void addLike(Long id, User user) {
		Post post = _pr.findOne(id);
		List<User> likes = post.getLikes();
		likes.add(user);
		post.setLikes(likes);
		_pr.save(post);
	}

	public void destroy(Long id) {
		Post post = _pr.findOne(id);
		_pr.delete(post);
	}

	public List<Long> getAllLikesList(Long id) {
		List<Long> postsLikes = _pr.getPostsLikes(id);
		return postsLikes;
	}

	public List<Post> orderByLikes() {
		List<Post> orderedLikeslist = _pr.orderByLikes();
		return orderedLikeslist;
	}

	public void remove(Long id, User user) {
		Post post = _pr.findOne(id);
		List<User> likes = post.getLikes();
		likes.remove(user);
		post.setLikes(likes);
		_pr.save(post);
	}

	public void update(Post post) {
		_pr.save(post);
	}
	// Crud methods to act on services go here.
}
