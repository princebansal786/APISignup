import Foundation
import ObjectMapper
class User: Mappable {
    var statusCode: Int?
    var msg: String?
    var profile: Profile?
    
    required init?(map: Map){
        statusCode <- map["status_code"]
        msg <- map["msg"]
        profile <- map["profile"]
    }
    
    func mapping(map: Map){
        statusCode <- map["status_code"]
        msg <- map["msg"]
        profile <- map["profile"]
    }
}
class Profile: Mappable
{
    var username: String?
    var email: String?
    var password: String?
    var phone: String?
    var country: String?
    var city: String?
    var address: String?
    var flag: String?
    var birthday: String?
    var country_code: String?
    var postal_code: String?
    var country_iso3: String?
    var state: String?
    required init?(map: Map)
    {
        username <- map["username"]
        email <- map["email"]
        password <- map["password"]
        phone <- map["phone"]
        country <- map["country"]
        city <- map["city"]
        address <- map["address"]
        flag <- map["flag"]
        birthday <- map["birthday"]
        country_code <- map["country_code"]
        postal_code <- map["postal_code"]
        country_iso3 <- map["country_iso3"]
        state <- map["state"]
    }
    func mapping(map: Map){
        username <- map["username"]
        email <- map["email"]
        password <- map["password"]
        phone <- map["phone"]
        country <- map["country"]
        city <- map["city"]
        address <- map["address"]
        flag <- map["flag"]
        birthday <- map["birthday"]
        country_code <- map["country_code"]
        postal_code <- map["postal_code"]
        country_iso3 <- map["country_iso3"]
        state <- map["state"]
    }

}

