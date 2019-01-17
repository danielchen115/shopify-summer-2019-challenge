module CartService
  class << self
    def get_cart(user)
      if defined? user.carts.where.not(checkout_date: [nil, ''])
        return user.carts.where.not(checkout_date: [nil, '']).last
      end
      return user.carts.create(total_amount: 0)
    end
  end
end