package edu.sjsu.cmpe282.api.resources;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import edu.sjsu.cmpe282.domain.User;
import edu.sjsu.cmpe282.dto.UserDao;

@Path("/users")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class UserResource {
	
	private UserDao userDao = new UserDao();
	
	@POST
	@Path("/signup")
	public User signUp(User user) throws ClassNotFoundException {
		System.out.print("Inside Controller: user created: "+user.getFirstName());
		userDao.addUser(user);
		return user;//Response.status(201).entity("User Created : \n"+ user.getFirstName()).build();
	}

	@POST
	@Path("/signin")
	public boolean signIn(User user)
	{
		return userDao.checkUser(user);
	}
	
	@GET
	@Path("/{email}")
	public User showProfile(String email) throws ClassNotFoundException {
		System.out.print("Inside User Controller: showProfile for: " +email);
		User user = new User();
		user.setEmail(email);
		//userDao.showUser(email);
		return user;//Response.status(201).entity("User Created : \n"+ user.getFirstName()).build();
	}
	
	
	
}
