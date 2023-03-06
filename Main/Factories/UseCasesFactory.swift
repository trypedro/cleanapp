import Foundation
import Data
import Infra
import Domain

final class UseCaseFactory {
    static func makeRemoteAddAccount() -> AddAccount {
        let url = URL(string: "https://fordevs.herokuapp.com/api/signup")!
        let alamofireAdapter = AlamofireAdaptar()
        return RemoteAddAccount(url: url, httpClient: alamofireAdapter)
    }
}
