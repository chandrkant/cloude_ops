class UpdatePriceJob < ApplicationJob
  queue_as :price
  def perform(*args)
    # Do something later
    Pricing.price_on_demand_data_insert
  end
end
