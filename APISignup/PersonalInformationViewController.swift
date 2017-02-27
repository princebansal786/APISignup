import UIKit

class PersonalInformationViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var emailAddress: UILabel!
    @IBOutlet weak var pswrd: UILabel!
    @IBOutlet weak var phoneNo: UILabel!
    @IBOutlet weak var kountry: UILabel!
    @IBOutlet weak var sity: UILabel!
    @IBOutlet weak var addres: UILabel!
    var userDetails:[String:String]?

    @IBAction func backButton(_ sender: Any) {
        _=self.navigationController?.popViewController(animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = ": " + (userDetails?["username"] ?? "nil")
        emailAddress.text = ": " + (userDetails?["email"] ?? "nil")
        pswrd.text = ": " + (userDetails?["password"] ?? "nil")
        phoneNo.text = ": " + (userDetails?["phone"] ?? "nil")
        kountry.text = ": " + (userDetails?["country"] ?? "nil")
        sity.text = ": " + (userDetails?["city"] ?? "nil")
        addres.text = ": " + (userDetails?["address"] ?? "nil")
           }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  }
