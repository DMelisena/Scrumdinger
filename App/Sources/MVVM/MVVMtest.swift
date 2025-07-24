import Combine
import Foundation

public struct UserMVVM {
    public var username: String
    public var email: String
}

public class UserViewModel: ObservableObject {
    @Published public var user: UserMVVM

    public init(user: UserMVVM) {
        self.user = user
    }

    public var formattedDetails: String {
        return "Username: \(user.username)\nEmail: \(user.email)"
    }
}

