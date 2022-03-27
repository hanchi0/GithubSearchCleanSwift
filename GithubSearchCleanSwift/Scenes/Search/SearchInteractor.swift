//
//  SearchInteractor.swift
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

protocol SearchBusinessLogic {
    func fetchRepositories(request: Search.FetchRepositories.Request)
}

protocol SearchDataStore {
    var repositories: [Repository] { get set }
}

class SearchInteractor: SearchDataStore {
    var presenter: SearchPresentationLogic?
    var worker: SearchWorker?
    var repositories: [Repository] = [Repository]()
}

extension SearchInteractor: SearchBusinessLogic {
    func fetchRepositories(request: Search.FetchRepositories.Request) {
        worker = SearchWorker()
        worker?.fetchRepositories(text: request.text, completion: { result in
            switch result {
            case .success(let response):
                self.repositories = response.items
                self.presenter?.presentFetchedRepositories(response: response)
                
            case .failure(let error):
                print("error : \(error.localizedDescription)")
                let response = Search.FetchRepositories.Response()
                self.repositories = response.items
                self.presenter?.presentFetchedRepositories(response: response)
            }
        })
    }
}
