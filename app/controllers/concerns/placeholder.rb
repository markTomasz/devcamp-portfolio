module Placeholder
  extend ActiveSupport::Concern

  # creates a class method called image_generator
  def self.image_generator(height:, width:)
    "https://via.placeholder.com/#{height}x#{width}"
  end

  def self.berklee_test(page_name:)
    "https://online.berklee.edu/#{page_name}"
  end
end
