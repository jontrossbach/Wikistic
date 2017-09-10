class PagesController < ApplicationController
  def home
  	@schools = School.all
  end

  def search

  	if params[:search].present? && params[:search].strip != ""
  		session[:loc_search] = params[:search]
  	end

  	arrSchools = Array.new

  	if session[:loc_search] && session[:loc_search] != ""
  		@schools_address = School.where(active: true).near(session[:loc_search], 5, order: 'distance')
  	else
  		@schools_address = School.where(active: true).all
  	end

  	@search = @schools_address.ransack(params[:q])
  	@schools = @search.result

  	@arrSchools = @schools.to_a

  	end

end
