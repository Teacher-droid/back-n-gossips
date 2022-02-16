class WelcomeController < ApplicationController
  def home
    @name = params[:name]
  end
end
