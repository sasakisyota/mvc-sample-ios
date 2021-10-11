//
//  AllArticle.swift
//  mvc-sample-ios
//
//  Created by 佐々木翔太 on 2021/10/06.
//

import Foundation
import Alamofire

 class AllArticle{
    var list = [Article]()
    let decoder: JSONDecoder = JSONDecoder()
    
     func getQiitaArticles(completion: @escaping ([Article]) -> Void){
         AF.request("https://qiita.com/api/v2/items").responseJSON { response in
             switch response.result {
             case .success:
                 do{
                     self.list = try self.decoder.decode([Article].self, from: response.data!)
                     completion(self.list)
                 } catch {
                     print("デコードに失敗しました")
                 }
             case .failure(let error):
                 print("error", error)
             }
         }
     }
}
