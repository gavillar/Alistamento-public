//
//  FormViewModel.swift
//  Straightening
//
//  Created by user220831 on 11/17/22.
//

import Foundation
import UIKit

protocol FormViewModelProtocol {
    func sendCep(cep: Cep)
}

class FormViewModel {
// MARK: - var and let 
    var formViewModelDelegate: FormViewModelProtocol?
    var cep: String = ""
// MARK: - getApiCep
        func getApiCep() {
            Task {
                guard let data = await Network.call(from: Network.EndPoints.cepInformation(cep)) else {return}
                guard let cep = await Network.decode(Cep.self, from: data) else {return}
                print(cep)
                formViewModelDelegate?.sendCep(cep: cep)
            }
        }
}
