import Foundation

func makeUrl() -> URL {
    return URL(string: "http://any-url.com")!
}

func makeInvalidData() -> Data {
    return Data("invalid_data".utf8)
}
