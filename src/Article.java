import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Article extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    PrintWriter out = response.getWriter();

    String articleName = request.getPathInfo().substring(1); // Ignore '/'

    request.setAttribute("articleName", articleName);

    ServletContext app = this.getServletContext();
    RequestDispatcher rd = app.getRequestDispatcher("/article.jsp");
    rd.forward(request, response);
  }
}
