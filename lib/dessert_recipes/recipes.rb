class DessertRecipes::Recipes
  attr_accessor :name, :url, :description, :ingredients, :instructions, :total_time, :serving
  @@all = []

  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
end