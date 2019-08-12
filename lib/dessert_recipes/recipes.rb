class DessertRecipes::Recipes
  attr_accessor :name, :url, :description, :total_time, :serving, :ingredients, :instructions, :scraped
  @@all = []
  def initialize(name, url)
    @name = name
    @url = url
    save
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
end