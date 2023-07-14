//
//  Presenter.swift
//  ViperUsage
//
//  Created by Pınar Koçak on 18.04.2022.
//

import Foundation

class CommentPresenter: CommentViewToPresenterProtocol, CommentInteractorToPresenterProtocol {
    var viewController: CommentPresenterToViewProtocol?
    var interactor: CommentPresenterToInteractorProtocol?
 
    //request
    func getCommentAPIData(_id: Int,model: [CommentModel]) {
        interactor?.getCommentAPIData(_id: _id,model: model)

    }
    //response

    func sendDataToPresenter(result: [CommentModel]) {
        viewController?.sendDataToView(result: result)
    }
    
   
}
