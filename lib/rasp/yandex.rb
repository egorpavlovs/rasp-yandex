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

      def all_stations(format = "json", lang = "ru_ru")
        conn = Faraday.new(url: URL) do |faraday|
          faraday.request  :url_encoded
          faraday.response :json, content_type: /\bjson$/
          faraday.adapter  Faraday.default_adapter
        end
        conn.get "/v#{@api_version}/stations_list/?apikey=#{@api_key}&lang=#{lang}&format=#{format}"
      end
    end

  end
end
