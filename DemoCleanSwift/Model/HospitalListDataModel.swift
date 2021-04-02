//
//  HospitalListDataModel.swift
//  DemoCleanSwift
//
//  Created by passakorn.siangsanan on 2/4/2564 BE.
//

import Foundation

// MARK: - HospitalArray
public struct Hospital: Codable {
    let id: String?
    let hospitalName: String?
    let hospitalLocation: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case hospitalName = "hospitalName"
        case hospitalLocation = "HospitalLocation"
    }
}
