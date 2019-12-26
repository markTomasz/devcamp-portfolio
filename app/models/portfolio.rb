class Portfolio < ApplicationRecord
  has_many :technologies
  # base implementation for adding a form field for tags in New Portfolio
  # reject_if attribute name is blank
  # create a single port item, add multiple tech tags
  # accepts NESTED ITEMS, ie multiple tags
  # console: Portfolio.create!(title: 'fsdjfds', body: 'dkshfkdsjf', technologies_attributes: [{}, {}, {}])
  accepts_nested_attributes_for :technologies, allow_destroy: true,  reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order('position ASC')
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails") }
end


