//
//  SearchDetailRouter.swift
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

@objc protocol SearchDetailRoutingLogic {
}

protocol SearchDetailDataPassing {
    var dataStore: SearchDetailDataStore? { get }
}

class SearchDetailRouter: NSObject, SearchDetailDataPassing {
    weak var viewController: SearchDetailViewController?
    var dataStore: SearchDetailDataStore?

    // MARK: Navigation
    
    // MARK: Passing data

}

extension SearchDetailRouter: SearchDetailRoutingLogic {
    // MARK: Routing
}