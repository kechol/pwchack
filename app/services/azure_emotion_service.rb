class AzureEmotionService
  @@api_url = "https://westus.api.cognitive.microsoft.com"
  @@api_path = "/emotion/v1.0/recognize"

  def initialize
    @conn = Faraday.new url: @@api_url
  end

  def detect_by_url(url)
    resp = @conn.get @@api_path do |req|
      req.params['url'] = url
      req.headers['Ocp-Apim-Subscription-Key'] = Rails.application.secrets.azure
    end
    JSON.parse(resp.body)
  end
end
