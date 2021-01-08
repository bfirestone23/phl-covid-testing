module Findable

    module InstanceMethods

        def search_by_zipcode(input)
            results = []
            TestingLocation.all.each.with_index(1) do |x, i|
                results << x if x.zipcode.to_s == input
            end

            if results.length == 0
                puts "\nNo match found. Please try again.\n".colorize(:red)
                get_input_main
            elsif results.length == 1
                puts display_detail(results[0])
                puts "\nAll results displayed. Returning to main menu...\n".colorize(:green)
                get_input_main_options
            else
                results.each.with_index(1) {|x, i| puts "\n#{i}. #{x.name}"}
                puts "\nEnter another number to see location details, 'all' to see the full list of locations, 'main' to return to the main menu,\nor 'exit' to end the program.\n".colorize(:yellow)
                get_input_sub(results)
            end
        end
    
        def search_by_name(input)
            results = []
            TestingLocation.all.each.with_index(1) do |x, i|
                results << x if x.name.downcase.include?(input)
            end
            
            if results.length == 0
                puts "\nNo match found. Please try again.\n".colorize(:red)
                get_input_main
            elsif results.length == 1
                puts display_detail(results[0])
                puts "\nAll results displayed. Returning to main menu...\n".colorize(:green)
                get_input_main_options
            else
                results.each.with_index(1) {|x, i| puts "\n#{i}. #{x.name}"}
                puts "\nEnter another number to see location details, 'all' to see the full list of locations, 'main' to return to the main menu,\nor 'exit' to end the program.\n".colorize(:yellow)
                get_input_sub(results)
            end
        end
    
        def search_by_name_or_zipcode(input)
            if input =~ /\d{5}/
                search_by_zipcode(input)
            else
                search_by_name(input)
            end
        end

        def search_by_access(input)
            results = []
            TestingLocation.all.each.with_index(1) do |x, i|
                results << x if x.access_type.downcase.include?(input)
            end
            
            if results.length == 0
                puts "\nNo match found. Please try again.\n".colorize(:red)
                get_input_main
            elsif results.length == 1
                puts display_detail(results[0])
                puts "\nAll results displayed. Returning to main menu...\n".colorize(:green)
                get_input_main_options
            else
                results.each.with_index(1) {|x, i| puts "\n#{i}. #{x.name}"}
                puts "\nEnter another number to see location details, 'all' to see the full list of locations, 'main' to return to the main menu,\nor 'exit' to end the program.\n".colorize(:yellow)
                get_input_sub(results)
            end
        end
    end

    module ClassMethods 
    end

end