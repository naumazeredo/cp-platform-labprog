import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ServletHome extends HttpServlet {
  public void processRequest(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    PrintWriter out = response.getWriter();

    if (request.getParameter("search") != null) {
      String search = request.getParameter("search");
      if (search.length() > 0)
        request.setAttribute("search", search);
    }

    ServletContext app = this.getServletContext();
    RequestDispatcher rd = app.getRequestDispatcher("/sophos.jsp");
    rd.forward(request, response);
  }

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    processRequest(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    processRequest(request, response);
  }
}
