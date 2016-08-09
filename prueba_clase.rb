class ProgrammingLanguage
	attr_accessor :name, :age, :type
	def initialize(name, age, type)
		@name = name
		@age = age
		@type = type
	end	
end

ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
python = ProgrammingLanguage.new("Python", 24, "Dynamic")
javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
go = ProgrammingLanguage.new("Go", 6, "Static")
rust = ProgrammingLanguage.new("Rust", 5, "Static")
swift = ProgrammingLanguage.new("Swift", 2, "Static")
java = ProgrammingLanguage.new("Java", 20, "Static")

array_of_languages = [ruby, python, javascript, go, rust, swift, java]

def array_printer(array)
	array.each do |language|
		puts "Language: #{language.name} | Age: #{language.age} | Type System: #{language.type}"
	end	
end	

array_printer(array_of_languages)

aged_languages = array_of_languages.map do |language|
		copyLanguage = language.clone
		copyLanguage.age += 1
		copyLanguage
end


puts "The programming languages aged one year are: "
array_printer(aged_languages)

puts "========================================"

sort_aged = array_of_languages.sort { |x,y| y.age <=> x.age}

array_printer(sort_aged)

without_java = array_of_languages.delete_if { |badone| badone.name == "Java" }

puts "================================="
array_printer(without_java)

puts "==============================="

shuffle_array = array_of_languages.shuffle
array_printer(shuffle_array)

puts "=============="

young_languages = array_of_languages.take_while { |i| i.age < 23 }
array_printer(young_languages)

#devuelve los menores de 23 hasta que encuentra uno mayor, en este ejemplo devuelve solo el primer item porque el segundo.age es 24

which_index = array_of_languages.index (javascript)
puts "==================="
puts array_of_languages[which_index].name

include_rust = array_of_languages.include?(rust)
puts "=================="
puts include_rust
