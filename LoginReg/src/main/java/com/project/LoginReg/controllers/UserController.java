package com.project.LoginReg.controllers;

import com.project.LoginReg.models.Post;
import com.project.LoginReg.models.User;
import com.project.LoginReg.repositories.UserRepository;
import com.project.LoginReg.services.PostService;
import com.project.LoginReg.services.UserService;
import com.project.LoginReg.validators.UserValidator;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.LoginReg.repositories.PostRepository;

@Controller
public class UserController{
	private UserService _us;
	private UserValidator _uv;
	private PostRepository _pr;
	private PostService _ps;
	private UserRepository _ur;

	public UserController(UserService _us, UserValidator _uv, PostRepository _pr, PostService _ps, UserRepository _ur){
		this._us = _us;
		this._uv = _uv;
		this._pr = _pr;
		this._ps = _ps;
		this._ur = _ur;

	}
	
	@RequestMapping("/register")
	public String register(@ModelAttribute("user") User user, HttpSession s){
		s.setAttribute("id", null);
		return "register";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession s){
		s.setAttribute("id", null);
		return "redirect:/";
	}

	@PostMapping("/register")
	public String creater(@Valid @ModelAttribute("user") User user, BindingResult res, HttpSession session){
		_uv.validate(user, res);
		if(res.hasErrors()){
			return "register";
		}else{
			System.out.println("Your user is 0" + user);
			_us.create(user);
			session.setAttribute("id", user.getId());
			return "redirect:/dashboard";
		}
	}
	@PostMapping("/login")
	public String login(@RequestParam("email") String email, @RequestParam("password")String password, HttpSession session){
		User user = _us.findByEmail(email);
		if(user == null){
			return "redirect:/";
		}else{
			if( _us.isMatch(password, user.getPassword()) ){
				session.setAttribute("id", user.getId());
				return "redirect:/dashboard";

			}else{
				return "redirect:/";
			}
		}
	}

	//Post Controllers

	@RequestMapping("/dashboard")
	public String dashboard(HttpSession s, Model model, @ModelAttribute("post") Post post, BindingResult res) {
		User user = _us.findById((Long)s.getAttribute("id"));
		model.addAttribute("currentUser", user);

		List<Post> allPosts = (List<Post>) _pr.orderByLikes();
		
		List<Post> postLoop = new ArrayList<Post>();

		for (Post iPost : allPosts) {
			postLoop.add(iPost);
		}
		// still need to determine whether or not  the current User has liked each post
		model.addAttribute("postLoop", postLoop);
		return "dashboard";
	}

	@PostMapping("/newPost")
	public String createPost(@ModelAttribute("post") Post post, BindingResult res, HttpSession s) {
		User user = _us.findById((Long)s.getAttribute("id"));
		User poster = _us.findById((Long) s.getAttribute("id"));
		_ps.create(poster, post);
		user.setTotalPosts(user.getTotalPosts() +1);
		_ur.save(user);

		return "redirect:/dashboard";
	}

	// Delete Post
	@RequestMapping("/post/{id}/delete")
	public String deletePost(@PathVariable("id") Long id, HttpSession s) {
		_ps.destroy(id);
		User user = _us.findById((Long)s.getAttribute("id"));
		user.setTotalPosts(user.getTotalPosts() - 1);
		return "redirect:/dashboard";
	}

	// Show the user's profile
	@RequestMapping("/user/{id}")
	public String showUser(@PathVariable("id") long id, HttpSession session, Model model, @ModelAttribute("user") User user) {
		User thisUser = _us.findById(id);
		model.addAttribute("thisUser", thisUser);
		return "showUser";
	}

	// Show the the posts details
	@RequestMapping("/post/{id}")
	public String showPostDetails(@PathVariable("id") long id, HttpSession session, Model model, @ModelAttribute("post") Post post) {
		Post thisPost = _ps.findById(id);
		model.addAttribute("thisPost", thisPost);

		// List<Long> likes = _ps.getAllLikesList(id);

		ArrayList<User> currentUsers = new ArrayList<User>();
		// List<User> postsLikes = _pr

		for (User currentUser : thisPost.getLikes()) {
			currentUsers.add(currentUser);
			System.out.println(currentUser.getAlias());
		}
		model.addAttribute("currentUsers", currentUsers);

		return "showPost";
	}

	//Like stuff 
	@RequestMapping("/post/{id}/join")
	public String likePost(@PathVariable("id") long id, HttpSession session) {
		User currentUser = _us.findById((long) session.getAttribute("id"));
		_ps.addLike(id, currentUser);

		Post thisPost = _ps.findById(id);
		thisPost.setNumLikes(thisPost.getNumLikes() + 1);
		thisPost.setLiked(true);
		_pr.save(thisPost);
		
		System.out.println(thisPost.getNumLikes());

		currentUser.setTotalLikes(currentUser.getTotalLikes() +1);
		_ur.save(currentUser);
		return "redirect:/dashboard";
	}

	//Unlike Stuff
	@RequestMapping("/post/{id}/unjoin")
	public String unjoin(@PathVariable("id") long post_id, HttpSession s, Model model) {
		
		Post post = _ps.findById(post_id);

		User currentUser = _us.findById((Long)s.getAttribute("id"));
		
		post.setLiked(false);

		List<User> users = post.getLikes();
		users.remove(currentUser);
		
		post.setLikes(users);

		currentUser.setTotalLikes(currentUser.getTotalLikes() - 1);
		
		 _ps.update(post);
		 return "redirect:/dashboard";
	}

}