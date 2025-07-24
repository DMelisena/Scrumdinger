import Foundation

public struct UserMVC {
    public var username: String
    public var email: String
}

public class UserController {
    private var model: UserMVC

    public init(user: UserMVC) {
        model = user
    }

    public func getUser() -> UserMVC {
        return model
    }
}

