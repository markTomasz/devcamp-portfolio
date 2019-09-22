class PortfoliosController < ApplicationController
  def index # when you want to list a number of items
    @portfolio_items = Portfolio.all # calling the model inside the controller, making @port available to view
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio Item Created' }
      else
        format.html { render :new }
      end
    end

  end
end
