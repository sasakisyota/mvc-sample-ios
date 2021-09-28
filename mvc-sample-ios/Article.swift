//
//  Article.swift
//  mvc-sample-ios
//
//  Created by 佐々木翔太 on 2021/09/26.
//

struct Article: Codable {
    let title: String
    var user: User
    
    struct User: Codable {
        var name: String
    }
}
