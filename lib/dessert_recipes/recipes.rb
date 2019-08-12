class DessertRecipes::Recipes
  attr_accessor :name, :url, :description, :total_time, :serving, :ingredients, :instructions, :scraped
  @@all = []
  def initialize(name, url)
    @name = name
    @url = url
    save
  end
  
  def self.create_from_scrape(recipe_card)
    name = recipe_card.css(".thumbnail_text_content").text.strip
    url = recipe_card.css("a").attribute("href").text
    DessertRecipes::Recipes.new(name, url)
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
end