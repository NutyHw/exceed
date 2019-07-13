//
//  QuestionViewController.swift
//  Projectwatch
//
//  Created by Chanokchon on 13/7/2562 BE.
//  Copyright © 2562 Chanokchon. All rights reserved.
//

import UIKit
import SafariServices

class QuestionViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    var namecontent = ["What is depression?","How to deal with?","Mental Health Center"]
    var url = ["https://www.sanook.com/health/721/?fbclid=IwAR03GiH2k7nmu1u3jjnRctVm8oPNGwdOTrHoO6ucOKxBkEzLSFFPfcMP23I","https://www.bangkokhospital.com/th/disease-treatment/depression-treatment","https://www.bumrungrad.com/th/mental-health-center-bangkok-thailand?fbclid=IwAR0mB_jRH4wTq4-yIgy694HI_qEFyXoCJN45A56U9tahAMayO7raK6IcWRY"]
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namecontent.count
    }
    override func viewDidAppear(_ animated: Bool) {
        return table.reloadData()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let Url = URL(string: url[indexPath.row]) {

            let svc = SFSafariViewController(url: Url)
            present(svc, animated: true, completion: nil)
            
        }
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = namecontent[indexPath.row]
        return cell
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
