//
//  ViewController.swift
//  mvc-sample-ios
//
//  Created by 佐々木翔太 on 2021/09/25.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var articlelisttableview: UITableView!
    let decoder: JSONDecoder = JSONDecoder()
    var list = [Article]()
    
    //    let GetQiitaArticles = getQiitaArticles()
    let allArticle = AllArticle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        allArticle.getQiitaArticles(completion: { [weak self] result in
            guard let self = self else { return }
            self.list = result
            self.articlelisttableview.reloadData()
        })
    }
    
    
    private func setup(){
        articlelisttableview.delegate = self
        articlelisttableview.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row].title
        return cell
    }
}

