class Pricing < ApplicationRecord

  def self.fetch_api
    url = 'https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudFront/current/index.json'
    req = RestClient.get(url)
    resp = JSON.parse(req)
    return resp
  end

end
