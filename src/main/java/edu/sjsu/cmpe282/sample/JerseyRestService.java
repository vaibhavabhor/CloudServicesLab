package edu.sjsu.cmpe282.sample;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/jsonServices")
public class JerseyRestService {

	@GET
	@Path("/print/{name}")
	@Produces(MediaType.APPLICATION_JSON)
	public Student produceJSON( @PathParam("name") String name ) {

		Student st = new Student(name, "Diaz",22,1);

		return st;

	}

}