package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import server.*;
import sophos.*;

public class ProblemDAO {
  private final Connection connec;
  public ProblemDAO(){
    this.connec = new ConnectionFactory().getConnection();
  }

  public Problem create(){
    return new Problem();
  }

  public void insert(Problem problem){
    String cmd = "insert into problem (id, name, link, article_id) values (?,?,?,?)";
    try (PreparedStatement stmt = connec.prepareStatement(cmd, Statement.RETURN_GENERATED_KEYS)){
      stmt.setInt(1, problem.getId());
      stmt.setString(2, problem.getName());
      stmt.setString(3, problem.getName());
      stmt.setInt(4, problem.getArticleId());
      stmt.executeUpdate();
      ResultSet generatedKeys = stmt.getGeneratedKeys();
      if (generatedKeys.next())
        problem.setId(generatedKeys.getInt(1));
    }
    catch(SQLException e){
      throw new RuntimeException(e);
    }
  }

  public void update(Problem problem){
    String cmd = "update problem set id=?, name=?";
    try (PreparedStatement stmt = connec.prepareStatement(cmd)){
      stmt.setInt(1, problem.getId());
      stmt.setString(2, problem.getName());
      stmt.setString(3, problem.getName());
      stmt.setInt(4, problem.getArticleId());
      stmt.executeUpdate();
    }
    catch(SQLException e){
      throw new RuntimeException(e);
    }
  }

  public void delete(Problem problem){
    String cmd = "delete from problem where id=?";
    try (PreparedStatement stmt = connec.prepareStatement(cmd)) {
      stmt.setInt(1, problem.getId());
      stmt.executeUpdate();
      problem.setId(0);
    }
    catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  public List<Problem> getList() {
    List<Problem> list = new ArrayList<>();

    try (PreparedStatement stmt = connec.prepareStatement("select id,name,link,article_id from problem")) {
      ResultSet rs = stmt.executeQuery();
      while (rs.next()) {
        Problem c = new Problem();
        c.setId(rs.getInt("id"));
        c.setArticleId(rs.getInt("article_id"));
        c.setName(rs.getString("name"));
        c.setLink(rs.getString("link"));
        list.add(c);
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

    return list;
  }

  public List<Problem> getList(Article article) {
    List<Problem> list = new ArrayList<>();

    try (PreparedStatement stmt = connec.prepareStatement("select id,name,link,article_id from problem")) {
      ResultSet rs = stmt.executeQuery();
      while (rs.next()) {
        Problem c = new Problem();
        c.setId(rs.getInt("id"));
        c.setArticleId(rs.getInt("article_id"));
        c.setName(rs.getString("name"));
        c.setLink(rs.getString("link"));
        if (c.getArticleId() == article.getId()) list.add(c);
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

    return list;
  }
}
