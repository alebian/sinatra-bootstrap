require 'sinatra'
require 'sinatra/custom_logger'
require 'sinatra/reloader'
require 'pagy'

require_relative '../lib/boot'
require_rel 'helpers'

module Web
  class Base < Sinatra::Base
    include Pagy::Backend
    include Helpers::JSON

    configure :development do
      register Sinatra::Reloader
    end

    private

    def pagy_get_vars(collection, vars)
      {
        count: collection.count,
        page: params[:page],
        items: vars[:items] || 25
      }
    end

    def serialize_paginated(pagy, data)
      {
        data: data,
        current_page: pagy.page,
        per_page: pagy.items,
        total_pages: pagy.pages,
        total_elements: pagy.count
      }
    end
  end
end
