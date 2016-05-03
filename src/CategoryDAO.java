package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import server.*;
import sophos.*;

public class CategoryDAO {
  private final Connection connec;
  public CategoryDAO(){
    this.connec = new ConnectionFactory().getConnection();
  }

  public Category create(){
    return new Category();
  }

  public void insert(Category category){
    String cmd = "insert into category (id, name) values (?,?)";
    try (PreparedStatement stmt = connec.prepareStatement(cmd, Statement.RETURN_GENERATED_KEYS)){
      stmt.setInt(1, category.getId());
      stmt.setString(2, category.getName());
      stmt.executeUpdate();
      ResultSet generatedKeys = stmt.getGeneratedKeys();
      if (generatedKeys.next())
        category.setId(generatedKeys.getInt(1));
    }
    catch(SQLException e){
      throw new RuntimeException(e);
    }
  }

  public void update(Category category){
    String cmd = "update category set id=?, name=?";
    try (PreparedStatement stmt = connec.prepareStatement(cmd)){
      stmt.setInt(1, category.getId());
      stmt.setString(2, category.getName());
      stmt.executeUpdate();
    }
    catch(SQLException e){
      throw new RuntimeException(e);
    }
  }

  public void delete(Category category){
    String cmd = "delete from category where id=?";
    try (PreparedStatement stmt = connec.prepareStatement(cmd)) {
      stmt.setInt(1, category.getId());

      stmt.executeUpdate();
      category.setId(0);
    } 
    catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  public List<Category> getList() {
    List<Category> list = new ArrayList<>();

    try (PreparedStatement stmt = connec.prepareStatement("select id,name from category")) {
      ResultSet rs = stmt.executeQuery();
      while (rs.next()) {
        Category c = new Category();
        c.setId(rs.getInt("id"));
        c.setName(rs.getString("name"));
        list.add(c);
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

    return list;
  }
}
