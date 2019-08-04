class DessertRecipes::Scraper
  
  def scrape_recipes
    doc = Nokogiri::HTML(open("https://www.loveandlemons.com/recipes/dessert-recipes"))
    doc.css(".lnl-rb-parent li").each do |recipe_card|
      recipe = DessertRecipes::Recipes.new
      recipe.name = recipe_card.css(".thumbnail_text_content").text.strip
      recipe.url = recipe_card.css("a").attribute("href").text
      
      recipe.save
  end
  end
  
  def scrape_recipe_info
end