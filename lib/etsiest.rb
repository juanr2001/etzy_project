require 'pry'
require 'json'
require 'sinatra/base'
require 'etsy'
require "etsiest/version"

Etsy.api_key = ENV['ETSY_KEY']
#4ur39qgfjkrpiogytd6va45i

module Etsiest
    class App < Sinatra::Base


        get '/search' do
            response = Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], :keywords => 'cheese')
            @results = response.result
            erb :index
        end

        run! if app_file == $0

    end
binding.pry
end

