class PortfoliosController < ApplicationController
  def index # when you want to list a number of items
    @portfolio_items = Portfolio.all # calling the model inside the controller, making @port available to view
  end
end
