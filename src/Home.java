import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Home extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    PrintWriter out = response.getWriter();

    ServletContext app = this.getServletContext();
    RequestDispatcher rd = app.getRequestDispatcher("/sophos.jsp");
    rd.forward(request, response);
  }
}
