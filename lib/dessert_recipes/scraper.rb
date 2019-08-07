class DessertRecipes::Scraper
  
  def self.scrape_recipes
    doc = Nokogiri::HTML(open("https://www.loveandlemons.com/recipes/dessert-recipes"))
    doc.css(".lnl-rb-parent li.ri-cat-dessert").each do |recipe_card|
      recipe = DessertRecipes::Recipes.new
      recipe.name = recipe_card.css(".thumbnail_text_content").text.strip
      recipe.url = recipe_card.css("a").attribute("href").text
      recipe.save
    end
  end
  
  def self.scrape_recipe_info(recipe)
    url = recipe.url
    page = Nokogiri::HTML(open(recipe.url))
    recipe.description = page.css(".entry-header h2").text
    recipe.total_time = page.css("time[itemprop=totalTime]").text
    recipe.serving = page.css(".ERSServes").text
    recipe.ingredients = page.css(".ingredient").map(&:text)
    recipe.instructions = page.css(".instruction").map(&:text)
  end
    
  end
