//
//  RemoteAddAccountTests.swift
//  RemoteAddAccountTests
//
//  Created by Pedro Ivo de Faria Ramos
//

import XCTest
import Domain
import Data

class RemoteAddAccountTests: XCTestCase {
    func test_add_should_call_httpClient_with_correct_url(){
        let url = URL(string: "http://any-url.com")!
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.add(addAccountModel: makeAdAccountModel())
        XCTAssertEqual(httpClientSpy.urls, [url])
    }
    
    func test_add_should_call_httpClient_with_correct_data(){
        let (sut, httpClientSpy) = makeSut()
        let addAccountModel = makeAdAccountModel()
        sut.add(addAccountModel: addAccountModel)
        XCTAssertEqual(httpClientSpy.data, addAccountModel.toData())
    }
}

extension RemoteAddAccountTests {
    func makeSut(url: URL = URL(string: "http://any-url.com")!) -> (sut: RemoteAddAccount, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        return (sut, httpClientSpy)
    }
    
    func makeAdAccountModel() -> AddAccountModel {
        return AddAccountModel(name: "any_name", email: "any_email@mail.com", password: "any_password", passwordConfirmation: "any_password")
    }

    class HttpClientSpy: HttpPostClient {
        var urls = [URL]()
        var data: Data?

        func post(to url: URL, with data: Data?) {
            self.urls.append(url)
            self.data = data
        }
    }
}
