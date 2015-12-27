class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    carts_id = $redis.smembers current_user_cart
    @cart_movies = Movie.find(carts_id)
  end

  def add
    $redis.sadd current_user_cart, params[:movie_id]
    render json: current_user.cart_count, status: 200
  end

  def remove
    $redis.srem current_user_cart, params[:movie_id]
    render json: current_user.cart_count, status: 200
  end

  private

  def current_user_cart
    "cart#{current_user.id}"
  end


end
