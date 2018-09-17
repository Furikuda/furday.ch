#!/usr/bin/ruby
# encoding: utf-8

Encoding.default_external = Encoding::UTF_8

require "sinatra"
require "slim"
require "slim/include"

set :public_folder, File.join(File.dirname(__FILE__),'public')
set :show_exceptions, false 
use Rack::Session::Cookie,  :key => 'rack.session',
                            :domain=>'furday.duckdns.org',
                            :path=>'/',
                            :expire_after=>86400*2,#Inseconds
                            :secret=> SecureRandom.hex # Kills all sessions on restart, which is fine


get '/' do
    slim :main
end

get '/about' do
    slim :about
end
