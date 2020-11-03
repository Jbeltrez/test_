require_relative '../../config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base 
  # register Sinatra::ActiveRecordExtension #what does this line do?

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"

    use Rack::Flash, :sweep => true 
  end

  #u.posts.build(:title => "Made for avi@learn.co") 

  get '/' do
    
    erb :index 
  end

  # get '/posts/:id/edit' do 
  #   #checking if they are logged in 
  #   if !logged_in? 
  #     redirect "/login" #Redirecting if they arent 
  #   else 
  #     #how do i find the post that only the author user is allowed to edit 
  #     post = Post.find(params[:id])
  #     if post.user_id == current_user.id 
  #       "An edit post form #{current_user.id} is editing #{post.id}" #rendering if they are 
  #     else 
  #       redirect '/posts'
  #     end 
  #   end 
  # end 

  helpers do
    # def redirect_if_not_logged_in 
    #   if !loggedin? 
    #     redirect "/login?error=YOU have to be logged in to do that"
    #   end 
    # end

    # def login(email, password)
    #   #check if a user with this email actually exists 
    #   # if so, set the session 
    #   if user = User.find_by(:email => email) && user.authenticate(password)
    #     session[:email] = user.email 
    #   else 
    #     redirect '/login'
    #   end  
    # end 
    def flash_types 
      [:success, :notice, :warning, :error]
    end 

    def current_patient
      @current_patient ||= Patient.find(session[:user_id]) if session[:user_id]
    end 

    def logged_in?
      !!session[:user_id]
    end

    # def current_user
    #   Patient.find(session[:user_id])
    # end
  end
end 