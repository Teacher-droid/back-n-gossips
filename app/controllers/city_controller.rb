class CityController < ApplicationController

  def new
    @city = City.new(name: @ville)
  end

  def show
   @city = City.find(1)
   @gossips_city = City.find(1).gossips
   #puts @gossips_city
   #@city = City.find(params[:id])
   #@gossips_city = City.find(params[:id]).gossips
  end
end

