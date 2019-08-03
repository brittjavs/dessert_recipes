class DessertRecipes::Recipes
  attr_accessor :name, :url, :description, :ingredients, :instructions, :prep_time, :cook_time
  @@all = []
  
  def self.initialize(name, url)
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