//
//  Router.swift
//  ViperUsage
//
//  Created by Pınar Koçak on 18.04.2022.
//

import Foundation

class Router : PresenterToRouterProtocol {
    static func createModule(ref: ViewController) {
        let presenter = Presenter()
        ref.presenterObj = presenter
        ref.presenterObj?.interactor = Interactor()
        ref.presenterObj?.viewController = ref
        ref.presenterObj?.interactor?.presenter = presenter
    }
}

