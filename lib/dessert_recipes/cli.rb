class DessertRecipes::CLI
  def call
    welcome
    list_recipes
    get_recipe
  end
  
  def welcome
  puts "\nWelcome! Browse through the recipes list of delicious desserts and when you are ready, enter the number for the recipe you would like to view. To exit, type 'exit'.".colorize(:yellow)
  puts "\n=============================================================================\n".colorize(:yellow)
  end

  def list_recipes
  DessertRecipes::Scraper.scrape_recipes
  DessertRecipes::Recipes.all.take(30).each_with_index do |recipe, index|
    puts "#{index + 1}. #{recipe.name}"
  end
  end
  
def get_recipe
   input = nil
   while input != "exit"
   input = gets.strip
  
   if input.to_i.between?(1, 30)
     recipe = DessertRecipes::Recipes.all[input.to_i-1]
     puts recipe.name.colorize(:yellow)
     puts "=============================================================================".colorize(:yellow)
     DessertRecipes::Scraper.scrape_recipe_info(recipe)
     puts WordWrap.ww(recipe.description, 80)
     puts "\nTotal Time (Prep + Cook Time):"
     puts recipe.total_time
     puts ""
     puts recipe.serving
     puts "\nIngredients"
     puts recipe.ingredients
     puts "\nInstructions"
     recipe.instructions.each_with_index {|step, index|
       puts "\n#{index + 1}. #{step}\n".wrap(80)}
     puts "\nIf you would like to view another recipe, please enter 'list'. If you would like to exit, enter 'exit'.".colorize(:green)
     
    elsif input == "list"
      puts "\nYou have returned to the recipe list.\n".colorize(:yellow)
      puts "=============================================================================".colorize(:yellow)
      list_recipes
      puts "\nPlease enter the number for recipe you would like to view.".colorize(:green)
      
    elsif input == "exit"  
      puts "Remember: You are what you eat, so eat something sweet! Goodbye!".colorize(:light_blue)
      exit
      
    else
      puts "Invalid entry! To return to the recipe list, enter 'list'. To exit, enter 'exit'.".colorize(:red)
    end
  end
 end
 
end