class TestingLocation
    attr_accessor :name, :phone, :street, :zipcode, :address, :access_type, :facility_type, :referral
    
    include Findable::InstanceMethods
    include Displayable::InstanceMethods
    include Inputable::InstanceMethods

    @@all = []
    
    def initialize(hash)
        hash.each do |k, v|
            self.send(("#{k}="), v)
        end
        @@all << self
    end

    def self.create_from_collection(array)
        array.each do |hash|
          TestingLocation.new(hash)
        end
    end

    def self.all
        @@all 
    end
end