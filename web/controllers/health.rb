module Web
  module Controllers
    class Health < Web::Base
      get '/health' do
        Redis.new.get('ping') if defined?(Redis)
        ActiveRecord::Base.connection.execute('SELECT 1;') if defined?(ActiveRecord::Base)

        json 200, {}
      end
    end
  end
end
