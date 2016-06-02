import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;
import java.net.URLEncoder;

import sophos.*;
import dao.*;

public class ServletNewArticle extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    List<Category> categories = (new CategoryDAO()).getList();
    request.setAttribute("categories", categories);

    ServletContext app = this.getServletContext();
    RequestDispatcher rd = app.getRequestDispatcher("/new-article.jsp");
    rd.forward(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ArticleDAO articleDAO = new ArticleDAO();
    CategoryDAO categoryDAO = new CategoryDAO();

    Article article = new Article();
    article.setName(URLEncoder.encode(request.getParameter("title"), "UTF-8"));
    article.setContent(URLEncoder.encode(request.getParameter("content"), "UTF-8"));
    article.setCategory(categoryDAO.getById(Integer.parseInt(request.getParameter("category"))));

    articleDAO.insert(article);

    response.sendRedirect("/sophos/article/" + Integer.toString(article.getId()));
  }
}
