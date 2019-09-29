class Portfolio < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails") }

  # automatically runs when NEW action happens in portfolios.
  # sets default values for new portfolio items.
  after_initialize :set_defaults

  def set_defaults
    # '=' will override anything put in manually. 
    # '||=' is 'if self.main_image == nil {self.main_image = 'https://...}
    # basically a conditional =
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '300', width: '200')
  end
end
