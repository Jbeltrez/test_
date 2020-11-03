class PrescriptionsController < ApplicationController

    get '/prescriptions' do 
        if logged_in?
        
        @prescriptions = current_patient.prescriptions
        erb :'prescriptions/index'
        else 
            flash[:error] = "Please Login In or Sign up to continue"
            redirect '/'
        end 
        # if logged_in?
        # @prescriptions = Prescription.all 
        # erb :'prescriptions/index'
        # #else 
        #     #throw an error message in here 
        # end 
    end

    get '/prescriptions/new' do
        if logged_in?
        
         
        # checking if they are logged in 
        # if logged_in?
        #     "A new post form"
        #     # erb :"/prescriptions/new" # rendering form if they are logged in 
        # else 
        #     #throw an error message in here 
        #     redirect to :"/login" #redirecting if they arent
        # end 
        erb :'/prescriptions/new'
        else 
            flash[:error] = "Please sign up or log in to continue"
            redirect '/'
        end 
    end 
    get "/prescriptions/custom" do 
        if logged_in? 
        erb :'/prescriptions/custom'
        else 
            flash[:error] = "Please sign up or log in to continue"
            redirect '/'
        end 
    end 
    post "/custom" do 
        if logged_in?
        @prescription = current_patient.prescriptions.create(name: params[:name], description: params[:description])
        redirect "/prescriptions/#{@prescription.id}"
        else 
            flash[:error] = "Please sign up or log in to continue"
            redirect '/'
        end 
    end 

    post "/prescriptions" do
        
        params[:effect].downcase
        input = params[:effect].downcase
        effects = ["relaxed", "euphoric", "creative", "happy", "uplifted"]
        if effects.include?(input)
            p = PrescriptionGen.new(params[:effect])
            @prescription = current_patient.prescriptions.create(name: p.name, description: p.desc, id_no: p.id_no)
     
        redirect "/prescriptions/#{@prescription.id}"
        else
            flash[:error] = "Please enter one of the following to recieve a prescription: Relaxed, Happy, Euphoric, Uplifted, Creative"
            redirect to '/prescriptions/new' #, danger: "INvalid"
        end 
    
    end 
        # binding.pry 
        # if params[:effect] = "relaxed"
        #     flash[:error] = "we cant make you feel that"
        #     # redirect to '/prescriptions/new'
        # end 
      
  
        # p = PrescriptionGen.new(params[:effect])
        # @prescription = Prescription.create(name: p.name, description: p.desc, id_no: p.id_no)
     
        # redirect "/prescriptions/#{@prescription.id}"

    

    get '/prescriptions/:id' do 
        if logged_in?
        @prescription = Prescription.find(params[:id])
        erb :'prescriptions/show'
        else 
            flash[:error] = "Please log in or sign up to continue"
            redirect '/'
        end 
    end 

    get '/prescriptions/:id/edit' do 
        if logged_in?
        @prescription = Prescription.find(params[:id])
        erb :'prescriptions/edit'
        else 
            flash[:error] = "Please log in or sign up to continue"
            redirect '/'
        end 

    end 

    patch '/prescriptions/:id' do 
        if logged_in?
        @prescription = Prescription.find(params[:id])
        @prescription.update(notes: params[:notes], rating: params[:rating])

        redirect "/prescriptions"
        else 
            flash[:error] = "Please log in or sign up to continue"
            redirect '/'
        end 
        # @prescription = Prescription.find(params[:id])
        
    end 

    delete '/prescriptions/:id/delete' do 
        if logged_in?
        @prescription = Prescription.find(params[:id])
        @prescription.delete 
        redirect '/prescriptions'
        else 
            flash[:error] = "Please log in or sign up to continue"
            redirect '/'
        end 
    end 
 
end 

    # get '/prescriptions/:id' do 
    #     @prescription = Prescription.find_by_id(params[:id])
    #     erb :'prescriptions/show 
    # end