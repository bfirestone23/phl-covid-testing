class CLI
    include Findable::InstanceMethods
    include Displayable::InstanceMethods
    include Inputable::InstanceMethods

    def call
        create_sites 
        puts "\nWelcome to the Philadelphia COVID-19 Testing Finder!\nAll data provided by OpenDataPhilly at: https://www.opendataphilly.org/dataset/covid-19-test-sites".colorize(:yellow)
        get_input_main_options
    end

    def create_sites
        hash = API.get_data
        TestingLocation.create_from_collection(hash)
    end
end