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
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.Email;
import org.springframework.format.annotation.DateTimeFormat;

import com.project.LoginReg.models.Post;

@Entity
public class User{
	@Id
	@GeneratedValue
	private long id;
	@Size(min=1, message="Alias cannot be blank")
	private String alias;
	@Size(min=1, message="First name cannot be blank")
	private String firstName;
	@Size(min=1, message="Last name cannot be blank")
	private String lastName;
	@Email(message="Invalid email format! example: example@example.com")
	private String email;
	@Size(min=8, message="Password must be at least eight characters")
	private String password;
	@Transient
	private String confirm;

	//maybe add profile pic?

	private int totalLikes;

	private int totalPosts;
	
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
	private List<Post> posts;
	
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "user_likes", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "post_id")
    )
    private List<Post> postsLiked;

	// Member variables and annotations go here.
	
	@DateTimeFormat(pattern="MM:dd:yyyy HH:mm:ss")
	private Date createdAt;
	
	@DateTimeFormat(pattern="MM:dd:yyyy HH:mm:ss")
	private Date updatedAt;

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
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
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

	public List<Post> getPosts() {
		return posts;
	}
	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}

	public List<Post> getpostsLiked() {
		return postsLiked;
	}
	public void setpostsLiked(List<Post> postsLiked) {
		this.postsLiked = postsLiked;
	}
	
	//constructor
	
	public User(){
		this.createdAt = new Date();
		this.updatedAt = new Date();
	}
	/**
	 * @return the alias
	 */
	public String getAlias() {
		return alias;
	}
	/**
	 * @param alias the alias to set
	 */
	public void setAlias(String alias) {
		this.alias = alias;
	}
	/**
	 * @return the totalLikes
	 */
	public int getTotalLikes() {
		return totalLikes;
	}
	/**
	 * @param totalLikes the totalLikes to set
	 */
	public void setTotalLikes(int totalLikes) {
		this.totalLikes = totalLikes;
	}
	/**
	 * @return the totalPosts
	 */
	public int getTotalPosts() {
		return totalPosts;
	}
	/**
	 * @param totalPosts the totalPosts to set
	 */
	public void setTotalPosts(int totalPosts) {
		this.totalPosts = totalPosts;
	}

}