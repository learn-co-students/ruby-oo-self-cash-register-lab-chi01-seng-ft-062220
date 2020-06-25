
class CashRegister

    attr_accessor :total, :items, :discount

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        @prev_total = @total
        @total = @total + (price * quantity)
        quantity.times { @items << title }
    end

    def apply_discount
        if @discount == 0
            p "There is no discount to apply."
        else
            @total = @total * (100 - @discount)/100
            p "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total = @prev_total
        @items = @items.pop
    end

end

