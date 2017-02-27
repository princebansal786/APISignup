import UIKit
import Alamofire
import ObjectMapper
import SkyFloatingLabelTextField
import  SVProgressHUD
class PersonalDetailsViewController: UIViewController {
//    var username = String()
//    var email = String()
//    var password = String()
//    var phoneNumber = String()
//    var country = String()
//    var city = String()
//    var address = String()
    
    //var start=true
    @IBOutlet weak var name: SkyFloatingLabelTextField!
    @IBOutlet weak var emailAddress: SkyFloatingLabelTextField!
    @IBOutlet weak var pswrd: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneNo: SkyFloatingLabelTextField!
    @IBOutlet weak var kountry: SkyFloatingLabelTextField!
    @IBOutlet weak var sity: SkyFloatingLabelTextField!
    @IBOutlet weak var addres: SkyFloatingLabelTextField!
    @IBAction func backButton(_ sender: Any) {
        _=self.navigationController?.popViewController(animated: true)
    }
    @IBAction func nextButton(_ sender: Any) {
//        if(name.text?.isEmpty)!
//        {
//            alert(msg:"fill firstname")
//            //start=false
//        }
//        else if(emailAddress.text?.isEmpty)!
//        {
//            alert(msg:"fill email")
//            //start=false
//        }
//        else if(pswrd.text?.isEmpty)!
//        {
//            alert(msg:"fill password")
//        }
//        else if(phoneNo.text?.isEmpty)!
//        {
//            alert(msg:"fill phone no")
//        }
//        else if(kountry.text?.isEmpty)!
//        {
//            alert(msg:"fill country")
//        }
//        else if(sity.text?.isEmpty)!
//        {
//            alert(msg:"fill city")
//        }
//        else if(addres.text?.isEmpty)!
//        {
//            alert(msg:"fill address")
//        }
//        else if(!isValidAlphabet(testStr: name.text ?? "")) {
//            alert(msg:"fill valid name")
//        }
//        else if(!isAlphabetLength(alphabet: name.text ?? "")){
//            alert(msg:"fill valid length of name")
//        }
//        else if !validateEmail(enteredEmail: emailAddress.text ?? ""){
//            alert(msg:"fill valid email")
//        }
//        else if !isPwdLength(password: pswrd.text ?? "") {
//            alert(msg:"fill valid password length")
//        }
//        else if !isValidPhoneNumber(value:phoneNo.text ?? ""){
//            alert(msg:"fill valid phone no")
//        }
//        else if !isPhoneNumberLength(phone_number: phoneNo.text ?? ""){
//            alert(msg:"fill valid phone no length")
//        }
//        else
//        {
            SVProgressHUD.show()
////          UIApplication.shared.beginIgnoringInteractionEvents()
            fetchData()
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -500
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    func isValidAlphabet(testStr: String) -> Bool {
        
        let alphabetRegEx = "^[a-zA-Z]+$"
        let alphabetTest = NSPredicate(format:"SELF MATCHES %@", alphabetRegEx)
        return alphabetTest.evaluate(with: testStr)
    }
    
    func alert(msg:String)
    {
        let alert = UIAlertView()
        alert.title = msg
        alert.message = "Invalid Signup"
        alert.addButton(withTitle: "Ok")
        alert.show()
    }
    func isAlphabetLength(alphabet: String) -> Bool {
        if alphabet.characters.count <= 15{
            return true
        }
        return false
    }
    func validateEmail(enteredEmail:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
    func isPwdLength(password: String) -> Bool {
        if password.characters.count <= 15{
            return true
        }
        else{
            return false
        }
    }
    func isPhoneNumberLength(phone_number: String) -> Bool {
        if phone_number.characters.count <= 13{
            return true
        }
        else{
            return false
        }
    }
    func isValidPhoneNumber(value: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    func fetchData() {
        let parameter:[String:String] = ["username":name.text ?? "",
                                  "email":emailAddress.text ?? "",
                                  "password":pswrd.text ?? "",
                                  "country":kountry.text ?? "",
                                  "city":sity.text ?? "",
                                  "phone":phoneNo.text ?? "",
                                  "address":addres.text ?? "","flag": "1",
                                  "birthday": "04/06/1993",
                                  "country_code": "001",
                                  "postal_code": "100",
                                  "country_iso3": "blah--blah",
                                  "state": "chandigarh"]
        APISignup.fetchData(url: "signup", parameters: parameter) { (jsonData) in
            let userModel = Mapper<User>().map(JSONObject: jsonData)
//            print(userModel?.profile?.username ?? "")
//            self.username   = (userModel?.profile?.username) ?? ""
//            print(userModel?.profile?.phone ?? "")
//            self.phoneNumber = (userModel?.profile?.phone) ?? ""
//            print(userModel?.profile?.email ?? "")
//            self.email = (userModel?.profile?.email) ?? ""
//            print(userModel?.profile?.password ?? "")
//            self.password = (userModel?.profile?.password) ?? ""
//            print(userModel?.profile?.country ?? "")
//            self.country = (userModel?.profile?.country) ?? ""
//
//            print(userModel?.profile?.city ?? "")
//            self.city = (userModel?.profile?.city) ?? ""
//            print(userModel?.profile?.address ?? "")
//            self.address = (userModel?.profile?.address) ?? ""
//
//          self.performSegue(withIdentifier: "ViewToPersonal", sender: self)
           SVProgressHUD.dismiss()
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        if segue.identifier == "ViewToPersonal"
//        {
//            let destinationData = (segue.destination as! PersonalInformationViewController)
//            
//            destinationData.username = self.username ?? ""
//            destinationData.phoneNumber = self.phoneNumber ?? ""
//            destinationData.password = self.password ?? ""
//            destinationData.email = self.email ?? ""
//            destinationData.country = self.country ?? ""
//            destinationData.city = self.city ?? ""
//            destinationData.address = self.address ?? ""
//        }
//    }
    

}
