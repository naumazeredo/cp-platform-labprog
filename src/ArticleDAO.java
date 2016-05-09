package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import server.*;
import sophos.*;

public class ArticleDAO {
  private final Connection connec;
  public ArticleDAO(){
    this.connec = new ConnectionFactory().getConnection();
  }

  public Article create(){
    return new Article();
  }

  public void insert(Article article){
    String cmd = "insert into article (id, name, id_category, name_category, content) values (?, ?, ?, ?, ?)";
    try (PreparedStatement stmt = connec.prepareStatement(cmd, Statement.RETURN_GENERATED_KEYS)){
      stmt.setInt(1, article.getId());
      stmt.setString(2, article.getName());
      stmt.setInt(3, article.getCategory().getId());
      stmt.setString(4, article.getCategory().getName());
      stmt.setString(5, article.getContent());
      stmt.executeUpdate();
      ResultSet generatedKeys = stmt.getGeneratedKeys();
      if (generatedKeys.next())
        article.setId(generatedKeys.getInt(1));
    }
    catch(SQLException e){
      throw new RuntimeException(e);
    }
  }

  public void update(Article article){
    String cmd = "update article set id=?, name=?, category.id=?, category.name=?, content=?";
    try (PreparedStatement stmt = connec.prepareStatement(cmd)){
      stmt.setInt(1, article.getId());
      stmt.setString(2, article.getName());
      stmt.setInt(3, article.getCategory().getId());
      stmt.setString(4, article.getCategory().getName());
      stmt.setString(5, article.getContent());
      stmt.executeUpdate();
    }
    catch(SQLException e){
      throw new RuntimeException(e);
    }
  }

  public void delete(Article article){
    String cmd = "delete from article where id=?";
    try (PreparedStatement stmt = connec.prepareStatement(cmd)) {
      stmt.setInt(1, article.getId());

      stmt.executeUpdate();
      article.setId(0);
    } 
    catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  public Article getById(int id) {
    try (PreparedStatement stmt = connec.prepareStatement("select id,name,content from article where id=?")) {
      stmt.setInt(1, id);

      ResultSet rs = stmt.executeQuery();
      if (rs.next()) {
        Article a = new Article();
        a.setId(rs.getInt("id"));
        a.setName(rs.getString("name"));
        a.setContent(rs.getString("content"));
        return a;
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

    return null;
  }

  public Article getByName(String name) {
    try (PreparedStatement stmt = connec.prepareStatement("select id,name,content from article where name=?")) {
      stmt.setString(1, name);

      ResultSet rs = stmt.executeQuery();
      if (rs.next()) {
        Article a = new Article();
        a.setId(rs.getInt("id"));
        a.setName(rs.getString("name"));
        a.setContent(rs.getString("content"));
        return a;
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

    return null;
  }

  public List<Article> getList() {
    List<Article> list = new ArrayList<>();

    try (PreparedStatement stmt = connec.prepareStatement("select id,name,content from article")) {
      ResultSet rs = stmt.executeQuery();
      while (rs.next()) {
        Article a = new Article();
        a.setId(rs.getInt("id"));
        a.setName(rs.getString("name"));
        a.setContent(rs.getString("content"));
        list.add(a);
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

    return list;
  }

  public List<Article> getListFromCategory(Category category) {
    List<Article> list = new ArrayList<>();

    try (PreparedStatement stmt = connec.prepareStatement("select id,name,content from article where category_id=?")) {
      stmt.setInt(1, category.getId());

      ResultSet rs = stmt.executeQuery();
      while (rs.next()) {
        Article a = new Article();
        a.setId(rs.getInt("id"));
        a.setName(rs.getString("name"));
        a.setContent(rs.getString("content"));
        list.add(a);
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

    return list;
  }
}
