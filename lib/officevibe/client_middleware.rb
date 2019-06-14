# frozen_string_literal: true

module Officevibe
  Error = Class.new(StandardError)
  InvalidAuthToken = Class.new(Officevibe::Error)

  class ClientMiddleware < Faraday::Response::Middleware
    def on_complete(env)
      case env[:status]
      when 302
        raise Officevibe::InvalidAuthToken, JSON.parse(env.body)["message"]
      end
    end
  end
end
