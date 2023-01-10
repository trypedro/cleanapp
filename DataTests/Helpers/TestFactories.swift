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
