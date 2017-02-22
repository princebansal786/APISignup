import UIKit
import Alamofire
import ObjectMapper
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    func fetchData()
    {
        let parameters:[String:Any]=["email":"suvadeepdas91@gmail.com","password":"qwerty","flag":"1"]
        APISignup.fetchData(url: "signup", parameters: parameters) { (jsonData) in
            let userModel = Mapper<User>().map(JSONObject: jsonData)
            print(userModel?.profile?.username ?? "")
            print(userModel?.profile?.email ?? "")
            print(userModel?.profile?.password ?? "")
            print(userModel?.profile?.phone ?? "")
            print(userModel?.profile?.country ?? "")
            print(userModel?.profile?.city ?? "")
            print(userModel?.profile?.address ?? "")
            print(userModel?.profile?.flag ?? "")
            print(userModel?.profile?.birthday ?? "")
            print(userModel?.profile?.country_code ?? "")
            print(userModel?.profile?.postal_code ?? "")
            print(userModel?.profile?.country_iso3 ?? "")
            print(userModel?.profile?.state ?? "")
        }
    }
}

