class PatientsController < ApplicationController 

# 1. I need user/patients 
#     URLS 
#         Get /signup #=> see a form 
#         POST /users(patients) #=> to actually create the user 
#     database 
#         I need a users table to store their username and password

# 2. I need to give users/patients passwords
# 3. Then I need to make sure that I can find a user/patient with their actual password
# 4. change my login system to username and password to authenticate

# 1. Build my user registration process (signup form and signup creation)
# 2. give posts to users 
# 3. only let them edit posts they made 
  # clean up this page and also make sure the user can only see their prescriptions 
    #  i think i need a user route??? 
    #ive got my get and post signup and i need the same for my login then obviously 
    # a logout route which would just clear the session, after a user logs in and when 
    #they sign up i want to take them to their show page.... right??
    get '/patients' do 
      if logged_in? 
        @patient = current_patient
        erb :'patients/show'
      else 
        redirect'/'
      end 
    end 

    get "/signup" do
        if !logged_in?
          erb :'patients/new'          
        else 
          redirect '/patients'
        end 
    end
    post "/signup" do 
      if params[:username] == "" || params[:password] == ""
        redirect "/signup"
      else
        @patient = Patient.new(:username => params[:username], :password => params[:password])
        @patient.save 
        session[:user_id] = @patient.id
        binding.pry
        redirect '/patients'
      end 
    end 

      get "/login" do
        if !logged_in?
          erb:'patients/login'
        else 
          redirect '/patients'
        end 
      end 
    
      post "/login" do
        @patient = Patient.find_by(username: params[:username])
        if @patient && @patient.authenticate(params[:password])
          session[:user_id] = @patient.id
          #redirect to that patients page  
          erb :'/patients/show'
        else 
          flash[:error] = "Incorrect username or password"
            
          redirect "/login"

        end 
      end
    
      get '/logout' do
        
        session.clear
        redirect "/"
      end
   
end 