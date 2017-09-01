//
//  AlertControllerHelper.swift
//  TestMyApt
//
//  Created by Paulo Rosa on 31/08/17.
//  Copyright © 2017 Paulo Rosa. All rights reserved.
//

import UIKit

class AlertControllerHelper: NSObject {

    static func showApiErrorAlert(_ title: String, message: String, view: UIViewController, handler: ((UIAlertAction) -> Void)?) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: handler)
        ac.addAction(ok)
        view.present(ac, animated: true, completion: nil)
    }

    static func showApiSuccessAlert(_ title: String, message: String, view: UIViewController, handler: ((UIAlertAction) -> Void)?) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: handler)
        ac.addAction(ok)
        view.present(ac, animated: true, completion: nil)
    }

    static func showAlertInternet(_ view: UIViewController, handler: ((UIAlertAction) -> Void)?) {
        let ac = UIAlertController(title: "Internet",
                                   message: "Você precisa estar conectado a internet para continuar utilizando as features deste App de Teste",
                                   preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: handler)
        ac.addAction(ok)
        view.present(ac, animated: true, completion: nil)
    }

}
