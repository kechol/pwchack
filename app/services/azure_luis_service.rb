class AzureLuisService
  @@api_url = "https://westus.api.cognitive.microsoft.com"
  @@api_path = "/luis/v2.0/apps/c413b2ef-382c-45bd-8ff0-f76d60e2a821"
  # @@api_path = "/luis/v2.0/apps/98b73de5-1e76-4a4f-bcae-12220b5c33fa" # relax

  def initialize
    @conn = Faraday.new url: @@api_url
  end

  def answer(query)
    resp = @conn.get @@api_path, {
      q: query,
      'subscription-key': Rails.application.secrets.azure_luis_api_key
    }
    JSON.parse(resp.body)
  end
end
