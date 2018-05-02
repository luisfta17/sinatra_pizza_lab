require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza_order')

# READ orders
get '/pizza_orders' do
  @orders = PizzaOrder.all()
  erb( :index )
end

# CREATE orders
get '/pizza_orders/new' do
  erb( :new )
end

post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb( :create )
end

# SHOW order
get '/pizza_orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb( :show )
end


# UPDATE existing orders

# DELETE orders

get '/pizza_orders/delete_confirmation' do
  erb( :destroy )
end

post "/pizza_orders/:id/delete" do
  @order_to_delete = PizzaOrder.find(params[:id].to_i)
  @order_to_delete.delete()
  redirect "/pizza_orders"

end
