import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import sophos.*;
import dao.*;

public class ServletArticle extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    PrintWriter out = response.getWriter();

    int articleId = Integer.parseInt(request.getPathInfo().substring(1)); // Ignore '/'

    Article article = (new ArticleDAO()).getById(articleId);

    if (article == null) {
      // TODO(naum): Redirect to error page
      return;
    }

    request.setAttribute("name", article.getName());
    request.setAttribute("content", article.getContent());

    ServletContext app = this.getServletContext();
    RequestDispatcher rd = app.getRequestDispatcher("/article.jsp");
    rd.forward(request, response);
  }
}
