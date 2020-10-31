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

      get "/signup" do
        # if logged_in?
        #     redirect '/prescriptions'
        # else 
        "this is the sign up page render it if you havent"
            # erb :"/signup"
            # or erb :"/patients/new"

        # end 
      end

      post '/patients' do 
        @patient = Patient.new
        @patient.username = params[:username]
        @patient.password = params[:password]
        if @patient.save 
            redirect '/login'
        else 
            erb :'/patients/new'
        end

      end 

      post "/signup" do
        
        if params[:username] == "" || params[:password] == ""
          redirect "/signup"
        else
          @patient = Patient.create(:username => params[:username], :password => params[:password])
          session[:user_id] = @patient.id
          redirect "/patients/#{@patient.id}"
        end 
      end
    
      get '/patients/:id' do
        @patient = Patient.find_by_id(session[:user_id])
        @prescriptions = Prescription.all
        # if @patient
          erb :"/patients/show"
        # else
        #   erb :error
        # end
        # erb :account
      end
    
      get "/login" do
     
        erb :"patients/login" 
      end 
    
      post "/login" do
        @patient = Patient.find_by(username: params[:username])
        if @patient && @patient.authenticate(params[:password])
          session[:user_id] = @patient.id
          #redirect to that patients page  
          redirect "/account"
        else 
            "user was not found"
          redirect "/failure"
        end 
        ##your code here
      end
    
      get "/failure" do
        erb :failure
      end
    
      get "/logout" do
        # functionally, to log someone out you need to clear the session or 
        # forget the person 
        session.clear
        redirect "/"
      end
end 