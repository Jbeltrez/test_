class PatientsController < ApplicationController 
    
      get "/signup" do
        # if logged_in?
        #     redirect '/prescriptions'
        # else 
            erb :"/signup"
        # end 
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
          redirect "/account"
        else 
          redirect "/failure"
        end 
        ##your code here
      end
    
      get "/failure" do
        erb :failure
      end
    
      get "/logout" do
        session.clear
        redirect "/"
      end
end 