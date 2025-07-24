@_exported import HotSwiftUI
import SwiftUI

struct ContentView: View {
    // MVC
    private var controller: UserController

    // MVVM
    @StateObject private var viewModel: UserViewModel

    init() {
        let userMVVM = UserMVVM(username: "Jane Doe", email: "jane.doe@example.com")
        _viewModel = StateObject(wrappedValue: UserViewModel(user: userMVVM))

        let userMVC = UserMVC(username: "John Doe", email: "john.doe@example.com")
        controller = UserController(user: userMVC)
    }

    @ObserveInjection var redraw
    var body: some View {
        TabView {
            defaultView
                .tabItem {
                    Label("default", systemImage: "person.crop.circle")
                }
            mvcView
                .tabItem {
                    Label("MVC", systemImage: "person.fill")
                }

            mvvmView
                .tabItem {
                    Label("MVVM", systemImage: "person.crop.circle")
                }
            MeetingView()
                .tabItem {
                    Label("MeetingView", systemImage: "person.crop.circle")
                }
        }
        .onAppear {
            #if DEBUG
                Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")?.load()
            #endif
        }
        .enableInjection()
    }

    private var defaultView: some View {
        VStack {
            Text("Default")
                .font(.title)
                .padding()
            Text("Username: \(viewModel.user.username)")
            Text("Email: \(viewModel.user.email)")
        }
    }

    private var mvcView: some View {
        let user = controller.getUser()
        return VStack {
            Text("MVC Pattern")
                .font(.title)
                .padding()
            Text("Username: \(user.username)")
            Text("Email: \(user.email)")
        }
    }

    private var mvvmView: some View {
        VStack {
            Text("MVVM Pattern")
                .font(.title)
                .padding()
            Text("Username: \(viewModel.user.username)")
            Text("Email: \(viewModel.user.email)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
