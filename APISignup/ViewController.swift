import UIKit
import Alamofire
import ObjectMapper
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func fetchData()
    {
        let parameter:[String:Any]=["email":"suvadeepdas91@gmail.com","password":"qwerty","flag":"1"]
        APISignup.fetchData(url: "signup", parameters: parameter) { (jsonData) in
            let userModel = Mapper<User>().map(JSONObject: jsonData)
            print(userModel?.username ?? "")
            print(userModel?.email ?? "")
            print(userModel?.password ?? "")
            print(userModel?.phone ?? "")
            print(userModel?.country ?? "")
            print(userModel?.city ?? "")
            print(userModel?.address ?? "")
            print(userModel?.flag ?? "")
            print(userModel?.birthday ?? "")
            print(userModel?.country_code ?? "")
            print(userModel?.postal_code ?? "")
            print(userModel?.country_iso3 ?? "")
            print(userModel?.state ?? "")
        }
    }
}

