//
//  SearchModels.swift
//  GithubSearchCleanSwift
//
//  Created by 한지민 on 2022/03/20.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Search {
    // MARK: Use cases
    
    enum FetchRepositories {
        struct Request {
            let text: String?
        }
        struct Response: Codable {
            var total_count: Int = 0
            var incomplete_results: Bool = false
            var items: [Repository] = []
        }
        struct ViewModel {
            let fetchedRepositories: [Repository]
        }
    }
}
