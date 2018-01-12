package status.boundary;

import org.glassfish.jersey.jackson.JacksonFeature;
import org.glassfish.jersey.server.ResourceConfig;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 * Created with IntelliJ IDEA.
 * User: mreichman
 * Date: 1/12/2018
 * Time: 8:25 AM
 */
@ApplicationPath("/")
@Path("/status")
public class StatusResource extends ResourceConfig {
    public StatusResource() {
        register(JacksonFeature.class);
        packages("status.boundary");
    }

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String getStatus() {
        return "status is good";
    }
}
