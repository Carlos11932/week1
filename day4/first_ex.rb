

class User
	attr_reader :name, :pass
	def initialize(name, pass)
		@name = name
		@pass = pass
	end
end


class Login
	def initialize
		@user_checked = false
		@actual_user = gets.chomp
		@actual_pass = gets.chomp
	end

	def check_login(array_users, printer)
		array_users.each do |item|

			if(@actual_pass == item.pass && @actual_user == item.name)
				@user_checked = true
			end
		end

		if(@user_checked)
			do_something(printer)
		else
			puts "try again"
			@actual_user = gets.chomp
			@actual_pass = gets.chomp
			check_login(array_users)
		end	
	end

	def do_something(printer)
		puts "quieres hi o bye"
		response = gets.chomp

		#print printer.methods.grep(/print/)

		puts"elige la opcion que quieres"
		# metodo = gets.chomp

		# begin
		# 	printer.send(metodo.to_sym, word)
		# rescue
		

		if response == "hola"
			printer.print_hello(@actual_user)
		elsif response == "adios"
			printer.print_bye(@actual_user)
		else
			puts "fail"
		end
		
	end

end

class Printer
	def print_hello(actual_user)
		puts "hi " + actual_user
	end

	def print_bye(actual_user)
		puts "bye " + actual_user	
	end	
end	

array_users = [
carlos_user = User.new("carlos", "0000")
]
loging = Login.new
printer = Printer.new



loging.check_login(array_users, printer)
