class CashRegister
  attr_accessor :total, :discount, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @@items = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times { @@items << title }
    @total = @total + (price * quantity)
    @last_transaction = price * quantity
  end

  def apply_discount
    if @discount != 0
      percentage_off = @discount.to_f / 100 * @total
      @total = @total - percentage_off.to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @@items
  end

  def void_last_transaction
    @total = @total - @last_transaction
  end
  
end
