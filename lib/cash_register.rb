require 'pry'


class CashRegister
    attr_accessor :total, :discount, :last_transaction, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        i = 1
        while i <= quantity    
            @items << title
            i += 1
        end
        @last_transaction = price * quantity
    end

    def apply_discount
        if @discount > 0
            @total = @total - @total * (@discount/100.00)
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end


    def void_last_transaction
        @total -= @last_transaction
    end

end