require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :last_item

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_item = []
    end

    def add_item(title, price, quantity=1)
        quantity.times {self.items << title}
        self.last_item << (price * quantity)
        self.total += (price * quantity)
    end

    def apply_discount
        if self.discount != 0
            discount = (self.discount.to_f/100) * self.total
            self.total -= discount.to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        price = self.last_item[-1]
        # binding.pry
        self.items.pop()
        if self.items.size == 0
            return self.total = 0.0
        end
        self.last_item.pop()
        self.total = self.total - price

    end
end