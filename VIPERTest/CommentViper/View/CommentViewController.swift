//
//  ViewController.swift
//  ViperUsage
//
//  Created by Pınar Koçak on 18.04.2022.
//

import UIKit


class CommentViewController: UIViewController,CommentPresenterToViewProtocol {
    var getID: Int?
    var commentArr = [CommentModel]()
    @IBOutlet weak var CommentPost: UITableView!
    func sendDataToView(result: [CommentModel]?) {
        guard let arr = result, !arr.isEmpty else {return}
        print( " total Values in post : \(arr.count)")
        self.commentArr = arr
        DispatchQueue.main.async {
            self.CommentPost.reloadData()
        }
        
    }
    
    var presenterObj: CommentViewToPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        print("passed id : \(getID)")
        CommentRouter.createModule(ref: self)
        presenterObj?.getCommentAPIData(_id: getID ?? 0,model: commentArr)
    }
}
extension CommentViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell") as! commentCell
        let index = commentArr[indexPath.row]
        cell.lblid.text =  "\(index.postId)"
        cell.lblName.text = index.name
        cell.lblEmail.text = index.email
        cell.lblbody.text = index.body
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
extension CommentViewController : UITableViewDelegate {
    
}
