//
//  Protocols.swift
//  ViperUsage
//
//  Created by Pınar Koçak on 18.04.2022.
//

import Foundation

//main //request // variables // functions
protocol ViewToPresenterProtocol {
    var viewController : PresenterToViewProtocol? {get set}
    var interactor : PresenterToInteractorProtocol? {get set}
    
    func getAPIData(model : [PostModel])
}
// main //request // variables // functions
protocol PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol? {get set}
    
    func getAPIData(model : [PostModel])
}

//carry data //response
protocol InteractorToPresenterProtocol {
    func sendDataToPresenter(result:[PostModel])
}

// carry data //response
protocol PresenterToViewProtocol {
    func sendDataToView(result:[PostModel]?)
}


protocol PresenterToRouterProtocol {
    static func createModule(ref: ViewController)
}

// view to presenter
// presenter to interactor
// interactor to presenter
// presenter to view

// presenter to router


