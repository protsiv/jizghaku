class CustomizedForm < ApplicationMailer
  default from: "Jizhaku <support@voroninstudio.eu>"
  default to: 	"nazariy.papizh@gmail.com"

  def order_product_data(address, phone, card, comment, current_cart)
    @address = address
    @phone = phone
    @card = card
    @comment = comment
    @current_cart = current_cart

    to = []
    to = MailList.first.order_product.split(',')
    mail(:template_path => 'mailer_templates', :template_name => 'order_product', layout: false, :subject => "Замовлення продукта", to: to)

  end

  def data_from_call_order(fname, phone, comment)
    @fname = fname
    @phone = phone
    @comment = comment

    to = []
    to = MailList.first.call_order.split(',')
    mail(:template_path => 'mailer_templates', :template_name => 'call_order', layout: false, :subject => 'Замовлення дзвінка', to: to)
  end

end
