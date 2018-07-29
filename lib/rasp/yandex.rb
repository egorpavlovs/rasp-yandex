require "rasp/yandex/version"
require "faraday"
require "faraday_middleware"
require "json"

module Rasp
  module Yandex
    class Client

      URL = "https://api.rasp.yandex.net"

      def initialize(api_key = nil, api_version = nil)
            @api_key = api_key || ENV["RASP_YANDEX_API_KEY"]
            @api_version = "3.0" || ENV["RASP_YANDEX_API_VERSION"]

      end

      def all_stations(default_params = nil)
        conn = Faraday.new(url: URL) do |faraday|
          faraday.request  :url_encoded
          faraday.response :json, content_type: /\bjson$/
          faraday.adapter  Faraday.default_adapter
        end
        conn.get "/v#{@api_version}/stations_list/?apikey=#{@api_key}", default_params
      end

      def timetable_between_stations(from, to, date = nil, default_params = nil)
        conn = Faraday.new(url: URL) do |faraday|
          faraday.request  :url_encoded
          faraday.response :json, content_type: /\bjson$/
          faraday.adapter  Faraday.default_adapter
        end
        conn.get "/v#{@api_version}/search/?apikey=#{@api_key}&from=#{from}&to=#{to}&date=#{date}", default_params
      end

      def timetable_at_station(station, date = nil, default_params = nil)
        conn = Faraday.new(url: URL) do |faraday|
          faraday.request  :url_encoded
          faraday.response :json, content_type: /\bjson$/
          faraday.adapter  Faraday.default_adapter
        end
        conn.get "/v#{@api_version}/schedule/?apikey=#{@api_key}&station=#{station}&date=#{date}", default_params
      end

      def near_stations(latitude, longitude,  distance, default_params = nil)
        conn = Faraday.new(url: URL) do |faraday|
          faraday.request  :url_encoded
          faraday.response :json, content_type: /\bjson$/
          faraday.adapter  Faraday.default_adapter
        end
        conn.get "/v#{@api_version}/nearest_stations/?apikey=#{@api_key}&lat=#{latitude}&lng=#{longitude}&distance=#{distance}", default_params
      end

      def near_city(latitude, longitude,  distance = nil, default_params = nil)
        conn = Faraday.new(url: URL) do |faraday|
          faraday.request  :url_encoded
          faraday.response :json, content_type: /\bjson$/
          faraday.adapter  Faraday.default_adapter
        end
        conn.get "/v#{@api_version}/nearest_settlement/?apikey=#{@api_key}&lat=#{latitude}&lng=#{longitude}&distance=#{distance}", default_params
      end

      def stations_of_route(uid, default_params = nil)
        conn = Faraday.new(url: URL) do |faraday|
          faraday.request  :url_encoded
          faraday.response :json, content_type: /\bjson$/
          faraday.adapter  Faraday.default_adapter
        end
        conn.get "/v#{@api_version}/thread/?apikey=#{@api_key}&uid=#{uid}", default_params
      end

      def information_about_carrier(code, default_params = nil)
        conn = Faraday.new(url: URL) do |faraday|
          faraday.request  :url_encoded
          faraday.response :json, content_type: /\bjson$/
          faraday.adapter  Faraday.default_adapter
        end
        conn.get "/v#{@api_version}/carrier/?apikey=#{@api_key}&code=#{code}", default_params
      end

      def copyright_yandex_rasp(format)
        conn = Faraday.new(url: URL) do |faraday|
          faraday.request  :url_encoded
          faraday.response :json, content_type: /\bjson$/
          faraday.adapter  Faraday.default_adapter
        end
        conn.get "https://api.rasp.yandex.net/v3.0/copyright/?apikey=#{apikey}&format=#{format}"
      end
    end

  end
end
