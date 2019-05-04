class RestaurantsApi
  def initialize
    @conn = Faraday.new(url: Settings.gurunavi.base_url) do |faraday|
              faraday.response :logger
              faraday.adapter Faraday.default_adapter
              faraday.headers['Content-Type'] = 'application/json'
              faraday.params['keyid'] = Settings.gurunavi.api_key
            end
  end

  def restaurants
    response = @conn.get do |req|
                 req.params['areacode_s'] = 'AREAS2818'
               end
    JSON.parse(response.body)['rest']
  end
end
