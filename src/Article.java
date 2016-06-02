package sophos;

import sophos.Category;

public class Article {
  private String name;
  private int id;
  private Category category;
  private String content;

  public Article(){}

  public int getId() { return this.id; }
  public void setId(int id) { this.id = id; }

  public String getName() { return this.name; }
  public void setName(String name) { this.name = name; }

  public String getContent() { return this.content; }
  public void setContent(String content) { this.content = content; }

  public Category getCategory() { return this.category; }
  public void setCategory(Category category) { this.category = category; }
}
