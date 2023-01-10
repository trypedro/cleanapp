import XCTest
import Alamofire

class AlamofireAdaptar {
    private let session: Session

    init(session: Session = .default) {
        self.session = session
    }
    
    func post(to url: URL){
        
    }
}

class AlamofireAdapterTests: XCTestCase {
    func test_(){
        let url = makeUrl()
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolStub.self]
        let session = Session(configuration: configuration)
        let sut = AlamofireAdaptar(session: session)
        sut.post(to: url)
    }

}

class URLProtocolStub: URLProtocol {
    override open class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override open class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override open func startLoading() {
        
    }
    
    override open func stopLoading() {}
}
