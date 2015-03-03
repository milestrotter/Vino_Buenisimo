require 'json'
require 'net/http'
require 'open-uri'

class TrendsController < ApplicationController

  def index
    @user = current_user
    @requested = false
  end

  def show
    params[:footnotes] = false
    @user = current_user
    puts "\n\n\n#{params}\n\n\n"
    $wine_uri = "http://services.wine.com/api/beta2/service.svc/json/catalog?filter=#{params[:filter]}&search=#{params[:search]}&sort=#{params[:sort]}&apikey=#{params[:apikey]}"

    encoded_url = URI.encode($wine_uri)
  	uri = URI.parse(encoded_url)
  	http = Net::HTTP.new(uri.host, uri.port)

    #to be able to access https URL, these lines should be added
  	# http.use_ssl = true
  	# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  	request = Net::HTTP::Get.new(uri.request_uri)
  	response = http.request(request)

  	data = response.body

  	wine = JSON.load(data)
    @wines = wine["Products"]["List"]
    # render :text => @wines
    # render trends_path
  end
end
