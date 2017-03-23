require 'pry'

class CashRegister

  attr_accessor :total, :discount, :cart, :prices

  #ITEMS = []

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @cart = [] ###adding this, here and above...
    @prices = []
  end

 #  def self.all
 #   @@all
 # end

  def add_item(item, price, quantity=1) #quantity is passed as a defaunt parameter with = (and needs to equal something)
    purchase = "#{item}|" * quantity
    purchase = purchase.split("|")
    #purchase = purchase.flatten ##can't flatten here for some reason...
    @cart << purchase

    each_price = ((price * quantity) / quantity)
    @prices << each_price
    #binding.pry

    self.total += price * quantity       #quantity must be used within method block (to pass test)
  end

  def apply_discount
    if self.discount
      self.total = self.total - ((self.total * self.discount) / 100 )
      "After the discount, the total comes to $#{total.to_i}." #@total.to_i turns 800.0 with the decimal to 800 the integer
    else
      "There is no discount to apply."
    end #end if else statement
  end #end method

  def items
    @cart.flatten #need to flatten here
  end

  def void_last_transaction
    last_price = @prices.last
    @total = @total - last_price
  end
#The void_last_transaction method will remove the last transaction
#from the total. You'll need to make an additional attribute accessor
#and keep track of that last transaction amount somehow.
#In what method of the class are you working with an individual item?


end #end class
