//
//  Interactor.swift
//  ViperUsage
//
//  Created by Pınar Koçak on 18.04.2022.
//

import Foundation

class CommentInteractor: CommentPresenterToInteractorProtocol {
    var presenter: CommentInteractorToPresenterProtocol?
    var comments = [CommentModel]()
    let endpoint = "/comments"
    let url = "https://jsonplaceholder.typicode.com/posts/"
    
    func getCommentAPIData(_id:Int,model: [CommentModel]) {
        
       // let result = PostModel(userID: 11, id: 1, title: "This is Title", body: "This is Body ho Bhai..")
        HTTPManager.shared.get(urlString: url + "\(_id)" + endpoint) { [weak self] ress in
            guard let self = self else {return}
            switch ress {
            case .failure(let err):
                print ("failure", err)
            case .success(let dat):
                let decoder = JSONDecoder()
                do {
                    self.comments = try decoder.decode([CommentModel].self, from: dat)
                    
                    self.presenter?.sendDataToPresenter(result: self.comments)
                   // completion(.success(try decoder.decode([PostModel].self, from: dat)))
                } catch let err{
                    print("error in completon \(err)")
                }
            }
        }
    }
}
