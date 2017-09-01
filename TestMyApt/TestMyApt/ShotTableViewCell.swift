//
//  ShotTableViewCell.swift
//  TestMyApt
//
//  Created by Paulo Rosa on 31/08/17.
//  Copyright © 2017 Paulo Rosa. All rights reserved.
//

import UIKit

class ShotTableViewCell: UITableViewCell {

    @IBOutlet weak var imageShot: UIImageView!
    @IBOutlet weak var titleShot: UILabel!
    @IBOutlet weak var viewCountShot: UILabel!
    @IBOutlet weak var createdAtShot: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
