import UIKit
import SkyFloatingLabelTextField
import SVProgressHUD
import  ObjectMapper
import  Alamofire
import M13Checkbox
class SignInViewController: UIViewController {
//    var username = String()
//    var email = String()
//    var password = String()
//    var phone = String()
//    var country = String()
//    var city = String()
//    var address = String()
//    
    //var start = 1
    @IBOutlet weak var usernametxt: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordtxt: SkyFloatingLabelTextField!
    @IBOutlet weak var rememberMe: M13Checkbox!
    @IBOutlet weak var signIn: UIButton!
    @IBAction func fogotPasswordButton(_ sender: Any) {
    }
    @IBAction func signUpButton(_ sender: Any) {
        performSegue(withIdentifier: "SignInViewController", sender: nil)
    }
    @IBAction func signInButton(_ sender: Any) {
//        if(usernametxt.text?.isEmpty)!
//        {
//            alert(msg:"fill firstname")
//        }
//        else if(passwordtxt.text?.isEmpty)!
//        {
//            alert(msg:"fill password")
//        }
//        else
//        {
            //SVProgressHUD.show()
////      UIApplication.shared.beginIgnoringInteractionEvents()
            fetchData()
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        rememberMe._IBBoxType="square"
        rememberMe.cornerRadius=0
        rememberMe.stateChangeAnimation=M13Checkbox.Animation(rawValue: "Fill")!
        if let login = UserDefaults.standard.value(forKey: "login") as? [String: String] {
            usernametxt.text = login["email"]
            passwordtxt.text = login["password"]
            if !login.isEmpty {
                rememberMe.setCheckState(M13Checkbox.CheckState(rawValue: "Checked")!, animated: true)
            }
        }

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func alert(msg:String)
    {
        let alert = UIAlertView()
        alert.title = msg
        alert.message = "Invalid Signup"
        alert.addButton(withTitle: "Ok")
        alert.show()
    }
        func fetchData() {
        let parameter:[String:String] = ["email":usernametxt.text!, "password":passwordtxt.text!, "flag":"1"]
            var details:[String: String] = [:]
        APISignup.fetchData(url: "login", parameters: parameter) { (jsonData) in
            let userModel = Mapper<User>().map(JSONObject: jsonData)
//            if (userModel?.msg ?? "").isEqual("User is not Registered!") {
//                self.alert(msg: "User not found")
//            }
//            else if (userModel?.msg ?? "").isEqual("Password Incorrect!") {
//                self.alert(msg: "Incorrect Password")
//            }
//            else
//            {
            details["username"] = userModel?.profile?.username ?? ""
            details["phone"] = userModel?.profile?.phone ?? ""
            details["email"] = userModel?.profile?.email ?? ""
            details["password"] = userModel?.profile?.password ?? ""
            details["country"] = (userModel?.profile?.country) ?? ""
            details["city"] = (userModel?.profile?.city) ?? ""
            details["address"]
                = (userModel?.profile?.address) ?? ""
            self.performSegue(withIdentifier: "SignInViewController2", sender: details)
            //SVProgressHUD.dismiss()
        //}
    }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if segue.identifier=="SignInViewController2"
            {
                let segueDestination = segue.destination as? PersonalInformationViewController
                segueDestination?.userDetails=sender as? [String:String]
                            }
        }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        if segue.identifier == "SignInViewController2"
//        {
//            let segueDestination = (segue.destination as! PersonalInformationViewController)
//            segueDestination.username = self.username ?? ""
//            segueDestination.phoneNumber = self.phone ?? ""
//            segueDestination.email = self.email ?? ""
//            segueDestination.country = self.country ?? ""
//            segueDestination.city = self.city ?? ""
//            segueDestination.address = self.address ?? ""
//            segueDestination.password = self.password ?? ""
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
