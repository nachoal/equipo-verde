puts "Limpiando la DB..."
Category.destroy_all
User.destroy_all
Order.destroy_all
LineItem.destroy_all
Product.destroy_all

puts "Creando categorias..."
maceteros = Category.create!(
  name: "Maceteros",
  description: "Dale una mirada distinta a tu jardin",
  image_url: "https://greenbricks.cl/wp-content/uploads/2019/12/KADU.jpg"
)

pastelon = Category.create!(
  name: "Pastelón",
  description: "Transforma la entrada de tu hogar y al mismo tiempo impactas al mundo",
  image_url: "https://images.squarespace-cdn.com/content/v1/558095e4e4b095c5b4d764ee/1602278477469-MY24PKABT9PS1NY97B44/IMG_1650.JPG?format=2500w"
)

limpiapies = Category.create!(
  name: "Limpiapies",
  description: "La entrada de la casa con un diseño y producto reciclado",
  image_url: "https://www.qrubber.com.pe/imgmodulo/imagengaleria/106.png?time=1562261424"

)

puts "Creando dos productos para maceteros"
Product.create!(
  name: 'macetero verde',
  conent: 'un macetero verde bonito',
  price: 20,
  category: maceteros
)

puts "Creando dos productos para pastelon"
producto_pastelon = Product.create!(
  name: 'pastelon reciclado',
  conent: 'un pastelon verde bonito',
  price: 50,
  category: pastelon
)
Product.create!(
  name: 'pastelon reciclado rojo',
  conent: 'un pastelon rojo bonito',
  price: 100,
  category: pastelon
)

puts "Creando dos productos para limpiapies"
Product.create!(
  name: 'limpiapies reciclado',
  conent: 'un limpiapies verde bonito',
  price: 10,
  category: limpiapies
)
producto_limpiapies = Product.create!(
  name: 'limpiapies reciclado rojo',
  conent: 'un limpiapies rojo bonito',
  price: 1000,
  category: limpiapies
)

puts "Creando un usuario de prueba"
usuario = User.create!(email: 'test@test.com', password: '123456')


puts "Creando una orden para el usuario de prueba"
order = Order.create!(
  user: usuario,
  status: 'completed',
  total_price: producto_pastelon.price.fractional + producto_limpiapies.price.fractional
)

puts "Creando line items para la orden"
LineItem.create!(
  order: order,
  product: producto_pastelon,
  amount: 1,
  total_price: producto_pastelon.price.fractional
)

LineItem.create!(
  order: order,
  product: producto_limpiapies,
  amount: 1,
  total_price: producto_limpiapies.price.fractional
)
puts "fin"