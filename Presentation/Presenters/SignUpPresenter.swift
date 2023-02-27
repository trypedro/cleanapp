import Foundation
import Domain

public final class SignUpPresenter {
    private let alertView: AlertView
    private let emailValidator: EmailValidator
    private let addAccount: AddAccount
    
    public init(alertView: AlertView, emailValidator: EmailValidator, addAccount: AddAccount) {
        self.alertView = alertView
        self.emailValidator = emailValidator
        self.addAccount = addAccount
    }
    
    public func signUp(viewModel: SignUpViewModel) {
        if let message = validate(viewModel: viewModel) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        } else {
            let addAccountModel = AddAccountModel(name: viewModel.name!, email: viewModel.email!, password: viewModel.password!, passwordConfirmation: viewModel.passwordConfirmation!)
            addAccount.add(addAccountModel: addAccountModel) { result in
                switch result {
                case .failure: self.alertView.showMessage(viewModel: AlertViewModel(title: "Erro", message: "Algo inesperado aconteceu, tente novamente em alguns instantes"))
                case .success: break
                }
            }
        }
    }
    
    private func validate(viewModel: SignUpViewModel) -> String? {
        if viewModel.name == nil || viewModel.name!.isEmpty {
            return "Nome é um campo obrigatorio"
        } else if viewModel.email == nil || viewModel.email!.isEmpty {
            return "Email é um campo obrigatorio"
        } else if viewModel.password == nil || viewModel.password!.isEmpty {
            return "Password é um campo obrigatorio"
        } else if viewModel.passwordConfirmation == nil || viewModel.passwordConfirmation!.isEmpty {
            return "PasswordConfirmation é um campo obrigatorio"
        } else if viewModel.password != viewModel.passwordConfirmation {
            return "Falha ao confirmar senha"
        } else if !emailValidator.isValid(email: viewModel.email!) {
            return "Email inválido"
        }
        return nil
    }

}

public struct SignUpViewModel {
    public var name: String?
    public var email: String?
    public var password: String?
    public var passwordConfirmation: String?
    
    public init(name: String? = nil, email: String? = nil, password: String? = nil, passwordConfirmation: String?  = nil) {
        self.name = name
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
}
