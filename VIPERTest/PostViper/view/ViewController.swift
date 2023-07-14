//
//  ViewController.swift
//  ViperUsage
//
//  Created by Pınar Koçak on 18.04.2022.
//

import UIKit


class ViewController: UIViewController,PresenterToViewProtocol {
  
    var postArr = [PostModel]()
    @IBOutlet weak var tblPost: UITableView!
    func sendDataToView(result: [PostModel]?) {
        guard let arr = result, !arr.isEmpty else {return}
        print( " total Values in post : \(arr.count)")
        self.postArr = arr
        DispatchQueue.main.async {
            self.tblPost.reloadData()
        }
        
    }
    
    var presenterObj: ViewToPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        Router.createModule(ref: self)
        presenterObj?.getAPIData(model: postArr)
    }
}
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        let index = postArr[indexPath.row]
        cell.lblID.text =  "\(index.id)"
        cell.lblTitle.text = index.title
        cell.lblBody.text = index.body
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let CommentVC = storyboard?.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
        CommentVC.getID = postArr[indexPath.row].id
        navigationController?.pushViewController(CommentVC, animated: true)
    }
    
}
extension ViewController : UITableViewDelegate {
    
}
