class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: %i[show edit update destroy]
  layout 'portfolio'
  access all: %i[show index angular], user: {except: %i[destroy new create update edit]}, site_admin: :all

  # when you want to list a number of items
  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    head :ok
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def show
  end

  def new
    @portfolio_item = Portfolio.new

    # build: instantiates 3 versions of the portfolio item
    3.times { @portfolio_item.technologies.build }
  end

  def create
    # strong parameters. verififies anything getting passed in belongs/corresponds to something already in the database
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio Item Created' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
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

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name])
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
