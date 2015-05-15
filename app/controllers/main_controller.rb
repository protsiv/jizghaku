class MainController < ApplicationController

  def index
    @products_of_week = Product.where(offer_of_the_week: true).order(created_at: :asc).limit(4)

    @reviews = Review.order(position: :asc).where(published: true).limit(6)
  end

  def about
    @current_restaurant = Restaurant.find_by_slug(params[:url])
    @restaurants = Restaurant.where.not(id: @current_restaurant).order(created_at: :asc)
  end
  def catalog
    @current_restaurant = Restaurant.find_by_slug(params[:restaurant])
    @restaurants = Restaurant.where.not(id: @current_restaurant).order(created_at: :asc)
    @categories = Category.joins(:restaurant).where(restaurants: {slug: @current_restaurant.slug}).order(position: :asc)
    @common_categories = Category.where(common: true).order(position: :asc)
    @products = Product.joins(category: :restaurant).where(restaurants: {slug: @current_restaurant.slug}).order(position: :asc)
    @products_common = Product.joins(:category).where(categories: {common: true}).order(position: :asc)

    @products_count = Product.joins(category: :restaurant).where(restaurants: {slug: @current_restaurant.slug}).count
  end

  def terms_of_use

  end

  def order_product
    address = params[:address]
    phone = params[:phone]
    card = params[:card]
    comment = params[:comment]

    CustomizedForm.order_product_data(address, phone, card, comment, current_cart).deliver
    render nothing: true
  end

  def call_order
    fname = params[:fname]
    phone = params[:phone]
    comment = params[:comment]

    CustomizedForm.data_from_call_order(fname, phone, comment)
    render nothing: true
  end

  def test_page
    @categories = Category.where(common: true)
    @products_common = Product.joins(:category).where(categories: {common: true}).order(created_at: :asc)

    $line_items = LineItem.where(cart: current_cart.id)

  end

  def line_items
    $line_items = LineItem.where(cart: current_cart.id)
  end

  def get_total_price
    @quantity = 0
    @summ = 0
    line_items.each do |item|
      @summ += item.product.price * item.quantity
      @quantity += item.quantity
    end

    respond_to do |format|
      format.js
    end
  end
end
