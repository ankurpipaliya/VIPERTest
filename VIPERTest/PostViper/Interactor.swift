//
//  Interactor.swift
//  ViperUsage
//
//  Created by Pınar Koçak on 18.04.2022.
//

import Foundation

class Interactor: PresenterToInteractorProtocol {
    var presenter : InteractorToPresenterProtocol?
    var posts = [PostModel]()
    let url = "https://jsonplaceholder.typicode.com/posts/"

    func getAPIData(model: [PostModel]) {
        
       // let result = PostModel(userID: 11, id: 1, title: "This is Title", body: "This is Body ho Bhai..")
        HTTPManager.shared.get(urlString: url) { [weak self] ress in
            guard let self = self else {return}
            switch ress {
            case .failure(let err):
                print ("failure", err)
            case .success(let dat):
                let decoder = JSONDecoder()
                do {
                    self.posts = try decoder.decode([PostModel].self, from: dat)
                    
                    self.presenter?.sendDataToPresenter(result: self.posts)
                   // completion(.success(try decoder.decode([PostModel].self, from: dat)))
                } catch let err{
                    print("error in completon \(err)")
                }
            }
        }
    }
}
