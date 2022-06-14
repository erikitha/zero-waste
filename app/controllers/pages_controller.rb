class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if current_user
     @name = current_user.name.split(" ")
    end
  end

  def profile
  end

  def yourfavorite
    @recipes = current_user.recipes
  end
end
