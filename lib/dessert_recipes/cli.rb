class DessertRecipes::CLI
  def call
    welcome
    DessertRecipes::Scraper.scrape_recipes
    list_recipes
    select_recipe
  end
  
  def welcome
  puts "You have reached the dessert recipe index."
  end

  def list_recipes
  DessertRecipes::Recipes.all.each_with_index do |recipe, index|
    puts "#{index + 1}. #{recipe.name}"
  end
  end

def select_recipe
     input = ""
   while input != "exit"
   puts "Please enter the number for recipe you would like to view."
   input = gets.strip
  
#   if input.to_i < DessertRecipes::Recipes.all.size
#     recipe = DessertRecipes::Recipes.all[input.to_i-1]
#     puts "#{recipe.description}"
#     puts "Total Cooking Time: #{recipe.total_time}"
#     puts "#{recipe.serving}"
#     puts "Ingredients: #{recipe.ingredients}"
#     puts "Instructions :#{recipe.instructions}"
   end
 end
end