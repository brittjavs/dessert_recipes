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
    page = Nokogiri::HTML(open("https://www.loveandlemons.com/vegan-chocolate-chip-cookies/"))
    description = page.css(".entry-header h2").text
    total_time = page.css(".ERSTimeItem")[2].text
    serving = page.css(".ERSServes").text
    # ingredients = page.css(".ERSIngredients").collect do |item| page.css(".ingredient").first.text
    # instructions = page.css(".ERSInstructions").collect do |li| li.css(".instruction").text.split(".")
  end
end
# end
# end