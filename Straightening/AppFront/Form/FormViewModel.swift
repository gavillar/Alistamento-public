//
//  FormViewModel.swift
//  Straightening
//
//  Created by user220831 on 11/17/22.
//

import Foundation
import UIKit


protocol SendResultCepProtocol {
    func sendApiCep(cep: Cep)
}

class FormViewModel {
    weak var formviewcontroller: FormViewController?
    var sendCepDelegate: SendResultCepProtocol?
    
    func getApiCep() {
        
        Task {
            guard let data = await Network.call(from: "https://viacep.com.br/ws/\(formviewcontroller?.cepTextField)/json/") else {return}
            guard let cep = Network.decode(Cep.self, from: data) else {return}
            sendCepDelegate?.sendApiCep(cep: cep)
        }
        
    }
    
}
