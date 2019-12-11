class PricingsController < ApplicationController

  def index
    json_response(Pricing.on_demand_data)
  end

  def price_data
    json_response(Pricing.response_data(params[:date],params[:region]))
  end

end
