import Foundation

func makeUrl() -> URL {
    return URL(string: "http://any-url.com")!
}

func makeValidData() -> Data {
    return Data("{\"name\":\"Pedro\"}".utf8)
}

func makeInvalidData() -> Data {
    return Data("invalid_data".utf8)
}

func makeError() -> Error {
    return NSError(domain: "any_error", code: 0)
}

func makeHttpResponse(statusCode: Int = 200) -> HTTPURLResponse {
    return HTTPURLResponse(url: makeUrl(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
}

func makeEmptyData() -> Data {
    return Data()
}
