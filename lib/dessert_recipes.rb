module DessertRecipes
  # class Error < StandardError; end
  # # Your code goes here...
end

require "bundler/setup"
require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './dessert_recipes/scraper'
require_relative './dessert_recipes/cli'
require_relative './dessert_recipes/version'
require_relative './dessert_recipes/recipes'