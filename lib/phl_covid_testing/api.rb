class API

    def self.get_data
        uri = URI.parse("https://services.arcgis.com/fLeGjb7u4uXqeF9q/arcgis/rest/services/PHL_COVID19_Testing_Sites_PUBLICVIEW/FeatureServer/0/query?where=1%3D1&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&resultType=none&distance=0.0&units=esriSRUnit_Meter&returnGeodetic=false&outFields=*&returnGeometry=true&featureEncoding=esriDefault&multipatchOption=xyFootprint&maxAllowableOffset=&geometryPrecision=&outSR=&datumTransformation=&applyVCSProjection=false&returnIdsOnly=false&returnUniqueIdsOnly=false&returnCountOnly=false&returnExtentOnly=false&returnQueryGeometry=false&returnDistinctValues=false&cacheHint=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&having=&resultOffset=&resultRecordCount=&returnZ=false&returnM=false&returnExceededLimitFeatures=true&quantizationParameters=&sqlFormat=none&f=pjson&token=")
        response = Net::HTTP.get_response(uri)
        json = JSON.parse(response.body)
        json["features"].map do |location_set|

            name = location_set["attributes"]["testing_location_nameoperator"]
            phone = location_set["attributes"]["contact_phone_number"]
            street = location_set["attributes"]["testing_location_address"].strip
            zipcode = location_set["attributes"]["zipcode"]
            address = "#{street}, Philadelphia, PA #{zipcode}"
            referral = location_set["attributes"]["Referral"]
            referral = referral.capitalize if referral != nil

            access_type = location_set["attributes"]["drive_thruwalk_up"]
            if access_type == "wu"
                access_type = "Walk-up"
            elsif access_type == "both"
                access_type = "Drive-thru and Walk-up"
            else
                access_type = "Drive-thru"
            end

            facility_type = location_set["attributes"]["facility_type"]
            if facility_type == "fieldSite"
                facility_type = "Field site"
            elsif facility_type == "urgentCare"
                facility_type = "Urgent care"
            elsif facility_type == "drugstore"
                facility_type = "Drug store"
            elsif facility_type == "phmcHC"
                facility_type = "PHMC health center"
            elsif facility_type == "cityHC"
                facility_type = "City health center"
            else
                facility_type = facility_type.capitalize
            end

            {
                name: name, 
                phone: phone, 
                street: street, 
                zipcode: zipcode, 
                address: address, 
                access_type: access_type, 
                facility_type: facility_type,
                referral: referral
            }
        end
    end
end