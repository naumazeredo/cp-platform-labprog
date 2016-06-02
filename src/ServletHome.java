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

    List<Category> categories = new ArrayList<Category>();
    List<List<Article>> articles = new ArrayList<List<Article>>();

    // Get all categories
    List<Category> categoryList = (new CategoryDAO()).getList();
    for (int i = 0; i < categoryList.size(); i++) {
      // Get the list of all articles for the category
      List<Article> articleList = (new ArticleDAO()).getListFromCategory(categoryList.get(i));
      if (articleList.size() > 0) {
        List<Article> buffer = new ArrayList<Article>();

        // Search matched category name
        if (categoryList.get(i).getName().toLowerCase().contains(search.toLowerCase())) {
          buffer = articleList;
        } else {
          for (int j = 0; j < articleList.size(); j++) {
            String articleName = articleList.get(j).getName();

            // If not searching or article name contains the search string, add to the list
            if (search.length() == 0 || articleName.toLowerCase().contains(search.toLowerCase())) {
              buffer.add(articleList.get(j));
            }
          }
        }

        // Only add the category if the is some article in it
        if (buffer.size() > 0) {
          categories.add(categoryList.get(i));
          articles.add(buffer);
        }
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
