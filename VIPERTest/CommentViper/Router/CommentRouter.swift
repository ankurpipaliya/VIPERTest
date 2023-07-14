//
//  Router.swift
//  ViperUsage
//
//  Created by Pınar Koçak on 18.04.2022.
//

import Foundation

class CommentRouter : CommentPresenterToRouterProtocol {
   
    static func createModule(ref: CommentViewController) {
        let presenter = CommentPresenter()
        ref.presenterObj = presenter
        ref.presenterObj?.interactor = CommentInteractor()
        ref.presenterObj?.viewController = ref
        ref.presenterObj?.interactor?.presenter = presenter
    }
}


