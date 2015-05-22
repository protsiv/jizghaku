module ApplicationHelper
  def embedded_svg filename, options={}
   embedded_svg_from_abs(Rails.root.join('app', 'assets', 'images', 'svg', filename), options)
  end

  def embedded_svg_from_abs filename, options = {}
   file = File.read(filename)
   doc = Nokogiri::HTML::DocumentFragment.parse file
   svg = doc.at_css 'svg'
   if options[:class].present?
     svg['class'] = options[:class]
   end
   doc.to_html.html_safe
  end

  def embedded_svg_from_root_directory filename, options = {}
   embedded_svg_from_abs(Rails.root.join( filename), options)
  end

  def embedded_svg_from_public filename, options ={}
    embedded_svg_from_root_directory("public#{filename}", options)
  end

  def self.embedded_svg_js filename, options={}
   file = File.read(Rails.root.join('app', 'assets', 'images', 'svg', filename))
   doc = Nokogiri::HTML::DocumentFragment.parse file
   svg = doc.at_css 'svg'
   if options[:class].present?
     svg['class'] = options[:class]
   end
   doc.to_html.html_safe
  end


  def products(count = nil)
    if count.blank?
      products = Product.order(created_at: :asc)
    else
      products = Product.order(created_at: :asc).limit(count)
    end
  end
  def restorans
     restoran = Restaurant.order(position: :asc)
  end

  def business_lunch
    @products_for_monday ||= Product.where(d_monday: true).order(created_at: :asc).limit(2)
    @products_for_tuesday ||= Product.where(d_tuesday: true).order(created_at: :asc).limit(2)
    @products_for_wednesday ||= Product.where(d_wednesday: true).order(created_at: :asc).limit(2)
    @products_for_thursday ||= Product.where(d_thursday: true).order(created_at: :asc).limit(2)
    @products_for_friday ||= Product.where(d_friday: true).order(created_at: :asc).limit(2)

    # @days_with_business_lunch ||= Product.where()
  end
  def cart
    current_cart.line_items
  end

  def current_restaurant_items(restaurant)
    cart = current_cart
    @line_items = LineItem.where(cart: cart)
  end

  def get_count_products
    quantity = 0

    current_cart.line_items.each do |l|
      if l.quantity
        quantity +=l.quantity
      end
    end
    return quantity
  end

  def get_total_price
    if current_cart && current_cart.line_items.count > 0
      sum = 0

      current_cart.line_items.each do |item|
        #  sum tablecloth
        if item && item.product_id
          product = Product.where(id: item.product_id).first
          sum = sum + item.product.price * item.quantity
        end

      end
      return sum
    else
      0
    end
  end

  def about_restaurant(current_restaurant)
    @a_restaurant = Restaurant.where(slug: current_restaurant)
    @a_common_restaurant = Restaurant.where.not(id: @a_restaurant).order(created_at: :asc)
  end

end
