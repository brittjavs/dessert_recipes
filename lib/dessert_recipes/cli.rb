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
  DessertRecipes::Recipes.all.take(50).each_with_index do |recipe, index|
    puts "#{index + 1}. #{recipe.name}"
  end
  end
  
def select_recipe
   input = ""
   while input != "exit"
   puts "Please enter the number for recipe you would like to view."
   input = gets.strip
  
   if input.to_i.between?(1, 50)
     recipe = DessertRecipes::Recipes.all[input.to_i-1]
     puts recipe.name
     puts ""
     DessertRecipes::Scraper.scrape_recipe_info(recipe)
     puts recipe.description
     puts ""
     puts "Total Time (Prep + Cook Time):"
     puts recipe.total_time
     puts ""
     puts recipe.serving
     puts ""
     puts "Ingredients"
     puts recipe.ingredients
     puts ""
     puts "Instructions"
     puts recipe.instructions

    # binding.pry
   end
 end
 end
end