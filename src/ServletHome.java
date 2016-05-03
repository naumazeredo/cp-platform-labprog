import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.ArrayList;
import java.util.List;

import sophos.*;
import dao.*;

public class ServletHome extends HttpServlet {
  public void processRequest(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    PrintWriter out = response.getWriter();

    String search = "";
    if (request.getParameter("search") != null) {
      search = request.getParameter("search");
      if (search.length() > 0)
        request.setAttribute("search", search);
    }

    List<String> categories = new ArrayList<String>();
    List<List<String>> articles = new ArrayList<List<String>>();

    List<Category> categoryList = (new CategoryDAO()).getList();
    for (int i = 0; i < categoryList.size(); i++) {
      List<Article> articleList = (new ArticleDAO()).getListFromCategory(categoryList.get(i));
      if (articleList.size() > 0) {
        categories.add(categoryList.get(i).getName());

        List<String> buffer = new ArrayList<String>();
        for (int j = 0; j < articleList.size(); j++)
          buffer.add(articleList.get(j).getName());

        articles.add(buffer);
      }
    }

    request.setAttribute("categories", categories);
    request.setAttribute("articles", articles);

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
