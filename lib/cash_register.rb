class CashRegister
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    attr_accessor :discount
    attr_accessor :total

    def add_item(title, price, quantity=1)
        @items << [title, price, quantity]
        @total += price * quantity
    end

    def apply_discount
        if (discount != 0) 
            @total -= @total * @discount * 0.01
            "After the discount, the total comes to $#{@total.to_i}."
        
        else 
            "There is no discount to apply."
        end
    end

    def items
        items_trimmed = []
        @items.each {|itm| itm[2].times { items_trimmed.append(itm[0]) } }
        items_trimmed
    end

    def void_last_transaction
        @total -= @items.last[1] *@items.last[2]
        @items.pop
        @items.size == 0 ? @void = 0 : @void
    end
end