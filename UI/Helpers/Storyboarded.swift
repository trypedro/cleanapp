import Foundation
import UIKit

public protocol Storyboarded {
    func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    public func instantiate() -> Self {
        let sbName = String(describing: self).components(separatedBy: "ViewController")[0]
        let bundle = Bundle(for: Self.self)
        let sb = UIStoryboard(name: sbName, bundle: bundle)
        
        return sb.instantiateViewController(identifier: String(describing: self)) as Self
    }
}
