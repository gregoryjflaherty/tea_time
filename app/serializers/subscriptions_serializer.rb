class SubscriptionsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :customer_id, :tea_id, :price, :status, :frequency, :created_at, :updated_at
end
