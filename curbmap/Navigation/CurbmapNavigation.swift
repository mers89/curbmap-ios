//
//  CurbmapNavigation.swift
//  curbmap
//
//  Created by Eli Selkin on 7/14/17.
//  Copyright © 2017 curbmap. All rights reserved.
//

import UIKit
import CoreLocation

class CurbmapNavigation: UITableViewController{
    let backgroundImage = UIImage(named: "curb.jpg")
    
    override func viewWillAppear(_ animated: Bool) {
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.backgroundColor =  UIColor(displayP3Red: 0.7, green: 0.3, blue: 0.3, alpha: 0.6)
        if (indexPath.section == 0 && indexPath.row == 0) {
            performSegue(withIdentifier: "ViewControllerMap", sender: selectedCell)
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let unSelectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        unSelectedCell.backgroundColor =  UIColor(displayP3Red: 0.4, green: 0.4, blue: 0.4, alpha: 0.6)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return "go to the map..."
        } else if (section == 1) {
            return "got questions about us?"
        } else {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            if (appDelegate.user != nil && appDelegate.user!.isLoggedIn()) {
                return "Settings"
            } else {
                return "Get the most out of the app"
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "curbmapNavigationCell", for: indexPath)
        cell.backgroundColor =  UIColor(displayP3Red: 0.4, green: 0.4, blue: 0.4, alpha: 0.6)
        cell.alpha = 0.9
        cell.textLabel?.textColor = UIColor.white
        if (indexPath.section == 0) {
            cell.textLabel?.text = "Home"
        } else if(indexPath.section == 1) {
            cell.textLabel?.text = "About"
        } else {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            if (appDelegate.user != nil && appDelegate.user!.isLoggedIn()) {
                    cell.textLabel?.text = "Settings"
            } else {
                cell.textLabel?.text = "Login"
            }
        }
        
        return cell
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

    }

}