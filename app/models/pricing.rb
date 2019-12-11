class Pricing < ApplicationRecord

  def self.fetch_api
    resp = {}
    url = 'https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudFront/current/index.json'
    req = RestClient.get(url)
    resp = JSON.parse(req)
    return resp
  end

  def self.on_demand_data
    return fetch_api['terms']['OnDemand']
  end

  def self.product_data
    return fetch_api['products']
  end

  def self.data_for_insert(key, data,_data)
    _keys = data[key].keys
    _key = _keys[0]
    price_dimensions = data[key][_key]['priceDimensions']
    effective_date = data[key][_key]['effectiveDate']
    products_attributes = _data['products'][key]['attributes']
    __keys = price_dimensions.keys
    _price_dimensions_array = []
    __keys.each do |_key_|
      _price_dimensions_array << {
        sku: key,
        rate_code: price_dimensions[_key_]['rateCode'],
        description: price_dimensions[_key_]['description'],
        begin_range: price_dimensions[_key_]['beginRange'],
        end_range: price_dimensions[_key_]['endRange'],
        unit: price_dimensions[_key_]['unit'],
        price_per_unit: price_dimensions[_key_]['pricePerUnit']['USD'],
        effective_date: effective_date,
        location: create_slag(products_attributes),
        servicename: products_attributes['servicename']
      }
    end
    return _price_dimensions_array
  end

  def self.price_on_demand_data_insert
    _data = on_demand_data
    _all_data = fetch_api
    _keys = _data.keys
    _keys.each do |_key|
      self.insert_all(data_for_insert(_key,_data,_all_data))
    end
  end

  def self.response_data(date = nil,region='india')
    _attrs = 'location, description, begin_range as beginRange, end_range as endRange, unit, price_per_unit as pricePerUnit,effective_date as effectiveDate'
    if date
       data = self.select(_attrs).where('date(effective_date)=? && location=?',date.to_date,region.downcase)
    else
       data = self.select(_attrs).where('location=?',region.downcase)
    end
    data.as_json(:except => :id)
  end

  def self.create_slag(products_attributes)
    if products_attributes['location']
      products_attributes['location'].parameterize
    elsif products_attributes['fromLocation']
      products_attributes['fromLocation'].parameterize
    else
      ''
    end
  end
end
