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
        
         
        # checking if they are logged in 
        # if logged_in?
        #     "A new post form"
        #     # erb :"/prescriptions/new" # rendering form if they are logged in 
        # else 
        #     #throw an error message in here 
        #     redirect to :"/login" #redirecting if they arent
        # end 
        erb :'/prescriptions/new'
    end 
    get "/prescriptions/custom" do 
        erb :'/prescriptions/custom'
    end 
    post "/custom" do 
        @prescription = Prescription.create(name: params[:name], description: params[:description])
        redirect "/prescriptions/#{@prescription.id}"
    end 

    post "/prescriptions" do
        params[:effect].downcase
        input = params[:effect].downcase
        effects = ["relaxed", "euphoric", "creative", "happy", "uplifted"]
        if effects.include?(input)
            p = PrescriptionGen.new(params[:effect])
            @prescription = current_patient.prescriptions.create(name: p.name, description: p.desc, id_no: p.id_no)
     
        redirect "/prescriptions/#{@prescription.id}"
        elsif
            flash[:error] = "Please enter one of the following to recieve a prescription: Relaxed, Happy, Euphoric, Uplifted, Creative"
            redirect to '/prescriptions/new', danger: "INvalid"
        end 
        # binding.pry 
        # if params[:effect] = "relaxed"
        #     flash[:error] = "we cant make you feel that"
        #     # redirect to '/prescriptions/new'
        # end 
      
  
        # p = PrescriptionGen.new(params[:effect])
        # @prescription = Prescription.create(name: p.name, description: p.desc, id_no: p.id_no)
     
        # redirect "/prescriptions/#{@prescription.id}"

    end 

    get '/prescriptions/:id' do 
        @prescription = Prescription.find(params[:id])
        erb :'prescriptions/show'
    end 

    get '/prescriptions/:id/edit' do 
        @prescription = Prescription.find(params[:id])
        erb :'prescriptions/edit'

    end 

    patch '/prescriptions/:id' do 
        @prescription = Prescription.find(params[:id])
        @prescription.update(notes: params[:notes], rating: params[:rating])

        redirect "/prescriptions"
        # @prescription = Prescription.find(params[:id])
        
    end 

    delete '/prescriptions/:id/delete' do 
        @prescription = Prescription.find(params[:id])
        @prescription.delete 
        redirect '/prescriptions'
    end 
 
end 

    # get '/prescriptions/:id' do 
    #     @prescription = Prescription.find_by_id(params[:id])
    #     erb :'prescriptions/show 
    # end