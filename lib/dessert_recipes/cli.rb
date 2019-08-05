class DessertRecipes::CLI
  def call
    welcome
    # list recipes
    # select_recipe
  end
  
  def welcome
  puts "You have reached the dessert recipe index."
  end
end
#   def list_recipes
#     recipes = DessertRecipes::Recipes.all.each_with_index do|recipe, index|
#     puts "#{index + 1}. #{recipe.name}"
#   end
  
#   def select_recipe
#     input = ""
#   while input != "exit"
#   puts "Which recipe would you like to view?"
#   input = gets.strip
  
#   if input.to_i < DessertRecipes::Recipes.all.size
#     recipe = DessertRecipes::Recipes.all[input.to_i-1]
#     puts "#{recipe.description}"
#     puts "Total Cooking Time: #{recipe.total_time}"
#     puts "#{recipe.serving}"
#     puts "Ingredients: #{recipe.ingredients}"
#     puts "Instructions :#{recipe.instructions}"
#   end
# end