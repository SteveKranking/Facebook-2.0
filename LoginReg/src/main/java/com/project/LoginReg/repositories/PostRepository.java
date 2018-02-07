package com.project.LoginReg.repositories;

import com.project.LoginReg.models.Post;
import com.project.LoginReg.models.User;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository 												
public interface PostRepository extends CrudRepository<Post,Long>{
	
	@Query(value="SELECT user_id FROM users_posts WHERE post_id = ?1", nativeQuery = true)	
	List<Long> getPostsLikes(Long id);

	@Query(value="SELECT * FROM post ORDER BY num_likes DESC", nativeQuery=true)
	List<Post> orderByLikes();
	

}
