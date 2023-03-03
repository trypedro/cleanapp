import XCTest
import UIKit
import Presentation
@testable import UI

class SignUpViewControllerTests: XCTestCase {
    func test_loading_is_hidden_on_start(){
        XCTAssertEqual(makeSut() .loadingIndicator?.isAnimating, false)
    }
    
    func test_sut_implements_loadingView() {
        XCTAssertNotNil(makeSut() as LoadingView)
    }
    
    func test_sut_implements_AlertView() {
        XCTAssertNotNil(makeSut() as AlertView)
    }
    
    func test_saveButton_calls_signUp_on_tap() {
        var signUpViewModel: SignUpViewModel?
        let sut = makeSut(signUpSpy: { signUpViewModel = $0 })
        sut.saveButton?.simulateTap()
        XCTAssertEqual(signUpViewModel, SignUpViewModel(name: sut.nameTextField?.text, email: sut.emailTextField?.text,
                                                        password: sut.passwordTextField?.text, passwordConfirmation: sut.passwordConfirmationTextField?.text))
    }
    
    
}

extension SignUpViewControllerTests {
    func makeSut(signUpSpy: ((SignUpViewModel) -> Void )? = nil) -> SignUpViewController {
        let sut = SignUpViewController().instantiate()
        sut.signUp = signUpSpy
        sut.loadViewIfNeeded()
        return sut
    }
}


