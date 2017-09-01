//
//  DetailShotViewController.swift
//  TestMyApt
//
//  Created by Paulo Rosa on 01/09/17.
//  Copyright © 2017 Paulo Rosa. All rights reserved.
//

import UIKit
import SDWebImage
import SVProgressHUD

class DetailShotViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelCountViews: UILabel!
    @IBOutlet weak var labelCountComment: UILabel!
    @IBOutlet weak var labelCreatedAt: UILabel!
    var id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.changePlaceholdersStoryboard()
        if ConnectivityHelper.isConnectedToInternet {
            SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
            SVProgressHUD.show()
            self.getAPI()
        } else {
            AlertControllerHelper.showAlertInternet(self, handler: nil)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        SVProgressHUD.dismiss()
    }
    
    func getAPI() {
        let data = URLRequestParams()
        if let idForShot = self.id {
            ShotsApiClient.getShot(idForShot, data: data, success: {shot in
                self.updateUI(shotResponse: shot)
            }, failure: { apiError in
                AlertControllerHelper.showApiErrorAlert("Erro", message: apiError.errorMessage(), view: self, handler: nil) })
        }
    }
    
    //Update UI after the download in API
    func updateUI(shotResponse: Shots) {
        let imageName = "no-image"
        if let image = UIImage(named: imageName), let imageAPI = shotResponse.image {
            imageView.sd_setImage(with: URL(string: imageAPI), placeholderImage: image)
        }
        labelTitle.text = shotResponse.title
        labelDescription.text = shotResponse.desc
        labelCountViews.text = "Numero de Visualizações: \(shotResponse.viewsCount ?? "0")"
        labelCountComment.text = "Numero de Comentários: \(shotResponse.commentsCount ?? "0")"
        labelCreatedAt.text = shotResponse.createdAt
        SVProgressHUD.dismiss()
    }
    
    //Only for hide the placeholders put in Storyboard
    func changePlaceholdersStoryboard() {
        labelTitle.text = ""
        labelDescription.text = ""
        labelCountViews.text = ""
        labelCountComment.text = ""
        labelCreatedAt.text = ""
    }
}
