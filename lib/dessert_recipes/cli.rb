class DessertRecipes::CLI
  def call
    welcome
    DessertRecipes::Scraper.scrape_recipes
    list_recipes
    get_recipe
  end
  
  def welcome
  puts "Welcome! You have reached the dessert recipe index."
  end

  def list_recipes
  DessertRecipes::Recipes.all.take(30).each_with_index do |recipe, index|
    puts "#{index + 1}. #{recipe.name}"
  end
  end
  
def get_recipe
   input = nil
   puts "Please enter the number for recipe you would like to view."
   while input != "exit"
   input = gets.strip
  
   if input.to_i.between?(1, 50)
     recipe = DessertRecipes::Recipes.all[input.to_i-1]
     puts recipe.name
     puts ""
     DessertRecipes::Scraper.scrape_recipe_info(recipe)
     puts recipe.description
     puts "\nTotal Time (Prep + Cook Time):"
     puts recipe.total_time
     puts ""
     puts recipe.serving
     puts "\nIngredients"
     puts recipe.ingredients
     puts "\nInstructions"
     recipe.instructions.each_with_index {|step, index|
       puts "#{index + 1}. #{step}"}
     puts "\nIf you would like to view another recipe, please enter 'menu'. If you would like to exit, enter 'exit'."
     
    elsif input == "menu"
      puts "Here is the recipe index."
      list_recipes
      puts "\nPlease enter the number for recipe you would like to view."
      
    elsif input == "exit"  
      puts "Remember: You are what you eat, so eat something sweet! Goodbye"
      exit
      
    else
      puts "Invalid entry"
    end
  end
 end
 
end