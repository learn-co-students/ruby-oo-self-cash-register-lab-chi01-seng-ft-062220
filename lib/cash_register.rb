require 'pry'
class CashRegister
    attr_accessor :total, :discount, :all_prices
    def initialize(discount=nil)
        @total = 0
        @discount = discount
    end
    def discount=(discount)
        @discount = discount*0.01
    end
    def add_item(title, price, quantity=1)
        self.total += (price*quantity)
        @title = title 
        @price = price
        @quantity = quantity
        @all_items ||= []
        @quantity.times do 
         @all_items << @title
        end
        @all_prices ||=[]
        @all_prices << (@price*@quantity)
    end
    def apply_discount
        if @discount
        self.total -= (@total *= (@discount*0.01)).round  
        return "After the discount, the total comes to $#{self.total}."
        else
            return "There is no discount to apply."
        end
    end
    def items
        @all_items
    end
    def void_last_transaction
                @total -= @all_prices.last
                @all_prices.pop
                @total
    end
end

new_register = CashRegister.new
      new_register.add_item("eggs", 1.99)
      new_register.add_item("tomato", 1.76, 3)

#binding.pry
