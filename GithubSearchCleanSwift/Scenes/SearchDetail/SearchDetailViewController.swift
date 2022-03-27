//
//  SearchDetailViewController.swift
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
import WebKit

protocol SearchDetailDisplayLogic: AnyObject {
}

class SearchDetailViewController: UIViewController {
    var interactor: SearchDetailBusinessLogic?
    var router: (NSObjectProtocol & SearchDetailRoutingLogic & SearchDetailDataPassing)?
    
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = SearchDetailInteractor()
        let presenter = SearchDetailPresenter()
        let router = SearchDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = router?.dataStore?.repository?.full_name
        
        if let urlString = router?.dataStore?.repository?.html_url, let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
    }
}

extension SearchDetailViewController: SearchDetailDisplayLogic {
    
}