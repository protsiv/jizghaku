class CustomizedForm < ApplicationMailer
  default from: "Jizhaku <support@voroninstudio.eu>"
  default to: 	"nazariy.papizh@gmail.com"

  def order_product_data(address, phone, card, comment)
    @address = address
    @phone = phone
    @phone = phone
    @card = card
    @comment = comment
    # @cart = Cart.find(cart)
    # @total_price = total_price
    # @method_payment = method_payment
    # @city = city
    # @department = department

    # to = []
    # to = EmailTo.first.feedback_form.split(',')
    mail(:template_path => 'mailer_templates', :template_name => 'order_product', :subject => "Замовлення продукта", to: to)

  end

end
