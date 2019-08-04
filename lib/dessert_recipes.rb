require "bundler/setup"
require 'pry'
require 'nokogiri'
require 'open-uri'

module DessertRecipes
require_relative './dessert_recipes/scraper'
require_relative './dessert_recipes/cli'
require_relative './dessert_recipes/version'
require_relative './dessert_recipes/recipes'
end
