package mx.ine.cartografia;

import java.io.IOException;

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
		logger.info("lat   : "+request.getParameter("lat"));
		logger.info("long  : "+request.getParameter("long"));
		logger.info("width : "+request.getParameter("width"));
		logger.info("height: "+request.getParameter("height"));
		logger.info("zoom  : "+request.getParameter("zoom"));
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
