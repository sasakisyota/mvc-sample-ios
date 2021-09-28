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
        //let sample = ["牛乳を買う", "掃除をする", "アプリ開発の勉強をする"]
    let decoder: JSONDecoder = JSONDecoder()
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getQiitaArticles()
    }

    private func setup(){
        articlelisttableview.delegate = self
        articlelisttableview.dataSource = self
    }

    private func getQiitaArticles(){
        AF.request("https://qiita.com/api/v2/items").responseJSON { response in
            switch response.result {
            case .success:
                do{
                    self.articles = try self.decoder.decode([Article].self, from: response.data!)
                    self.articlelisttableview.reloadData()
                } catch {
                    print("デコードに失敗しました")
                }
            case .failure(let error):
                print("error", error)
            }
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath)
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }
}

