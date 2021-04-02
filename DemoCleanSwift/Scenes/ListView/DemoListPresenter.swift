//
//  DemoListPresenter.swift
//  DemoCleanSwift
//
//  Created by passakorn.siangsanan on 1/4/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

internal protocol DemoListPresentationLogic {
    var viewController: DemoListDisplayLogic? { get }
    func displayHospital(response: [DemoListModel.HospitalList.Response])
    //
}

internal class DemoListPresenter {
    weak var viewController: DemoListDisplayLogic?
    
}

extension DemoListPresenter: DemoListPresentationLogic {
    
    func displayHospital(response: [DemoListModel.HospitalList.Response]) {
        guard !response.isEmpty else {
//            viewController?.displayEmptyList()
            return
        }
        let viewModel = response.map({
            return DemoListModel.HospitalList.ViewModel.Hospital(
                id: $0.id,
                hospitalName: $0.hospitalName,
                HospitalLocation: $0.HospitalLocation)
        })
        viewController?.displayHospital(viewModel: viewModel)
    }
    
    
}
