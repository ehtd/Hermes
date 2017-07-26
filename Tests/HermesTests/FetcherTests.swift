//
//  FetcherTests.swift
//  Hermes
//
//  Created by Ernesto Torres on 7/26/17.
//
//

import XCTest
@testable import Hermes

class FetcherTests: XCTestCase {

    fileprivate let apiEndPoint = "https://hacker-news.firebaseio.com/v0/"
    fileprivate let session = URLSession(configuration: URLSessionConfiguration.default)
    fileprivate var fetcher: Fetcher?

    fileprivate let topStories = "topstories.json"
    fileprivate let storyId = "10483024"

    override func setUp() {
        super.setUp()

        fetcher = Fetcher(with: session, apiEndPoint: apiEndPoint)
    }

    func testFetchingIDList() {
        let exp = expectation(description: "Fetch Top Stories List")
        fetcher?.fetch(topStories, success: { (response) in
            print(response)
            exp.fulfill()
        }, error: { (_) in
            XCTFail()
        })

        waitForExpectations(timeout: 3.0) { (error) in
            XCTAssertNil(error)
        }
    }

    func testFetchItem() {
        let exp = expectation(description: "Fetch item")

        fetcher?.fetch( "item/\(storyId).json", success: { (response) in
            print(response)
            exp.fulfill()
        }, error: { (_) in
            XCTFail()
        })

        waitForExpectations(timeout: 3.0) { (error) in
            XCTAssertNil(error)
        }
    }
}
