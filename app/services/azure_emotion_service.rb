class AzureEmotionService
  @@api_url = "https://westus.api.cognitive.microsoft.com"
  @@api_path = "/emotion/v1.0/recognize"

  def initialize
    @conn = Faraday.new url: @@api_url
  end

  def detect_by_url(url)
    resp = @conn.post @@api_path do |req|
      req.body = { url: url }.to_json
      req.headers['Content-Type'] = 'application/json'
      req.headers['Ocp-Apim-Subscription-Key'] = Rails.application.secrets.azure_emotion_api_key
    end
    puts resp.inspect
    JSON.parse(resp.body)
  end
end
