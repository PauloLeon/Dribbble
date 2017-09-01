//
//  ShotViewModel.swift
//  TestMyApt
//
//  Created by Paulo Rosa on 01/09/17.
//  Copyright © 2017 Paulo Rosa. All rights reserved.
//

import UIKit

public final class ShotViewModel {

    // MARK: - Instance Properties
    public let shot: Shots

    public let title: String
    public let image: URL?
    public let desc: String
    public let countViews: String
    public let countComment: String
    public let createdAt: String
    public let placeholderImage: UIImage?

    // MARK: - Object Lifecycle
    public init(shot: Shots) {
        self.shot = shot
        guard let title = shot.title, let desc = shot.desc,
           let countViews = shot.viewsCount, let createdAt = shot.createdAt,
           let countComment =  shot.commentsCount, let imageString = shot.image else {
            self.title = ""
            self.desc = ""
            self.countViews = ""
            self.createdAt = ""
            self.countComment = ""
            self.image = URL(string: "")
            self.placeholderImage = UIImage(named: "no-image")
            return
        }
        self.title = title
        self.desc = desc
        self.countViews = "Numero de Visualizações: \(countViews)"
        self.createdAt = ShotViewModel.formatterDate(createdAt: createdAt)
        self.countComment = "Numero de Comentários: \(countComment)"
        self.image = URL(string: imageString)
        self.placeholderImage = UIImage(named: "no-image")
    }
    // MARK: - Static Func
    internal static func formatterDate(createdAt: String) -> String {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: createdAt)
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        dateFormatter.locale = tempLocale
        guard let dateFor = date else {
            return "Data não reconhecida"
        }
        let dateString = dateFormatter.string(from: dateFor)
        return dateString
    }
}
