class Car
	
	def initialize(sound)
		@sound = sound
		@cities = load_cities
	end

	def car_sound
		puts @sound
	end
	#metodo solo para clase que solo puede ser llamado por la clase
	#igual que el metodo de instancia solo para instancia
	#self indica que esto es un metodo de clase
	def self.speed_control
		puts "tell me ur speed"
		speed = gets.chomp.to_i
		if(speed >= 100)
			puts "care, you are driving so fast, your speed is #{speed}"
		else
			puts "your speed is #{speed}"
		end
	end

	def load_cities
		IO.read("cities_visited.txt").split(",")
	end

	def get_cities
		@cities = load_cities
	end

	def visit_city(city)
		if !@cities.empty?
			city = ", #{city}"
		end	
		@cities << city

		IO.write("cities_visited.txt", @cities.join)
		
	end	
end	

my_car = Car.new("BROOM")
noisy_car = Car.new("BROOOOOOOOOOOOM")
normal_car = Car.new("MEC-MEC")

my_car.car_sound
noisy_car.car_sound
normal_car.car_sound
#Car.speed_control
#my_car.visit_city("Madrid")
#puts my_car.get_cities


class Racing_car < Car
	def initialize 
		@sound = "BROOOOM"
	end
end

my_rc = Racing_car.new
my_rc.car_sound 

class Person
	attr_reader :name
	def initialize(name, age)
		@name = name
		@age = age
	end
end	