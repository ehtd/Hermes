//
//  Fetchable.swift
//  Hermes
//
//  Created by Ernesto Torres on 7/26/17.
//
//

import Foundation

protocol Fetchable {
    associatedtype responseType
    func fetch(_ segment: String, success: @escaping ((responseType) -> Void), error: @escaping ((Error) -> Void))
}
