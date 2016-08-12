# hash = {:wat => [0,1,{wut: [0,[[0,1,2,3,4,5,6,7,8,{bbq: "hola"}]]]}]}

# arr = [[0,1,2,3,4,{secret: {unlock: [0,"adios"]}}]]

# puts hash
# puts arr

class Car
	attr_reader :brand, :model
	def initialize(brand, model, sound, engine)
		@brand = brand
		@model = model
		@sound = sound
		@engine = engine
	end

	def make_noise
		puts @sound + @engine.move_pistons
	end
end

class CarDealer

	def initialize(inventory)
		@inventory = inventory
	end

	def cars(brand)			
		filtered_cars = @inventory.select{|car| car.brand == brand}
		show_cars(filtered_cars)
	end

	def show_cars(cars)
		select_brand = cars[0].brand

		filtered_models = cars.map{|car| car.model}

		models = filtered_models.join(", ")

		puts "#{select_brand}: #{models}"

	end

end	

# cars = [

# car1 = Car.new("Ford", "Fiesta"),
# car2 = Car.new("Ford", "Mustang"),
# car3 = Car.new("Ford", "Forfito"),
# car4 = Car.new("Seat", "Leon"),
# car5 = Car.new("Seat", "Ibiza"),
# car6 = Car.new("Seat", "Setito")
		
# 		]



# car_dealer = CarDealer.new(cars)
# car_dealer.cars("Ford")
# car_dealer.cars("Seat")


class Engine
	def initialize sound
		@sound = sound
	end

	def move_pistons
		@sound
	end
end

e1 = Engine.new("......")
e2 = Engine.new("BRUMMMMMM")
my_car = Car.new("ford", "fiesta", "pipi", e2)

my_car.make_noise