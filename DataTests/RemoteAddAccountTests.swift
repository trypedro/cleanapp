//
//  RemoteAddAccountTests.swift
//  RemoteAddAccountTests
//
//  Created by Pedro Ivo de Faria Ramos
//

import XCTest

class RemoteAddAccount {
    private let url: URL
    private let httpClient: HttpClient
    
    init (url: URL, httpClient: HttpClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func add(){
        httpClient.post(url: url)
    }
}

protocol HttpClient {
    func post(url: URL)
}

class RemoteAddAccountTests.: XCTestCase {
    func test_(){
        let url = URL(string: "http://any-uyrl.com")
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddccount(url: url, httpClientSpy: httpClientSpy)
        sut.add()
        XCTAssertEqual(httpClientSpy.url, url)
    }

    class HttpClientSpy: HttpClient {
        var url: URL?
        func post(url: URL) {
            self.url = url
        }
    }
}

