struct User {
    var username: String
    var email: String
}

class UserProfileViewMVC: UIView {
    @IBOutlet private var usernameLabel: UILabel!
    @IBOutlet private var emailLabel: UILabel!

    func configure(with user: User) {
        usernameLabel.text = "Username: \(user.username)"
        emailLabel.text = "Email: \(user.email)"
    }
}

class UserProfileViewController: UIViewController {
    var user: User!
    @IBOutlet private var userProfileView: UserProfileView!

    override func viewDidLoad() {
        super.viewDidLoad()
        userProfileView.configure(with: user)
    }
}
