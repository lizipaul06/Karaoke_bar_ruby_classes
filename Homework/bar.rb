class Bar

attr_accessor :food, :drink, :name

def initialize(name)
@food = []
@drink = []
@name = name
end


def vip_discount_food(customer)
   for food in @food
  if customer.membership == "VIP"
  return  food[:price] *= 0.5
end
end
end

def buy_food(order, customer)
 for food in @food
  if order == food[:type] && customer.money >= food[:price]
    vip_discount_food(customer)
  customer.money -= food[:price]
    return  customer.bar_tab += food[:price]
end
end
end



def buy_drink(order, customer)
 for drink in @drink
  if order == drink[:type] && customer.money >= drink[:price]
  customer.money -= drink[:price]
    return  customer.bar_tab += drink[:price]
end
end
end

end
