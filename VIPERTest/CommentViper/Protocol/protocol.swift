//
//  Protocols.swift
//  ViperUsage
//
//  Created by Pınar Koçak on 18.04.2022.
//

import Foundation

//main //request // variables // functions
protocol CommentViewToPresenterProtocol {
    var viewController : CommentPresenterToViewProtocol? {get set}
    var interactor : CommentPresenterToInteractorProtocol? {get set}
    
    func getCommentAPIData(_id: Int,model : [CommentModel])
}
// main //request // variables // functions
protocol CommentPresenterToInteractorProtocol {
    var presenter: CommentInteractorToPresenterProtocol? {get set}
    
    func getCommentAPIData(_id: Int,model : [CommentModel])
}

//carry data //response
protocol CommentInteractorToPresenterProtocol {
    func sendDataToPresenter(result:[CommentModel])
}

// carry data //response
protocol CommentPresenterToViewProtocol {
    func sendDataToView(result:[CommentModel]?)
}


protocol CommentPresenterToRouterProtocol {
    static func createModule(ref: CommentViewController)
}

// view to presenter
// presenter to interactor
// interactor to presenter
// presenter to view

// presenter to router


