//
//  ShotsTableViewController.swift
//  TestMyApt
//
//  Created by Paulo Rosa on 31/08/17.
//  Copyright © 2017 Paulo Rosa. All rights reserved.
//

import UIKit
import SDWebImage
import SVProgressHUD

let reuseIdentifier: String = "ShotsCell"

class ShotsTableViewController: UITableViewController {

    var shotsArray = [Shots]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if ConnectivityHelper.isConnectedToInternet {
            SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
            SVProgressHUD.show()
            self.getAPI()
        } else {
            AlertControllerHelper.showAlertInternet(self, handler: nil)
        }
    }
    
    func getAPI(){
        var data = URLRequestParams()
        data["per_page"] = "30"
        ShotsApiClient.allShots(data, success: {shots in
            self.shotsArray = shots
            self.tableView.reloadData()
            SVProgressHUD.dismiss()
        }, failure: { apiError in
            AlertControllerHelper.showApiErrorAlert("Erro", message: apiError.errorMessage(), view: self, handler: nil) })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shotsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ShotTableViewCell else{
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
            return cell
        }

        let imageName = "no-image"
        if let image = UIImage(named: imageName), let imageAPI = self.shotsArray[indexPath.row].image {
            cell.imageShot.sd_setImage(with: URL(string: imageAPI), placeholderImage: image)
        }
        if let title = self.shotsArray[indexPath.row].title,
           let viewsCount = self.shotsArray[indexPath.row].viewsCount,
           let createdAt = self.shotsArray[indexPath.row].createdAt {
            
            cell.titleShot.text = title
            cell.viewCountShot.text = viewsCount
            cell.createdAtShot.text = createdAt
        }
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
