<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,java.net.URLDecoder,sophos.Article,sophos.Category" %>
<!DOCTYPE html>
<html lang="pt">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>Sophos - Coding Wiki</title>

    <!-- Bootstrap -->
    <link href="/vendor/bootstrap.min.css" rel="stylesheet">
    <link href="/vendor/font-awesome.min.css" rel="stylesheet">
    <link href="/vendor/simple-sidebar.css" rel="stylesheet">

    <link href="/styles/style.css" rel="stylesheet">
  </head>
  <body >
    <!-- Navigation Bar -->
    <header>
      <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid" id="menu">
          <div class="navbar-header">
            <a class="navbar-brand" href="/sophos" id="menu-brand">
              <span class="fa fa-code fa-lg"></span> Sophos
            </a>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>

          <div class="collapse navbar-collapse">
            <div class="navbar-form navbar-left">
              <div class="form-group has-feedback">
                <form action="/sophos" method="GET">
                  <input type="text" name="search" class="form-control" placeholder="Search">
                  <i class="form-control-feedback glyphicon glyphicon-search"></i>
                </form>
              </div>
            </div>
            <div class="nav navbar-nav navbar-right">
              <p class="navbar-text hidden-xs"><i class="fa fa-user"></i> Username </p>
              <button type="button" class="btn btn-default navbar-btn">Sign in</button>
              <!--<button type="button" class="btn btn-default navbar-btn">Register</button>-->
            </div>
          </div>
        </div>
      </nav>
    </header>

    <div id="wrapper">
      <div id="sidebar-wrapper">
        <ul class="sidebar-nav">
          <li><a href="#">Categories</a></li>
          <li><a href="#">Articles</a></li>
        </ul>
      </div>
      <div id="sidebar-toggle" data-toggle="toggle" data-target="#wrapper">
        <span class="fa fa-arrow-circle-left fa-lg"></span>
      </div>

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
    <footer>
      <div class="text-center">
        <small>&copy; &lt;Sophos 2016&gt;</small>
      </div>
    </footer>

    <!-- Plugins -->
    <script src="/vendor/jquery-2.1.3.min.js"></script>
    <script src="/vendor/bootstrap.min.js"></script>
    <script src="/vendor/anchor.min.js"></script>
    <script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML"></script>

    <!-- Scripts -->
    <script src="/js/scripts.js"></script>
  </body>
</html>
