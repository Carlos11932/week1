require "pry"
module Discount
	def discount_apples item
		 item.number / 2 + item.number % 2
		
	end

	
	
	def discount_oranges item
		 item.number / 3 * 2 +item.number % 3
	end	
	def discount_banas  item
		if  item.number >=	4
		 if item.number / 4 >= bananas.number
		 
		 else
		 bananas.number -item.number/4	
		 end	
		else
			bananas.number
	   end
	    end	
end

class Shopping_cart
	include Discount
	def initialize(array_items)
		@array_items = array_items	
		@cart = []
	end

	def add_item(item)
		
			if @cart.include? item
				
				item.number += 1
			else
				@cart << item
			
		end	
	end

	def show
		i = 1
		@cart.each do |item|
			
			puts i.to_s + " #{item.name} X#{item.number}: #{item.price*item.number}$"
			i+=1
		end	
	end

	

	def cost
		total = 0
		@cart.each do |item|
			if item.name =="apples"
				total += item.price*(discount_apples item)
			elsif item.name == "oranges"
				total += item.price*(discount_oranges item)
			#elsif item.name == "bananas"
			#	total += item.price*(discount_banas item)
			else
			total += item.price*item.number
			end
		end

		puts "the total price is " + total.to_s	+ "$"
	end
end	

class Fruit
	attr_reader :name, :price
	attr_accessor :number
	def initialize(name, price)
		@name = name
		@price = price
		@number = 1
	end
end



apples = Fruit.new("apples", 10)
oranges = Fruit.new("oranges", 5)
grapes = Fruit.new("grapes", 15)
bananas = Fruit.new("bananas", 20)
watermelon = Fruit.new("watermelon", 50)


fruit_items = [apples,oranges,grapes,bananas,watermelon]


shopping_cart = Shopping_cart.new(fruit_items)


shopping_cart.add_item(apples)
shopping_cart.add_item(oranges)
shopping_cart.add_item(oranges)
shopping_cart.add_item(oranges)
shopping_cart.add_item(bananas)
shopping_cart.add_item(bananas)
shopping_cart.add_item(grapes)
shopping_cart.add_item(grapes)
shopping_cart.add_item(grapes)
shopping_cart.add_item(grapes)

shopping_cart.show
shopping_cart.cost



=begin
def add_item(added_item)
		@array_items.each do |item|
			if @cart.include? item
				item.number += 1
			elsif item.name == added_item
				@cart << item
			end
		end	
	end
=end