//
//  RequestBuilder.swift
//  Hermes
//
//  Created by Ernesto Torres on 7/26/17.
//
//

import Foundation

class RequestBuilder {
    enum MethodType: String {
        case GET
    }

    private var methodType: MethodType = .GET
    private var urlString: String?
    private var httpBody: Data?
    private var headers: [String : String]?

    func set(type: MethodType) -> Self {
        methodType = type
        return self
    }

    func set(urlString: String) -> Self {
        self.urlString = urlString
        return self
    }

    func set(httpBodyFromString body: String?) -> Self {
        if let body = body {
            self.httpBody = body.data(using: .utf8)
        }
        return self
    }

    func set(httpBody: Data) -> Self {
        self.httpBody = httpBody
        return self
    }

    func set(headers: [String: String]?) -> Self {
        self.headers = headers
        return self
    }

    func build() -> URLRequest {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }

        var request = URLRequest(url: url)
        request.httpMethod = methodType.rawValue

        if let httpBody = httpBody {
            request.httpBody = httpBody
        }

        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
    }
}
