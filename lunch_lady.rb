require 'pry'

class Cafeteria
  attr_accessor :customer 
  def initialize
    @customer = Customer.new
    main_dish_prompt
    get_main_dish
    side_dish_prompt
    get_side_dish
    side_dish_prompt
    get_side_dish

    total_prompt(@customer.tray)
    calc_total(@customer.tray)
  end

  def main_dish_prompt
    puts "What main dish would you like?"
    puts "\t 1: Meatloaf(5.00)"
    puts "\t 2: Mystery Meat(3.00)"
    puts "\t 3: Slop(1.00)"
  end

  def side_dish_prompt
    puts "What side dish would you like?"
    puts "\t 1: Carrots(1.75)"
    puts "\t 2: Mystery Yogurt(1.00)"
    puts "\t 3: Beef Jerkey(.50)"
  end

  def calc_total(tray)
    total_price = 0
    tray.each do |item|
      total_price += item.price
    end
    puts "\nYour order total is: $#{total_price}"
    puts "wallet: $#{customer.wallet} - $#{total_price} = $#{@customer.wallet - total_price}"
  end

  def total_prompt(tray)
    puts "Your order consists of:"
    tray.each do |item|
      print item.name + ", "
    end
  end

  def get_main_dish
    user_main = gets.to_i
    case user_main
    when 1
      @customer.tray << Dish.new('Meatloaf', 5.00)
    when 2
      @customer.tray << Dish.new('Mystery Meat', 3.00)
    when 3
      @customer.tray << Dish.new('Slop', 1.00)
    else
      puts "That dish is not available"
      main_dish_prompt
      get_main_dish
    end
  end

  def get_side_dish
    user_side = gets.to_i
    case user_side
    when 1
      @customer.tray << Dish.new('Carrots', 1.75)
    when 2
      @customer.tray << Dish.new('Mystery Yogurt', 1.00)
    when 3
      @customer.tray << Dish.new('Beef Jerkey', 0.50)
    else
      puts "That dish is not available"
    end
  end
end

class Dish
  attr_reader :name, :price
  def initialize(name, price) #set up data
    @name = name
    @price = price
  end
end

class Customer
  attr_accessor :wallet, :tray
  def initialize
    @wallet = 10.0
    @tray = []
  end
end

Cafeteria.new