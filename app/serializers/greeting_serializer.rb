class GreetingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :message
end
