module Inputable
    module InstanceMethods 
        def get_input_main_options
            input = nil
            puts "\nYou can search for a COVID-19 testing location in Philadelphia by:".colorize(:yellow)
            puts " - Searching by name".colorize(:yellow)
            puts " - Entering a zip code".colorize(:yellow)
            puts " - Entering 'walk' to see all walk-up locations".colorize(:yellow)
            puts " - Entering 'drive' to see all drive-thru locations".colorize(:yellow)
            puts " - Entering 'all' to see all testing locations".colorize(:yellow)
            puts " - Or 'exit' to end the program.\n".colorize(:yellow)
            while input == nil
                input = gets.strip.downcase
                if input == "exit"
                    puts "\nGoodbye!\n".colorize(:green)
                elsif input == "all"
                    display_all
                elsif input == "walk" || input == "drive"
                    search_by_access(input)
                else
                    search_by_name_or_zipcode(input)
                end
            end
        end
    
        def get_input_main
            input = nil
            while input == nil
                input = gets.strip.downcase
                if input == "exit"
                    puts "\nGoodbye!\n".colorize(:green)
                elsif input == "all"
                    display_all
                elsif input.include?("walk") || input.include?("drive")
                    search_by_access(input)
                else
                    search_by_name_or_zipcode(input)
                end
            end
        end
    
        def get_input_sub(result_array)
            input = nil
            while input == nil
                input = gets.strip.downcase
                if input == "exit"
                    puts "\nGoodbye!\n".colorize(:green)
                elsif input == "main"
                    get_input_main_options
                elsif input == "all"
                    display_all
                elsif !result_array.include?(result_array[input.to_i - 1])
                    puts "\nNo match found. Please try again.\n".colorize(:red)
                    get_input_sub(result_array)
                else
                    display_detail(result_array[input.to_i - 1])
                    puts "\nEnter another number to see location details, 'all' to see the full list, 'main' to return to the main menu,\nor 'exit' to end the program.\n".colorize(:yellow)
                    get_input_sub(result_array)
                end
            end
        end
    
        def get_input_all(all_sites)
            input = nil
            while input == nil
                input = gets.strip.downcase 
                if input == "exit"
                    puts "\nGoodbye!\n".colorize(:green)
                elsif input == "main"
                    get_input_main_options
                elsif !all_sites.include?(all_sites[input.to_i - 1])
                    puts "\nNo match found. Please try again.\n".colorize(:red)
                    get_input_all(all_sites)
                elsif input == "all"
                    display_all
                else
                    display_detail(all_sites[input.to_i - 1])
                    puts "\nEnter another number to see location details, 'all' to see the full list again, 'main' to return to the main menu,\nor 'exit' to end the program.\n".colorize(:yellow)
                    get_input_sub(all_sites)
                end
            end
        end
    end
end