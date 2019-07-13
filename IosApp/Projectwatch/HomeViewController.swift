//
//  HomeViewController.swift
//  Projectwatch
//
//  Created by Chanokchon on 13/7/2562 BE.
//  Copyright © 2562 Chanokchon. All rights reserved.
//

import UIKit
import Parse
import Alamofire

class HomeViewController: UIViewController {
    func refresh(){
        if let url = URL(string: "https://exceed.superposition.pknn.dev/data/boobo_hardware") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error)
                } else {
                    if let urlcontent = data {
                        do {
                            let jsonresult = try JSONSerialization.jsonObject(with: urlcontent, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                            print(jsonresult)
                            let danger = jsonresult["isDanger"] as! NSString
                            let wear = jsonresult["isWear"] as! NSString
                            
                            print(danger)
                            DispatchQueue.main.async {
                                if danger == "True" {
                                    self.statusText.text = "Danger"
                                    self.statusText.textColor = UIColor.red
                                } else {
                                    self.statusText.textColor = UIColor.green
                                    self.statusText.text = "Good"
                                }
                                if wear == "True" {
                                    self.wearstate.text = "Now wear"
                                    self.wearstate.textColor = UIColor.green
                                } else {
                                    self.wearstate.textColor = UIColor.red
                                    self.wearstate.text = "Not wear"
                                }
                            }
                        } catch {
                            
                        }
                    }
                }
            }
            task.resume()
        }
    }
    @IBOutlet weak var usernameText: UILabel!
    @IBOutlet weak var emailText: UILabel!
    @IBOutlet weak var genderText: UILabel!
    @IBOutlet weak var phoneText: UILabel!
    @IBOutlet weak var blaidText: UILabel!
    @IBOutlet weak var wearstate: UILabel!
    @IBOutlet weak var statusText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = PFUser.current()!["name"]
        let gender = PFUser.current()!["gender"]
        let phone = PFUser.current()!["phone"]
        let email = PFUser.current()?.email
        let braid = PFUser.current()?.username
        usernameText.text = name as! String
        emailText.text = email
        phoneText.text = phone as! String
        blaidText.text = braid
        genderText.text = gender as! String
        refresh()

        
        // Do any additional setup after loading the view.
    }
    @IBAction func logoutTaooed(_ sender: Any) {
        PFUser.logOut()
        performSegue(withIdentifier: "toLogout", sender: self)
    }
    override func viewDidAppear(_ animated: Bool) {
        refresh()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
