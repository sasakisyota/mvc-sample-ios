//
//  ViewController.swift
//  mvc-sample-ios
//
//  Created by 佐々木翔太 on 2021/09/25.
//

import UIKit

//テーブルビューに表示するデータ
let sectionTitle = ["sample1", "sample2", "sample3"]
let section0 = [("牛乳を買う","Data1")]
let section1 = [("掃除をする","Data2")]
let section2 = [("アプリの開発をする","Data3")]
let tableData = [section0, section1, section2]




class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    //セクションごとの行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionData = tableData[section]
        return sectionData.count
    }
    //セルの作成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let sectionData = tableData[(indexPath as NSIndexPath).section]
        let cellData = sectionData[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = cellData.0
        cell.detailTextLabel?.text = cellData.1
        return cell
    }
    //セクションの個数
    func numberOfSections(in tableView: UITableView) -> Int{
        return sectionTitle.count
    }
    //セクションのタイトル
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return sectionTitle[section]
    }
    //行がタップされると実行
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let title = sectionTitle[indexPath.section]
        let sectionData = tableData[indexPath.section]
        let cellData = sectionData[indexPath.row]
        print("\(title)\(cellData.1)")
        print("\(cellData.0)")
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let myTableView = UITableView(frame: view.frame, style: .grouped)
        myTableView.delegate = self
        myTableView.dataSource = self
        view.addSubview(myTableView)
    }
}

