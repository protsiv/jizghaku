class MainController < ApplicationController

  def index
    @products_of_week = Product.where(offer_of_the_week: true).order(created_at: :asc).limit(4)
    @reviews = Review.order(position: :asc).where(published: true).limit(6)

    @main_banners = MainBanner.where(published: true).order(position: :asc).limit(3)

    @_seo_title = 'Головна'
    @_seo_description = 'Головна вторінка Їжа.КИ'
    @_seo_keywords = 'Доставка їжі, напої, суші, смачні суші'
  end

  def catalog
    @current_restaurant = Restaurant.find_by_slug(params[:restaurant])
    @restaurants = Restaurant.where.not(id: @current_restaurant).order(created_at: :asc)
    @categories = Category.joins(:restaurant).where(restaurants: {slug: @current_restaurant.slug}).order(position: :asc)
    @common_categories = Category.where(common: true).order(position: :asc)
    @products = Product.joins(category: :restaurant).where(restaurants: {slug: @current_restaurant.slug}).order(position: :asc)
    @products_common = Product.joins(:category).where(categories: {common: true}).order(position: :asc)

    @products_count = Product.joins(category: :restaurant).where(restaurants: {slug: @current_restaurant.slug}).count

    if @current_restaurant.slug == 'bruno'
      @_seo_title = 'Каталог їжі. Ресторан Бруно'
      @_seo_description = 'Каталог їжі'
      @_seo_keywords = 'Доставка їжі, напої, суші, смачні суші'
    elsif @current_restaurant.slug == 'baba-franya'
      @_seo_title = 'Каталог їжі. Ресторан Баба Франя'
      @_seo_description = 'Каталог їжі'
      @_seo_keywords = 'Доставка їжі, напої, суші, смачні суші'
    elsif @current_restaurant.slug == 'barbarus'
      @_seo_title = 'Каталог їжі. Ресторан Барбарис'
      @_seo_description = 'Каталог їжі'
      @_seo_keywords = 'Доставка їжі, напої, суші, смачні суші'
    end

  end

  def about
    @current_restaurant = Restaurant.find_by_slug(params[:url])
    @restaurants = Restaurant.where.not(id: @current_restaurant).order(created_at: :asc)

    if @current_restaurant.slug == 'bruno'
      @_seo_title = 'Про ресторан Бруно'
      @_seo_description = 'Каталог їжі'
      @_seo_keywords = 'Доставка їжі, напої, суші, смачні суші'
    elsif @current_restaurant.slug == 'baba-franya'
      @_seo_title = 'Про ресторан Баба Франя'
      @_seo_description = 'Каталог їжі'
      @_seo_keywords = 'Доставка їжі, напої, суші, смачні суші'
    elsif @current_restaurant.slug == 'barbarus'
      @_seo_title = 'Про ресторан Барбарис'
      @_seo_description = 'Каталог їжі'
      @_seo_keywords = 'Доставка їжі, напої, суші, смачні суші'
    end
  end

  def reviews

  end

  def terms_of_use

    @_seo_title = 'Правила користування'
    @_seo_description = 'Сторінка правила користування'
    @_seo_keywords = 'Доставка їжі, напої, суші, смачні суші'
  end

  def order_product
    address = params[:address]
    phone = params[:phone]
    card = params[:card]
    comment = params[:comment]


    CustomizedForm.order_product_data(address, phone, card, comment, current_cart).deliver
    current_cart.finish
    current_cart.save
    render nothing: true
  end

  def call_order
    fname = params[:fname]
    phone = params[:phone]
    comment = params[:comment]

    CustomizedForm.data_from_call_order(fname, phone, comment).deliver
    # render nothing: true
  end

  def test_page
    # @categories = Category.where(common: true)
    # @products_common = Product.joins(:category).where(categories: {common: true}).order(created_at: :asc)
    #
    # $line_items = LineItem.where(cart: current_cart.id)
    # @mc.lists.subscribe(@list_id, email: 'pnaryan.ua@gmail.com')
    # @mc.lists.unsubscribe(@list_id, email: 'p.korenev@voroninstudio.eu')
  end

  def line_items
    $line_items = LineItem.where(cart: current_cart.id)
  end

  def get_total_count_items
    @quantity = 0

    current_cart.line_items.each do |li|
      if li.quantity
        @quantity +=li.quantity
      end
    end

    respond_to do |format|
      format.js
    end
  end

  def get_total_price
    @quantity = 0
    @summ = 0

    line_items.each do |item|
      @summ += item.product.price * item.quantity
      @quantity += item.quantity

    end

    parts = @summ.to_s.split(".")
    @r_integer = parts[0]
    @r_decimal = parts[1]

    respond_to do |format|
      format.js
    end
  end

  def get_ordered_items_list
    @current_line_items = current_cart.line_items
    respond_to do |format|
       format.js
     end
  end
end
