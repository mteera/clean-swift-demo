//
//  DemoListModel.swift
//  DemoCleanSwift
//
//  Created by passakorn.siangsanan on 1/4/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

internal struct DemoListModel {
    enum HospitalList {
        internal struct Request {
            
        }
        
        public struct Response: Decodable {
            let id: String?
            let hospitalName: String?
            let HospitalLocation: String?
        }
        
        internal struct Error: Decodable {
            
        }
        
        internal struct ViewModel {
            internal struct Hospital {
                let id: String?
                let hospitalName: String?
                let HospitalLocation: String?
            }
        }
    }
}
