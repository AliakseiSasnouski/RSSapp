//
//  MainTableViewController.swift
//  OpApp
//
//  Created by MacBook on 08.07.17.
//  Copyright © 2017 MacBook. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var sitesArray: [SiteModel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tutBy = SiteModel(title: "TuT By", image: UIImage(named: "tut"), url: URL(string: "https://news.tut.by/rss/index.rss"))
        let onliner = SiteModel(title: "Onliner", image: UIImage(named: "onliner"), url: URL(string: "https://auto.onliner.by/feed"))
        
        sitesArray = [tutBy, onliner]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sitesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MainID", for: indexPath) as? MainTableViewCell {
            let siteModel = sitesArray[indexPath.row]

            cell.titleLabel.text = siteModel.title
            cell.imageTitleView.image = siteModel.image
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToNews", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let rowIndex = self.tableView.indexPathForSelectedRow?.row {
            (segue.destination as? NewsTableViewController)?.siteModel = sitesArray[rowIndex]
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
