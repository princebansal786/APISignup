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
    required init?(map: Map)
    {
        username <- map["username"]
        email <- map["email"]
        password <- map["password"]
        phone <- map["phone"]
        country <- map["country"]
        city <- map["city"]
        address <- map["address"]
    }
    func mapping(map: Map){
        username <- map["username"]
        email <- map["email"]
        password <- map["password"]
        phone <- map["phone"]
        country <- map["country"]
        city <- map["city"]
        address <- map["address"]
        
    }

}

