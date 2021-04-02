//
//  DemoListViewController.swift
//  DemoCleanSwift
//
//  Created by passakorn.siangsanan on 1/4/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

internal protocol DemoListDisplayLogic: class {
    func displayHospital(viewModel: [DemoListModel.HospitalList.ViewModel.Hospital])
    func displayEmptyList()
}

public class DemoListViewController: UIViewController {
    
    // MARK: - IBOutlet Properties
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel = [DemoListModel.HospitalList.ViewModel.Hospital]()
    
    internal var interactor: (DemoListBusinessLogic & DemoListDataStore)?
    internal var router: (DemoListRoutingLogic & DemoListDataPassing)?
    
    // MARK: - View lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setup()
        print("didload", interactor)
        interactor?.getData(request: DemoListModel.HospitalList.Request())
        
    }
    
    // MARK: - Setup View
    private func setup() {
        let viewController = self
        let interactor = DemoListInteractor()
        let presenter = DemoListPresenter()
        let router = DemoListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "HospitalViewCell", bundle: nil), forCellReuseIdentifier: "Hospital")
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .singleLine
        tableView.estimatedRowHeight = 120.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    // MARK: - Action
    
}

// MARK: - Start of Extension Any
extension DemoListViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Hospital", for: indexPath) as! HospitalViewCell
        let hospital = viewModel[indexPath.row]
        cell.prepareCell(hospital)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

extension DemoListViewController: UITableViewDelegate {
    
}

// MARK: - End of Extension Any

// MARK: - View Protocol
extension DemoListViewController: DemoListDisplayLogic {
    
    func displayHospital(viewModel: [DemoListModel.HospitalList.ViewModel.Hospital]) {
        
        self.viewModel = viewModel
        tableView.reloadData()
    }
    
    func displayEmptyList() {
        
    }
    
}
