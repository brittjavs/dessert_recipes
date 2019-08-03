class DessertRecipes::Scraper
  def self.scrape_main_page
    recipes = []
    doc = Nokogiri::HTML(open("https://www.loveandlemons.com/recipes/dessert-recipes"))
    doc.css(".lnl-rb-parent li").each do |recipe|
    recipes << {:name => recipe.css(".thumbnail_text_content").text.strip,
      :url => recipe.css("a").attribute("href").value}
    binding.pry
  end
  end
end