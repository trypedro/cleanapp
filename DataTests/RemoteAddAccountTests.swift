//
//  RemoteAddAccountTests.swift
//  RemoteAddAccountTests
//
//  Created by Pedro Ivo de Faria Ramos
//

import XCTest

class RemoteAddAccount {
    private let url: URL
    private let httpClient: HttpPostClient
    
    init (url: URL, httpClient: HttpPostClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func add(){
        httpClient.post(url: url)
    }
}

protocol HttpPostClient {
    func post(url: URL)
}

class RemoteAddAccountTests.: XCTestCase {
    func test_add_should_call_httpClient_with_correct_url(){
        let url = URL(string: "http://any-uyrl.com")
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddccount(url: url, httpClient: httpClientSpy)
        sut.add()
        XCTAssertEqual(httpClientSpy.url, url)
    }
}

extension RemoteAddAccountTests {
    class HttpClientSpy: HttpPostClient {
        var url: URL?
        func post(url: URL) {
            self.url = url
        }
    }
}
