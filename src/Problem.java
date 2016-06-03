package sophos;

public class Problem {
  private int id, article_id;
  private String name, link;

  public Problem() {}

  public int getId() { return this.id; }
  public void setId(int id) { this.id = id; }

  public int getArticleId() { return this.article_id; }
  public void setArticleId(int id) { this.article_id = id; }

  public String getName() { return this.name; }
  public void setName(String name) { this.name = name; }

  public String getLink() { return this.link; }
  public void setLink(String link) { this.link = link; }
}
