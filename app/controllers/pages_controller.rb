class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :landing ]

  def home
    if current_user
     @name = current_user.name.split(" ")
    end
  end

  def landing

  end

  def profile
  end
end
