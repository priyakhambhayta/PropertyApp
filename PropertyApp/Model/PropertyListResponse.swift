//
//  PropertyListResponse.swift
//  PropertyApp
//
//  Created by Priya Gajjar on 12/05/21.
//

import Foundation

struct PropertyListResponse: Decodable {
    
    var data: [PropertyList]?
    
    enum CodingKeys: String, CodingKey {
        
        case data
    }
    
    init(from decoder: Decoder) throws {
        
        do {
            
            let values = try decoder.container(keyedBy: CodingKeys.self)
            data = try? values.decode([PropertyList].self, forKey: .data)

            
        }catch {
            print("Unnable to parse Response Data: \(error)")
        }
    }
}

struct PropertyList: Decodable {
    
    var id: String?
    var auction_date: String?
    var available_from: String?
    var bedrooms: Int?
    var bathrooms: Int?
    var carspaces: Int?
    var date_first_listed: String?
    var date_updated: String?
    var description: String?
    var display_price: String?
    var currency: String?
    var location: Location?
    var owner: Owner?
    var property_images: [PropertyImages]?
    var agent: Agent?
    var property_type: String?
    var sale_type: String?
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case auction_date
        case available_from
        case bedrooms
        case bathrooms
        case carspaces
        case date_first_listed
        case date_updated
        case description
        case display_price
        case currency
        case location
        case owner
        case property_images
        case agent
        case property_type
        case sale_type
    }
    init(from decoder: Decoder) throws {
        
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try? values.decode(String.self, forKey: .id)
            auction_date = try? values.decode(String.self, forKey: .auction_date)
            available_from = try? values.decode(String.self, forKey: .available_from)
            bedrooms = try? values.decode(Int.self, forKey: .bedrooms)
            bathrooms = try? values.decode(Int.self, forKey: .bathrooms)
            carspaces = try? values.decode(Int.self, forKey: .carspaces)
            date_first_listed = try? values.decode(String.self, forKey: .date_first_listed)
            date_updated = try? values.decode(String.self, forKey: .date_updated)
            description = try? values.decode(String.self, forKey: .description)
            display_price = try? values.decode(String.self, forKey: .display_price)
            currency = try? values.decode(String.self, forKey: .currency)
            location = try? values.decode(Location.self, forKey: .location)
            owner = try? values.decode(Owner.self, forKey: .owner)
            property_images = try? values.decode([PropertyImages].self, forKey: .property_images)
            agent = try? values.decode(Agent.self, forKey: .agent)
            property_type = try? values.decode(String.self, forKey: .property_type)
            sale_type = try? values.decode(String.self, forKey: .sale_type)
        }catch {
            print("Unnable to parse Property List Data: \(error)")
        }
    }
}

struct Location: Decodable {
    
    var address: String?
    var state: String?
    var suburb: String?
    var postcode: String?
    var latitude: Double?
    var longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        
        case address
        case state
        case suburb
        case postcode
        case latitude
        case longitude
    }
    init(from decoder: Decoder) throws {
        
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            address = try? values.decode(String.self, forKey: .address)
            state = try? values.decode(String.self, forKey: .state)
            suburb = try? values.decode(String.self, forKey: .suburb)
            postcode = try? values.decode(String.self, forKey: .postcode)
            latitude = try? values.decode(Double.self, forKey: .latitude)
            longitude = try? values.decode(Double.self, forKey: .longitude)
        }catch {
            print("Unaable to parse Location Data: \(error)")
        }
    }
}

struct Owner: Decodable {
    
    var first_name: String?
    var last_name: String?
    var dob: String?
    var avatar: Avatar?
    
    enum CodingKeys: String, CodingKey {
        
        case first_name
        case last_name
        case dob
        case avatar
    }
    init(from decoder: Decoder) throws {
        
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            first_name = try? values.decode(String.self, forKey: .first_name)
            last_name = try? values.decode(String.self, forKey: .last_name)
            dob = try? values.decode(String.self, forKey: .dob)
            avatar = try? values.decode(Avatar.self, forKey: .avatar)
        }catch {
            print("Unaable to parse Owner Data: \(error)")
        }
    }
}

struct Avatar: Decodable {
    
    var small: Small?
    var medium: Medium?
    var large: Large?
    
    enum CodingKeys: String, CodingKey {
        
        case small
        case medium
        case large
    }
    init(from decoder: Decoder) throws {
        
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            small = try? values.decode(Small.self, forKey: .small)
            medium = try? values.decode(Medium.self, forKey: .medium)
            large = try? values.decode(Large.self, forKey: .large)
        }catch {
            print("Unaable to parse Avatar Data: \(error)")
        }
    }
}

struct Small: Decodable {
    
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        
        case url
    }
    init(from decoder: Decoder) throws {
        
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try? values.decode(String.self, forKey: .url)
        }catch {
            print("Unaable to parse Small Data: \(error)")
        }
    }
}

struct Medium: Decodable {
    
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        
        case url
    }
    init(from decoder: Decoder) throws {
        
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try? values.decode(String.self, forKey: .url)
        }catch {
            print("Unaable to parse Medium Data: \(error)")
        }
    }
}

struct Large: Decodable {
    
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        
        case url
    }
    init(from decoder: Decoder) throws {
        
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try? values.decode(String.self, forKey: .url)
        }catch {
            print("Unaable to parse Large Data: \(error)")
        }
    }
}

struct Thumb: Decodable {
    
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        
        case url
    }
    init(from decoder: Decoder) throws {
        
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try? values.decode(String.self, forKey: .url)
        }catch {
            print("Unaable to parse Thumb Data: \(error)")
        }
    }
}

struct PropertyImages: Decodable {
    
    var id: Int?
    var attachment: Attachment?

    enum CodingKeys: String, CodingKey {
        
        case id
        case attachment
    }
    init(from decoder: Decoder) throws {
        
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try? values.decode(Int.self, forKey: .id)
            attachment = try? values.decode(Attachment.self, forKey: .attachment)
        }catch {
            print("Unaable to parse PropertyImages Data: \(error)")
        }
    }
}

struct Attachment: Decodable {
    
    var url: String?
    var thumb: Thumb?
    var medium: Medium?
    var large: Large?

    enum CodingKeys: String, CodingKey {
        
        case url
        case thumb
        case medium
        case large
    }
    init(from decoder: Decoder) throws {
        
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            url = try? values.decode(String.self, forKey: .url)
            thumb = try? values.decode(Thumb.self, forKey: .thumb)
            medium = try? values.decode(Medium.self, forKey: .medium)
            large = try? values.decode(Large.self, forKey: .large)
        }catch {
            print("Unaable to parse Attachment Data: \(error)")
        }
    }
}

struct Agent: Decodable {
    
    var first_name: String?
    var last_name: String?
    var company_name: String?
    var avatar: Avatar?
       
    enum CodingKeys: String, CodingKey {
        
        case first_name
        case last_name
        case company_name
        case avatar
    }
    init(from decoder: Decoder) throws {
        
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            first_name = try? values.decode(String.self, forKey: .first_name)
            last_name = try? values.decode(String.self, forKey: .last_name)
            company_name = try? values.decode(String.self, forKey: .company_name)
            avatar = try? values.decode(Avatar.self, forKey: .avatar)
        }catch {
            print("Unaable to parse Agent Data: \(error)")
        }
    }
}
