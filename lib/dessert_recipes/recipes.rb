class DessertRecipes::Recipes
  attr_accessor :name, :url, :description, :total_time, :serving, :ingredients, :instructions
  @@all = []

  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
end