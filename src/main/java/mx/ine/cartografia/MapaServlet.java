package mx.ine.cartografia;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
//import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

@WebServlet(value = "/dce/GenerarMapa") 
public class MapaServlet extends HttpServlet {

	public static Logger logger = Logger.getLogger(MapaServlet.class);
	/**
	 * 
	 */
	private static final long serialVersionUID = 7651002631108954297L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Enumeration<String> parameterNames = request.getParameterNames();
		 
        while (parameterNames.hasMoreElements()) {
 
            String line = parameterNames.nextElement();
 
            String[] paramValues = request.getParameterValues(line);
            line += " [";
            for (int i = 0; i < paramValues.length; i++) {
            	if(i!=paramValues.length-1)
            		line+= paramValues[i] + ",";
            	else
            		line+= paramValues[i];
            }
            logger.info(line+"]");
            line += " [";
        }
	logger.info("-------------------------------------------------------");
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		out.print("<html><body>");
//		out.print("<h3>Hello Servlet</h3>");
//		out.print("</body></html>");
		String nextJSP = "/map.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
		dispatcher.forward(request,response);
	}

}
