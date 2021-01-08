module Displayable

    module InstanceMethods 
        def display_all
            TestingLocation.all.each.with_index(1) {|x, i| puts "\n#{i}. #{x.name}"}
            all_sites = TestingLocation.all
            puts "\nEnter a number to learn more about a testing location, 'main' to return to the main menu, or 'exit' to end the program.\n".colorize(:yellow)
            get_input_all(all_sites)
        end
    
        def display_detail(result)
            puts "\n------------------------------------------------------------------------------------------"
            puts "Name:".colorize(:blue) + " #{result.name}"
            puts "Address:".colorize(:blue) + " #{result.address}" unless result.address == nil
            puts "Phone Number:".colorize(:blue) + " #{result.phone}" unless result.phone == nil
            puts "Access Type:".colorize(:blue) + " #{result.access_type}" unless result.access_type == nil
            puts "Facility Type:".colorize(:blue) + " #{result.facility_type}" unless result.facility_type == nil
            puts "Referral Needed?".colorize(:blue) + " #{result.referral}" unless result.referral == nil
            puts "------------------------------------------------------------------------------------------\n"
        end
    end


    module ClassMethods 
    end

end