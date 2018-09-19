#!/usr/bin/ruby
# encoding: utf-8

Encoding.default_external = Encoding::UTF_8

require "json"
require "sinatra"
require "slim"
require "slim/include"

config_file = "config.json"

begin
    $config = JSON.parse(File.read(config_file))
rescue Exception => e
    $stderr.puts "Please rename config_template.json to #{config_file} and edit it"
    raise e
end

set :public_folder, File.join(File.dirname(__FILE__),'public')
set :show_exceptions, false
use Rack::Session::Cookie,  :key => 'rack.session',
                            :domain => $config['domain'],
                            :path => '/',
                            :expire_after => 86400*2,#Inseconds
                            :secret => SecureRandom.hex # Kills all sessions on restart, which is fine

get '/' do
    @sitekey = $config['sitekey']
    slim :main
end

get '/agenda' do
    @agenda_url = $config.dig("agendas").map{ |a|
        "src=#{a['agenda_id']}%40group.calendar.google.com&color=%23#{a['color']}"
    }.join('&')
    slim :agenda
end

get '/links' do
    slim :links
end

get '/about' do
    slim :about
end
