
class PrescriptionGen
    attr_accessor :id_no, :name, :desc
    attr_reader :rating, :notes 

    @@prescriptions = []
    def initialize(input) 
        hash = PrescriptionGen.get_random_strain_by_effect(input)
        # @id_no= id 
        # @name = name 
        # @desc = desc 
        attr_setter(hash)
    end 

    def self.get_random_strain_by_effect(effect) 
        key = "CW3HtIO"
        url = "strainapi.evanbusse.com/#{key}/strains/search/effect/#{effect}"
        response = RestClient.get(url)
        results = JSON.parse(response)
        
        selected_strain = results.shuffle.first 

        hash = {"id_no"=>"" , "name"=>"", "desc"=>""}
        hash["id_no"] = selected_strain["id"]
        hash["name"] = selected_strain["name"]
        id = hash["id_no"] 
        hash[:desc] = query_description_by_id(("#{id}").to_i)
        hash 
    end 
    def self.query_description_by_id(id)
        key = "CW3HtIO"
        url  = "strainapi.evanbusse.com/CW3HtIO/strains/data/desc/#{id}"
        response = RestClient.get(url)
        results = JSON.parse(response)
        description = results["desc"]
        
    end 
    
    def attr_setter(hash) 
        hash.each do |k,v|
            self.send("#{k}=", v) if self.respond_to? (k)
        end 
    end 

end 
