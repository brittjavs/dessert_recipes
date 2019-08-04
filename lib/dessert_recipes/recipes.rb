class DessertRecipes::Recipes
  attr_accessor :name, :url, :description, :ingredients, :instructions, :prep_time, :cook_time
  @@all = []
  
  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end