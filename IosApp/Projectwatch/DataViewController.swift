//
//  DataViewController.swift
//  Projectwatch
//
//  Created by Chanokchon on 13/7/2562 BE.
//  Copyright © 2562 Chanokchon. All rights reserved.
//

import UIKit
import SafariServices

class DataViewController: UIViewController {

    @IBAction func daily(_ sender: Any) {
        if let Url = URL(string: "https://docs.google.com/spreadsheets/d/e/2PACX-1vTUATt0m7AGf8vuvGiTwHRE9L7vCT0rVuZgdcLXz_y0F8Rmz97tRPumHZ6wz_fHnyQ9Fe1gRzgArKxI/pubchart?oid=1253593954&amp%3Bformat=interactive&fbclid=IwAR27IoFTrk9Ium5aboOx4ir9rIm6jNWtqKIOeuSW9Zk422SZgr9yEK1Np58") {
            
            let svc = SFSafariViewController(url: Url)
            present(svc, animated: true, completion: nil)
            
        }
        
    }
    @IBAction func weekly(_ sender: Any) {
        if let Url = URL(string: "https://docs.google.com/spreadsheets/d/e/2PACX-1vQaneNhn4eDv6g7WB6S7-bjqolLLM8DFuJ__0w1lBs6XjDDV1q-ePP4wmpY1-myvSmc6eF-6x0xBVYO/pubchart?oid=1340364053&amp%3Bformat=interactive&fbclid=IwAR3YiNG-KLuSmgi6YuRWI81u4UOM0kBR1X1ON80notJewan-lJ8VdL2RTrI") {
            
            let svc = SFSafariViewController(url: Url)
            present(svc, animated: true, completion: nil)
            
        }
    }
    @IBAction func monthly(_ sender: Any) {
        if let Url = URL(string: "https://docs.google.com/spreadsheets/d/e/2PACX-1vS4CC9AXHBPhhPOjxcQ9Fd9k2XwMdJwKiUeqOCcEsg5qhquWgZz8wewdVB8ZgTdshDVOmGzdAZsxMCt/pubchart?oid=1442356393&amp%3Bformat=interactive&fbclid=IwAR2B4Z3oo5wsRcJDJMzLlbsYMw4YO4jRLTHlEIAocFHdYTpM87ikZNA9vzs") {
            
            let svc = SFSafariViewController(url: Url)
            present(svc, animated: true, completion: nil)
            
        }
    }
    @IBAction func question(_ sender: Any) {
        if let Url = URL(string: "http://www.thaiteentraining.com/survey/evaluation.php?module=detail&action=view&cid=1&id=5&fbclid=IwAR3eZfKwkSz6vLRS6uInIy1XSuRLDMudpzc-wn9IjcVSo8XRoB_jflJNpqk") {
            
            let svc = SFSafariViewController(url: Url)
            present(svc, animated: true, completion: nil)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
