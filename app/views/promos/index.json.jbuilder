json.array!(@promos) do |promo|
  json.extract! promo, :id, :description, :product, :shop, :location, :picture, :discount, :normal_price, :category
  json.url promo_url(promo, format: :json)
end
