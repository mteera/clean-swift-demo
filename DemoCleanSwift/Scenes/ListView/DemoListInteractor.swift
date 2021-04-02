//
//  DemoListInteractor.swift
//  DemoCleanSwift
//
//  Created by passakorn.siangsanan on 1/4/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

internal protocol DemoListBusinessLogic {
    func getData(request: DemoListModel.HospitalList.Request)
}

public protocol DemoListDataStore {
    var data: [Hospital] {get set}
}

internal class DemoListInteractor: DemoListDataStore {
    var presenter: DemoListPresentationLogic?
    var list: [DemoListModel.HospitalList.ViewModel.Hospital] = []
    var data: [Hospital] = []
}

extension DemoListInteractor: DemoListBusinessLogic {
    func getData(request: DemoListModel.HospitalList.Request) {
        APIDriver(
            data: [:],
            headers: [:],
            url: "https://606587c9b8fbbd0017566837.mockapi.io/api/practice/HospitalList",
            method: .get, isJSONRequest: false).executeQuery { (result: Result<[Hospital], Error>) in
                switch result {
                case .success(let response):
                    self.data = response
                    let response = self.data.map({
                        DemoListModel.HospitalList.Response(
                            id: $0.id,
                            hospitalName: $0.hospitalName,
                            HospitalLocation: $0.hospitalLocation)
                    })
                    self.presenter?.displayHospital(response: response)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    
}
