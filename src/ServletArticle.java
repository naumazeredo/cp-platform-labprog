import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;
import java.net.URLEncoder;

import sophos.*;
import dao.*;

public class ServletArticle extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    PrintWriter out = response.getWriter();

    int articleId = Integer.parseInt(request.getPathInfo().substring(1)); // Ignore '/'

    Article article = (new ArticleDAO()).getById(articleId);
    List<Category> categories = (new CategoryDAO()).getList();
    List<Problem> problems = (new ProblemDAO()).getList(article);

    if (article == null) {
      // TODO(naum): Redirect to error page
      return;
    }

    request.setAttribute("article", article);
    request.setAttribute("categories", categories);
    request.setAttribute("problems", problems);

    ServletContext app = this.getServletContext();
    RequestDispatcher rd = app.getRequestDispatcher("/article.jsp");
    rd.forward(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    PrintWriter out = response.getWriter();

    int articleId = Integer.parseInt(request.getPathInfo().substring(1)); // Ignore '/'

    ArticleDAO articleDAO = new ArticleDAO();
    CategoryDAO categoryDAO = new CategoryDAO();

    Article article = articleDAO.getById(articleId);
    article.setName(request.getParameter("title"));
    article.setContent(request.getParameter("content"));
    article.setCategory(categoryDAO.getById(Integer.parseInt(request.getParameter("category"))));

    articleDAO.update(article);

    List<Category> categories = categoryDAO.getList();
    List<Problem> problems = (new ProblemDAO()).getList(article);

    request.setAttribute("article", article);
    request.setAttribute("categories", categories);
    request.setAttribute("problems", problems);

    ServletContext app = this.getServletContext();
    RequestDispatcher rd = app.getRequestDispatcher("/article.jsp");
    rd.forward(request, response);
  }
}
