//
//  Fetcher.swift
//  Hermes
//
//  Created by Ernesto Torres on 7/26/17.
//
//

import Foundation

class Fetcher: Fetchable {

    typealias responseType = Any

    let connector: HttpConnector
    let apiEndPoint: String

    init(with session: URLSession, apiEndPoint: String) {
        self.connector = HttpConnector(with: session)
        self.apiEndPoint = apiEndPoint
    }

    func fetch(_ segment: String, success: @escaping ((responseType) -> Void), error: @escaping ((Error) -> Void)) {
        connector
            .onSuccess(success: success)
            .onError(error: error)
            .get(from: apiEndPoint + segment, headers: nil, body: nil)
    }
}
