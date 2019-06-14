# frozen_string_literal: true
require "faraday_middleware"
require "date"
require "officevibe/client_middleware"
require "active_support/core_ext/module/delegation"
require "active_support/core_ext/string/inflections"
require "active_support/core_ext/hash/indifferent_access"
require "active_support/core_ext/object/to_query"

module Officevibe
  class Client
    attr_reader :auth_token, :connection

    delegate :get, to: :connection

    OFFICEVIBE_URL = "https://app.officevibe.com"
    MANAGEABLE_GROUPS_PATH = "/groups/manageable"
    ENGAGEMENT_REPORT_PATH = "/report/engagement"
    AUTH_TOKEN_COOKIE = "officevibe.auth"

    def initialize(auth_token)
      @auth_token = auth_token
      @connection = Faraday.new url: OFFICEVIBE_URL, headers: headers do |conn|
        conn.response :json, :content_type => /\bjson$/
        conn.response :raise_error
        conn.use Officevibe::ClientMiddleware
        conn.adapter Faraday.default_adapter
      end
    end

    def get_groups
      get(MANAGEABLE_GROUPS_PATH)
        .body["result"]
        .map { |obj| obj.deep_transform_keys(&:underscore) }
        .map(&:with_indifferent_access)
    end

    def get_engagement_report(group_id)
      get(ENGAGEMENT_REPORT_PATH, groupId: group_id)
        .body["data"]
        .deep_transform_keys(&:underscore)
        .with_indifferent_access
    end

    private

    def headers
      { "Cookie" => { AUTH_TOKEN_COOKIE => auth_token }.to_query }
    end
  end
end
