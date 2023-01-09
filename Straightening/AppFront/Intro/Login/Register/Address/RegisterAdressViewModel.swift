//
//  RegisterAdressViewModel.swift
//  Straightening
//
//  Created by user220831 on 11/17/22.
//

import UIKit

protocol UpdateFormAdressViewModel {
    func updateForm()
}
		
protocol RegisterAdressViewModelProtocol {
    func sendCep(cep: RegisterModel.Cep)
}

class RegisterAdressViewModel {
// MARK: - var and let
    var updateFormDelegate: UpdateFormAdressViewModel?
    var formViewModelDelegate: RegisterAdressViewModelProtocol?
    var cep: String = ""
// MARK: - getApiCep
    func getApiCep() {
        Task { [weak self] in
            guard self != nil else {return}
            guard let data = await Network.call(from: Network.EndPoints.cepInformation(cep)) else {return}
            guard let cep = await Network.decode(RegisterModel.Cep.self, from: data) else {return}
            print(cep)
            formViewModelDelegate?.sendCep(cep: cep)
            updateFormDelegate?.updateForm()
        }
    }
}
