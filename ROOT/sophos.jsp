<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,java.net.URLDecoder,sophos.Article,sophos.Category" %>
<!DOCTYPE html>
<html lang="pt">
  <head>
    <%@ include file="/common/header.html" %>
    <title>Sophos - Coding Wiki</title>
  </head>
  <body >
    <!-- Navigation Bar -->
    <%@ include file="/common/nav.html" %>

    <div id="wrapper">
      <%@ include file="/common/sidebar.html" %>

      <!-- Main Content -->
      <div id="page-content-wrapper">
        <div class="container-fluid">
          <div class="page-header">
            <% String searchString = (String)request.getAttribute("search"); %>
            <% if (searchString != null) { %>
              <h1>Search: <small> <%= searchString %></small></h1>
            <% } else { %>
              <h1>printf("Welcome\n") <small>// coding wiki</small></h1>
            <% } %>
          </div>
          <div class="col-sm-12">

            <% ArrayList<Category> categories = (ArrayList<Category>)request.getAttribute("categories"); %>
            <% ArrayList<ArrayList<Article>> articles = (ArrayList<ArrayList<Article>>)request.getAttribute("articles"); %>
            <% if (categories.size() > 0) { %>
              <% for (int i = 0; i < categories.size(); i++) { %>
                <div class="col-sm-6 col-md-4">
                  <ul class="list-unstyled category-list">
                    <li>
                      <span><%= URLDecoder.decode(categories.get(i).getName()) %></span>
                      <ul>
                        <% for (int j = 0; j < articles.get(i).size(); j++) { %>
                        <li><a href="sophos/article/<%=articles.get(i).get(j).getId()%>"><%= URLDecoder.decode(articles.get(i).get(j).getName()) %></a></li>
                        <% } %>
                    </ul>
                  </li>
                </ul>
              </div>
              <% } %>
            <% } else { %>
            <p><abbr title="'<%=searchString%>' not found... Sorry...">Here lies the search hopes!</abbr> :'(</p>
            <% } %>

        </div>
      </div>
    </div>

    <!-- Page footer -->
    <%@ include file="/common/footer.html" %>

    <!-- Scripts -->
    <%@ include file="/common/scripts.html" %>
  </body>
</html>
