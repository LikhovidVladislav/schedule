//
//  Request.swift
//  schedule
//
//  Created by Влад Лиховид on 2/4/19.
//  Copyright © 2019 Влад Лиховид. All rights reserved.
//

import Foundation
import Moya

enum RequestService {
    case getInfoForRequest
    case getSchedule
}

extension RequestService: TargetType {
    var headers: [String : String]? {
        let headerses = ["Content-Type": "application/x-www-form-urlencoded",
                         "Accept": "*/*",
                         "Connection": "keep-alive"]
        return headerses
    }
    
    var baseURL: URL { return URL(string: "http://schedule.sumdu.edu.ua")! }
    var path: String {
        switch self {
        case .getInfoForRequest:
            return ""
        case .getSchedule:
            return "/index/htmlschedule"
            
        }
    }
    var method: Moya.Method {
        switch self {
        case .getInfoForRequest:
            return .get
        case .getSchedule:
            return .post
        }
    }
    var task: Task {
        switch self {
        case .getInfoForRequest:
            return .requestPlain
        case .getSchedule:
            return .requestPlain
        }
    }
    var sampleData: Data {
        return " ".data(using: String.Encoding.utf8)!
    }
}


