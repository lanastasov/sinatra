require 'sinatra'
require 'sinatra/reloader'
require 'find'
require 'rdiscount'



helpers do
	def formatter(page)
		formatted = ""
		formatted = page.gsub(/[-]/, ' ').capitalize
		return formatted
	end

	def get_files(path)
			dir_list_array = Array.new
			Find.find(path) do |f|
				dir_list_array << File.basename(f, ".*") if !File.directory?(f)
			end
			return dir_list_array
	end
end

get '/' do
	@arr = get_files('views/posts/')
	puts ""*2
	puts @arr
	puts ""*2
	@time = Time.new
	erb :index
end

get '/view/:link' do
	halt 404 unless File.exists?("views/posts/#{params[:link]}.md")
	markdown :"posts/#{params[:link]}", :layout_engine => :erb
end

get '/about' do
	#if you don't want to use Markdown for pages, do this:
	#erb :"pages/about"
	#Then create about.erb in views/pages
	markdown :"pages/about", :layout_engine => :erb
end

get '/form' do
	erb :form
end

post '/form' do
	"You said '#{params[:message]}'"
end

not_found do 
	erb :missing
end
