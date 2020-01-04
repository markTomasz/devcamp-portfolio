class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all # places value of SKills db query into the instance var, ready to be used in the view.
  end

  def about
    @skills = Skill.all.order("id ASC")
  end

  def contact
  end

  def tech_news
    @tweets = SocialTool.twitter_seach
  end
end
