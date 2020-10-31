require_relative '../../config/environment'

class ApplicationController < Sinatra::Base 
  register Sinatra::ActiveRecordExtension 
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
                 
    erb :welcome
  end

  helpers do
    def redirect_if_not_logged_in 
      if !loggedin? 
        redirect "/login?error=YOU have to be logged in to do that"
      end 
    end

    def current_patient
      @current_patient ||= Patient.find_by_id(session[:user_id]) if session[:user_id]
    end 

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      Patient.find(session[:user_id])
    end
  end
end 