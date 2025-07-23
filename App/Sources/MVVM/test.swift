struct User {
    var username: String
    var email: String
}

class UserViewModel {
    var user: User

    init(user: User) {
        self.user = user
    }

    var formattedDetails: String {
        return "Username: \\(user.username)\\nEmail: \\(user.email)"
    }
}

class UserProfileViewMVVM: UIView {
    var viewModel: UserViewModel? {
        didSet {
            updateUI()
        }
    }

    private func updateUI() {
        // Update UI elements using data from the ViewModel
    }
}
