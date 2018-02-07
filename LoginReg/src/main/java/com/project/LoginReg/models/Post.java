package com.project.LoginReg.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.Email;
import org.springframework.format.annotation.DateTimeFormat;

import com.project.LoginReg.models.User;

@Entity
public class Post{
	@Id
	@GeneratedValue
	private long id;

	@Size(min=1, max=280, message="Your post must be 1-280 characters. This is twitter now.")
	private String contents;

	// Member variables and annotations go here.
	
	@DateTimeFormat(pattern="MM:dd:yyyy HH:mm:ss")
	private Date createdAt;
	
	@DateTimeFormat(pattern="MM:dd:yyyy HH:mm:ss")
	private Date updatedAt;

	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
	private User user;

	private int numLikes;
	
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "users_posts", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "post_id")
    )
    private List<User> likes;

	private boolean liked;

	@PrePersist
	public void onCreate(){this.createdAt = new Date();}
	@PreUpdate
	public void onUpdate(){this.updatedAt = new Date();}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	// Setters and Getters go here
	
	public Post(){
		this.createdAt = new Date();
		this.updatedAt = new Date();
	}
	/**
	 * @return the contents
	 */
	public String getcontents() {
		return contents;
	}
	/**
	 * @param contents the contents to set
	 */
	public void setcontents(String contents) {
		this.contents = contents;
	}

	public List<User> getLikes() {
		return likes;
	}
	public void setLikes(List<User> likes) {
		this.likes = likes;
	}
	/**
	 * @return the numLikes
	 */
	public int getNumLikes() {
		return numLikes;
	}
	/**
	 * @param numLikes the numLikes to set
	 */
	public void setNumLikes(int numLikes) {
		this.numLikes = numLikes;
	}
	/**
	 * @return the liked
	 */
	public boolean isLiked() {
		return liked;
	}
	/**
	 * @param liked the liked to set
	 */
	public void setLiked(boolean liked) {
		this.liked = liked;
	}
	

}
