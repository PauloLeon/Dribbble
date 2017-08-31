//
//  String+Extensions.swift
//  TestMyApt
//
//  Created by Paulo Rosa on 31/08/17.
//  Copyright © 2017 Paulo Rosa. All rights reserved.
//

import Foundation

extension String {
    
    var titleize: String {
        var words = self.lowercased().characters.split { $0 == " " }.map { String($0) }
        words[0] = words[0].capitalized
        
        return words.joined(separator: " ")
    }
    
}
