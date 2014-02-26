import java.net.URI;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriBuilder;

import org.codehaus.jettison.json.JSONObject;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;

public class TestClient {
	public static void main(String[] args) {
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource service = client.resource(getBaseURI());

		JSONObject jsonuser = new JSONObject();
		try
		{
			jsonuser.put("firstName", "arav");
			jsonuser.put("lastName", "shah");
			jsonuser.put("email", "arav.g@abc.com");
			jsonuser.put("passwd", "111");

		} catch(Exception e){}

		//System.out.println(service.path("rest/users/signup").accept(MediaType.APPLICATION_JSON).get(String.class));
		
		System.out.println(service.path("rest").path("users/signup").accept(MediaType.APPLICATION_JSON, MediaType.TEXT_PLAIN).post(ClientResponse.class, jsonuser).getEntity(String.class));
		//System.out.println(service.path("techbuddies/goods/50a988e66a4e60fc889cf5b8").accept(MediaType.APPLICATION_JSON).get(String.class));
		//System.out.println(service.path("techbuddies/goods?page=0").accept(MediaType.APPLICATION_JSON).get(String.class));
		//System.out.println(service.path("techbuddies").path("goods").accept(MediaType.APPLICATION_JSON, MediaType.TEXT_PLAIN).post(ClientResponse.class, jsonitem).getEntity(String.class));
		
		//System.out.println(service.path("techbuddies").path("user").accept(MediaType.APPLICATION_JSON, MediaType.TEXT_PLAIN).post(ClientResponse.class, jsonuser).getEntity(String.class));	
		/*		
		//System.out.println(service.path("techbuddies").path("communities").accept(MediaType.APPLICATION_JSON, MediaType.TEXT_PLAIN).post(ClientResponse.class, jsoncommunity).getEntity(String.class));		
		//System.out.println(service.path("techbuddies/goods/50aeb887d2f675b370c3df97").accept(MediaType.APPLICATION_JSON, MediaType.TEXT_PLAIN).put(ClientResponse.class, jsonitem).getEntity(String.class));		
		//service.path("techbuddies/goods/50aeb86dd2f675b370c3df96").accept(MediaType.TEXT_PLAIN).delete();
		System.out.println(service.path("techbuddies").path("login").accept(MediaType.APPLICATION_JSON, MediaType.TEXT_PLAIN).post(ClientResponse.class, jsonlogin).getEntity(String.class));	
		String id = "goods/" + service.path("techbuddies").path("goods").accept(MediaType.APPLICATION_JSON, MediaType.TEXT_PLAIN).post(ClientResponse.class, jsonitem).getEntity(String.class) + "/offers";
		System.out.println(id);
		System.out.println(service.path("techbuddies").path(id).accept(MediaType.APPLICATION_JSON, MediaType.TEXT_PLAIN).post(ClientResponse.class, jsonoffer).getEntity(String.class));	
	    ""
		System.out.println(service.path("techbuddies/communities").accept(MediaType.APPLICATION_JSON).get(String.class));
		System.out.println(service.path("techbuddies/goods?page=0").accept(MediaType.APPLICATION_JSON).get(String.class));
		System.out.println(service.path("techbuddies/goods/50a7140e4dcb2d32e223a7e4").accept(MediaType.APPLICATION_JSON).get(String.class));
		System.out.println(service.path("techbuddies/goods/search?name=item6&page=0").accept(MediaType.APPLICATION_JSON).get(String.class));
		System.out.println(service.path("techbuddies/goods/search/?status=buying&page=0").accept(MediaType.APPLICATION_JSON).get(String.class));
		System.out.println(service.path("techbuddies/goods/search/?email=c@c.com&page=0").accept(MediaType.APPLICATION_JSON).get(String.class));
		System.out.println(service.path("techbuddies").path(id).accept(MediaType.APPLICATION_JSON).get(String.class));
		*/

	}

	private static URI getBaseURI() {
		return UriBuilder.fromUri("http://localhost:8080/CloudServices").build();
	}

}