class PrescriptionsController < ApplicationController

    get '/prescriptions' do 
        if logged_in?
        @prescriptions = Prescription.all 
        erb :'prescriptions/index'
        #else 
            #throw an error message in here 
        end 
    end

    get '/prescriptions/new' do 
        if logged_in?
            erb :"/prescriptions/new"
        else 
            #throw an error message in here 
            redirect to :"/login"
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




end 