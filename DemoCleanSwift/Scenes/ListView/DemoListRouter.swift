//
//  DemoListRouter.swift
//  DemoCleanSwift
//
//  Created by passakorn.siangsanan on 1/4/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

internal protocol DemoListRoutingLogic {
    func routeToScene()
}

internal protocol DemoListDataPassing {
    var dataStore: DemoListDataStore? { get }
}

public class DemoListRouter: DemoListDataPassing {
    weak var viewController: DemoListViewController?
    public var dataStore: DemoListDataStore?
    
    public func createModule() -> DemoListViewController {
        let viewController = DemoListViewController(nibName: "DemoListViewController", bundle: Bundle(for: type(of: self)))
        let interactor = DemoListInteractor()
        let presenter = DemoListPresenter()
        viewController.interactor = interactor
        viewController.router = self
        interactor.presenter = presenter
        presenter.viewController = viewController
        self.viewController = viewController
        self.dataStore = interactor
        return viewController
    }
    
}

extension DemoListRouter: DemoListRoutingLogic {
    func routeToScene() {
        /*
        let view = AnotherRouter().createModule()
        var destinationDS = view.router?.dataStore
        destinationDS?.value = dataStore?.value
         viewController?.navigationController?.pushViewControler(view, animted: true)
         */
    }
}
