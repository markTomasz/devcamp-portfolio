class PortfoliosController < ApplicationController
  def index # when you want to list a number of items
    @portfolio_items = Portfolio.all # calling the model inside the controller, making @port available to view
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
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

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    # perform the lookup
    @portfolio_item = Portfolio.find(params[:id])

    # destroy the record
    @portfolio_item.destroy

    # redirect
    respond_to do |format|
      format.html {
        redirect_to portfolios_url, notice: 'Portfolio Item was removed'
      }
    end
  end
end
