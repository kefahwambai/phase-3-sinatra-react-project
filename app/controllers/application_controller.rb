class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

    # Get all mushrooms
  get '/mushrooms' do
    content_type :json
    mushrooms = Mushroom.all
    mushrooms.to_json
  end

  # Get a specific mushroom by ID
  get '/mushrooms/:id' do
    content_type :json
    mushroom = Mushroom.find(params[:id])
    mushroom.to_json
  end

  # Create a new mushroom
  post '/mushrooms' do
    content_type :json
    mushroom = Mushroom.new(params[:mushroom])
    if mushroom.save
      mushroom.to_json
    else
      halt 422, mushroom.errors.full_messages.to_json
    end
  end

  # Update a mushroom
  put '/mushrooms/:id' do
    content_type :json
    mushroom = Mushroom.find(params[:id])
    if mushroom.update(params[:mushroom])
      mushroom.to_json
    else
      halt 422, mushroom.errors.full_messages.to_json
    end
  end
  

  # Delete a mushroom
  delete '/mushrooms/:id' do
    content_type :json
    mushroom = Mushroom.find(params[:id])
    if mushroom.destroy
      { message: "Mushroom deleted successfully" }.to_json
    else
      halt 500, { error: "Failed to delete mushroom" }.to_json
    end
  end

    # Retrieve all orders
  get '/orders' do
    content_type :json
    orders = Order.all
    orders.to_json
  end

  # Retrieve a specific order by ID
  get '/orders/:id' do
    content_type :json
    order = Order.find(params[:id])
    order.to_json
  end

  # Create a new order
  post '/orders' do
    content_type :json
    order = Order.new(params[:order])
    if order.save
      order.to_json
    else
      halt 422, order.errors.full_messages.to_json
    end
  end

  # Update an existing order by ID
  put '/orders/:id' do
    content_type :json
    order = Order.find(params[:id])
    if order.update(params[:order])
      order.to_json
    else
      halt 422, order.errors.full_messages.to_json
    end
  end

  # Delete an order by ID
  delete '/orders/:id' do
    content_type :json
    order = Order.find(params[:id])
    if order.destroy
      { message: "Order deleted successfully" }.to_json
    else
      halt 500, { error: "Failed to delete order" }.to_json
    end
  end


end

