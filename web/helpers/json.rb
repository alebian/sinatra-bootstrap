module Helpers
  module JSON
    def json(code, body = {})
      [
        code,
        body.to_json
      ]
    end

    def parsed_body
      @parsed_body ||= Oj.load(request.body.read)
    end
  end
end
