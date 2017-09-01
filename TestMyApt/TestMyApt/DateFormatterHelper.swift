//
//  DateFormatterHelper.swift
//  TestMyApt
//
//  Created by Paulo Rosa on 01/09/17.
//  Copyright © 2017 Paulo Rosa. All rights reserved.
//

import UIKit

class DateFormatterHelper: NSObject {

    static func formatterDate(createdAt: String) -> String {
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
