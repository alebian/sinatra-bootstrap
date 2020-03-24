require 'sinatra'
require 'sinatra/reloader'

require_relative '../lib/boot'
require_rel 'helpers'

module Web
  class App < Sinatra::Base
    include Helpers::JSON

    configure :development do
      register Sinatra::Reloader
    end
  end
end
