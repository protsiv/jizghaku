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
  # def banner
  #   banner = Banner.first()
  # end
end
