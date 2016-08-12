class Post
	attr_reader :date
	def initialize(title, date, text)
		@title = title
		@date = date
		@text = text
	end

	def print_post
		puts "Post: #{@title}"
		puts "Date: #{@date}"
		puts "#{@text}"
	end

end	

class SponsoredPost < Post
	def print_post
		puts "*************Post: #{@title}*************"
		puts "Date: #{@date}"
		puts "#{@text}"
	end
end	

class Blog
	def initialize
		@allpost = []
		@post_per_page = 3
	end

	def post_pages(array)
		posts_in_pages = []
		pages = 0
		actual_page = 0
		exit = false

		if(array.length % @post_per_page == 0)
			pages = array.length / @post_per_page
		else
			pages = array.length / @post_per_page +1
		end
		#creamos un array de paginas con arrays de posts
		pages.times do |i|
			posts_in_pages << array[i*@post_per_page..(i+1)*@post_per_page-1]
		end

		while !exit
			puts "------------pagina #{actual_page + 1}---------------"
			posts_in_pages[actual_page].each do |post|
				post.print_post
			end
			puts "selecciona S para siguiente pagina o cualquier otra tecla para salir"
			opcion = gets.chomp.downcase

			if (opcion == "s" && actual_page < posts_in_pages.length - 1)
				actual_page += 1
			else
				exit = true
			end
		end

	end

	def add_post(post)
		@allpost << post
	end

	def publish_front_page

		sorted_posts = @allpost.sort do |post1, post2|
			post1.date <=> post2.date
		end
		post_pages(sorted_posts)
		 # sorted_posts.each do |post|
		 # 	post.print_post
		 # end	
	end
end	

my_blog = Blog.new

post1 = Post.new("title 1", Time.local(2015, 11, 9, 16, 15), "texto post 1")
post2 = Post.new("title 2", Time.local(2013, 5, 24, 16, 15), "texto post 2")
post3 = Post.new("title 3", Time.local(2014, 8, 23, 16, 15), "texto post 3")
post4 = Post.new("title 4", Time.local(2016, 2, 11, 13, 15), "texto post 4")
post5 = SponsoredPost.new("title 5", Time.local(2014, 1, 2, 13, 15), "texto post 5")


my_blog.add_post(post1)
my_blog.add_post(post2)
my_blog.add_post(post3)
my_blog.add_post(post4)
my_blog.add_post(post5)

my_blog.publish_front_page

#my_blog.post_pages