class SubscriptionsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :customer_id, :tea_id, :price, :status, :frequency
end
