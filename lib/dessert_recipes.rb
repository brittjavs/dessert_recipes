require 'pry'
require 'nokogiri'
require 'open-uri'
require 'colorize'
require 'word_wrap/core_ext'
require 'word_wrap'

module DessertRecipes
require_relative './dessert_recipes/scraper'
require_relative './dessert_recipes/cli'
require_relative './dessert_recipes/version'
require_relative './dessert_recipes/recipes'
end
