class CashRegister
    attr_accessor :total, :items, :discount, :title, :last_transaction 
    def initialize(discount = 0)
        @total = 0
        @items= []
        @discount = discount
    end 
    
    def total
        @total
    end 

    def add_item(title, price, sub_total = 1) 
       self.total += price * sub_total
       sub_total.times do 
        items << title
       end 

    self.last_transaction = price * sub_total
    end 

    def apply_discount 
        if discount != 0 
            self.total = total - total * discount / 100 
            return "After the discount, the total comes to $#{self.total}."
        else  
            return "There is no discount to apply."
        end  
    end 


    def void_last_transaction
        self.total = self.total - self.last_transaction
    end 
end 
