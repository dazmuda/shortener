class UrlsController < ApplicationController
  def new
  	@shortened_url = Url.new
  end

  def create
  	@shortened_url = Url.new
  	@shortened_url.url = params[:url][:url]
  	# alternatively, new_url = Url.new(params[:url]) 	
  	# new_url.save
  	@shortened_url.save
  	flash[:shortened_id] = @shortened_url.id
  	redirect_to new_url_url
  end

  def show
  	@shortened_url = Url.find(params[:id])
  	p @shortened_url
  	redirect_to @shortened_url.url 
  end

  def destroy
  end 
end