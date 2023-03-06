import Foundation

final class Environment {
    enum EnvironmentVariables: String {
        case apiBaseUrl = "API_BASE_URL"
    }
    static func variable(_ key: EnvironmentVariables) -> String {
        return Bundle.main.infoDictionary![key.rawValue] as! String
    }
}
