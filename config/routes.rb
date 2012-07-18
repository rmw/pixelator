Rails.application.routes.draw do
  match "/pixelator/data" => "pixelator#data", :as => :pixelator_data
end
