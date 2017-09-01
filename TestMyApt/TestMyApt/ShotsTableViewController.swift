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
        self.initUI()
    }

    func initUI() {
        if ConnectivityHelper.isConnectedToInternet {
            SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
            SVProgressHUD.show()
            self.getAPI()
        } else {
            AlertControllerHelper.showAlertInternet(self, handler: nil)
        }
    }

    func getAPI() {
        var data = URLRequestParams()
        data["per_page"] = "30"
        ShotsApiClient.allShots(data, success: {shots in
            self.shotsArray = shots
            self.tableView.reloadData()
            SVProgressHUD.dismiss()
        }, failure: { apiError in
            AlertControllerHelper.showApiErrorAlert("Erro", message: apiError.errorMessage(), view: self, handler: nil) })
    }

    // MARK: - Actions
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        self.initUI()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shotsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ShotTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
            return cell
        }
        let shotViewModel = ShotViewModel(shot: self.shotsArray[indexPath.row])
        cell.imageShot.sd_setImage(with: shotViewModel.image, placeholderImage: shotViewModel.placeholderImage)
        cell.titleShot.text = shotViewModel.title
        cell.viewCountShot.text = shotViewModel.countViews
        cell.createdAtShot.text = shotViewModel.createdAt

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detail = segue.destination as? DetailShotViewController else {
            return
        }
        if let cell = sender as? UITableViewCell, let tableView = self.tableView {
            if let indexPaths = tableView.indexPath(for: cell) {
                detail.id = self.shotsArray[(indexPaths.row)].id
            }
        }
    }

}
