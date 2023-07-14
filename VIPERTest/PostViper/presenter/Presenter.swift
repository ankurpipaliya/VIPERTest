//
//  Presenter.swift
//  ViperUsage
//
//  Created by Pınar Koçak on 18.04.2022.
//

import Foundation

class Presenter: ViewToPresenterProtocol, InteractorToPresenterProtocol {
    var view: PresenterToViewProtocol?
    
     var viewController: PresenterToViewProtocol?
     var interactor: PresenterToInteractorProtocol?
    //request
    func getAPIData(model: [PostModel]) {
        interactor?.getAPIData(model: model)
    }
    //response
    func sendDataToPresenter(result: [PostModel]) {
        viewController?.sendDataToView(result: result)
    }
}
