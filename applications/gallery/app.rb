require 'sinatra'
require 'sinatra/reloader'

helpers do
	def get_files(path)
			dir_list_array = Array.new
			Find.find(path) do |f|
				dir_list_array << File.basename(f, ".*") if !File.directory?(f)
			end
			return dir_list_array
	end

end

get '/' do
	File.read(File.join('public/gallery2_data', 'picture1.html'))
end

post '/a' do
	#File.read(File.join('public/gallery2_data', 'form.rb'));
	#erb :create
	#"Triggered via POST"
	#puts "#{Time.now}"
	#load 'code.rb'
	
	x = load('code.rb')
	"load sez #{x}"
	"load sez #{params[:message]}"
	func
	@input = params[:message]
	puts @input
	erb :form
end

get '/form' do
	erb :form
end

post '/' do
#	@arr = get_files('views/posts/')
	puts ""
	"You said '#{params[:message]}'"
	puts ""
	#@count_comment += 1
	puts "        #{ @count_comment }"
	@time = Time.now
	erb :form
end

get '/views/posts/*' do

end

=begin
get '/gallery1' do
	File.read(File.join('gallery1', 'picture3.html'))
end
=end
=begin
get '/images/index.html' do
	File.read(File.join('/images',	'index.html'))
end
=end
