class PrescriptionsController < ApplicationController

    get '/prescriptions' do 
        "A list of publically? available  posts?"
        # if logged_in?
        # @prescriptions = Prescription.all 
        # erb :'prescriptions/index'
        # #else 
        #     #throw an error message in here 
        # end 
    end

    get '/prescriptions/new' do 
        # checking if they are logged in 
        if logged_in?
            "A new post form"
            # erb :"/prescriptions/new" # rendering form if they are logged in 
        else 
            #throw an error message in here 
            redirect to :"/login" #redirecting if they arent
        end 
    end 

    post "/prescriptions" do 
        p = PrescriptionGen.new(params[:name], params[:desc], params[:id_no])
        @prescription = Prescription.create(name: p.name, description: p.desc, id_no: p.id_no)
        redirect to "/prescriptions/#{@prescription.id}"

    end 

    get '/prescriptions/:id' do 
        @prescription = Prescription.find_by_id(params[:id])
        erb :show 
    end 

    get '/prescriptions/:id/edit' do 
        # checking if they are logged in 
        if logged_in?
            "An edit post form"
            # erb :"/prescriptions/new" # rendering form if they are logged in 
        else 
            #throw an error message in here 
            # redirect to prescriptions? 
            redirect to :"/login" #redirecting if they arent
        end 
    end 




end 