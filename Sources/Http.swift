//
//  Http.swift
//  Hermes
//
//  Created by Ernesto Torres on 7/26/17.
//
//

import Foundation

protocol Http {
    func get(from urlPath: String, headers: [String: String]?, body: String?)
}
