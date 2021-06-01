class PHLCovidTesting::API
    def self.get_data
        uri = URI.parse("https://services.arcgis.com/fLeGjb7u4uXqeF9q/arcgis/rest/services/PHL_COVID19_Testing_Sites_PUBLICVIEW/FeatureServer/0/query?where=1%3D1&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&resultType=none&distance=0.0&units=esriSRUnit_Meter&returnGeodetic=false&outFields=*&returnGeometry=true&featureEncoding=esriDefault&multipatchOption=xyFootprint&maxAllowableOffset=&geometryPrecision=&outSR=&datumTransformation=&applyVCSProjection=false&returnIdsOnly=false&returnUniqueIdsOnly=false&returnCountOnly=false&returnExtentOnly=false&returnQueryGeometry=false&returnDistinctValues=false&cacheHint=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&having=&resultOffset=&resultRecordCount=&returnZ=false&returnM=false&returnExceededLimitFeatures=true&quantizationParameters=&sqlFormat=none&f=pjson&token=")
        response = Net::HTTP.get_response(uri)
        json = JSON.parse(response.body)
        json["features"].map do |location_set|
            map_data(location_set)
        end
    end

    def self.map_data(location_set)
        name = location_set["attributes"]["testing_location_nameoperator"]
        phone = location_set["attributes"]["contact_phone_number"] || nil
        street = location_set["attributes"]["testing_location_address"].strip
        zipcode = location_set["attributes"]["zipcode"]
        address = "#{street}, Philadelphia, PA #{zipcode}"
        referral = location_set["attributes"]["Referral"].capitalize unless referral == nil

        base_data = {
            name: name,
            phone: phone,
            street: street,
            zipcode: zipcode,
            address: address,
            referral: referral
        }

        map_access_type(location_set, base_data)
    end

    def self.map_access_type(location_set, base_data)
        access_type = location_set["attributes"]["drive_thruwalk_up"]

        case access_type
        when "wu"
            access_type = "Walk-up"
        when "both"
            access_type = "Drive-thru and Walk-up"
        else
            access_type = "Drive-thru"
        end

        base_data[:access_type] = access_type

        map_facility_type(location_set, base_data) 
    end

    def self.map_facility_type(location_set, base_data)
        facility_type = location_set["attributes"]["facility_type"]
        
        case facility_type
        when "fieldSite"
            facility_type = "Field site"
        when "urgentCare"
            facility_type = "Urgent care"
        when "drugstore"
            facility_type = "Drug store"
        when "phmcHC"
            facility_type = "PHMC health center"
        when "cityHC"
            facility_type = "City health center"
        else
            facility_type = facility_type.capitalize
        end

        base_data[:facility_type] = facility_type
        base_data
    end
end