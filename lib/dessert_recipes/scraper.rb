class DessertRecipes::Scraper
  
  def self.scrape_recipes
    doc = Nokogiri::HTML(open("https://www.loveandlemons.com/recipes/dessert-recipes"))
    doc.css(".lnl-rb-parent li.ri-cat-dessert").each do |recipe_card|

      DessertRecipes::Recipes.create_from_scrape(recipe_card)
    end
  end
  
  def self.scrape_recipe_info(recipe)
  if recipe.ingredients == nil
    url = recipe.url
    page = Nokogiri::HTML(open(recipe.url))
    recipe.description = page.css(".entry-header h2").text
    if page.css("time[itemprop=totalTime]").text != ""
      recipe.total_time = page.css("time[itemprop=totalTime]").text
    else
      recipe.total_time = "Not Available"
    end
    if page.css(".ERSServes").text != ""
      recipe.serving = page.css(".ERSServes").text
    else
      recipe.serving = "Not Available"
    end
    recipe.ingredients = page.css(".ingredient").map(&:text)
    recipe.instructions = page.css(".instruction").map(&:text)
    end
  end

end
