class UrlsController < ApplicationController
  def new
  	@shortened_url = Url.new
  end

  def create
  	@shortened_url = Url.new
  	@shortened_url.url = params[:url][:url]
  	if params[:url][:vanity] == ""
  	  loop do
  	    random_vanity = (0...8).map{65.+(rand(25)).chr}.join
  	    if Url.where(:vanity => random_vanity).length == 0
	        @shortened_url.vanity = random_vanity
	        break
        end
	    end
  	else
  	  @shortened_url.vanity = params[:url][:vanity]
  	end
  	# alternatively, new_url = Url.new(params[:url]) 	
  	# new_url.save
  	@shortened_url.save
  	flash[:shortened_vanity] = @shortened_url.vanity
  	redirect_to new_url_url
  	

  end

  def show
    # HTTP GET /urls/thing
    # params[:id] == 'thing'
  	@shortened_url = Url.where(:vanity => params[:id]).first
  	# active record methods to search
  	redirect_to @shortened_url.url 
  end

  def destroy
  end 
end