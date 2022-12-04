//
//  LoginModel.swift
//  Straightening
//
//  Created by user220831 on 12/2/22.
//

import Foundation
import UIKit

protocol AuthenticationLoginViewModel {
    var formatIsValid: Bool {get}
    var backgroundCollorButton: UIColor {get}
    var titleColorButton: UIColor {get}
}
protocol UpdateFormViewModel: AnyObject {
    func updateForm()
}
protocol AuthenticationLoginFail: AnyObject {
    func showView()
}
protocol AuthenticationDelegate: AnyObject {
    func nextView()
}
