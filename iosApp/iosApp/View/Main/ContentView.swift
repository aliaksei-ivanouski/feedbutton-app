import SwiftUI
import shared

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0
    @State var queryParams = [String: String]()
    
    var body: some View {
        Group {
            if (queryParams["action"] ?? "") == "RESET_PASSWORD" {
                NewPasswordView(token: .constant(queryParams["token"] ?? ""))
            } else if viewModel.userSession != nil {
                if let user = viewModel.userSession {
                    MainTabView(user: user, selectedIndex: $selectedIndex)
                }
            } else if viewModel.toLogin {
                LoginView()
            } else {
                FeedsButtonView()
            }
        }
        .onReceive(viewModel.$toLogin, perform: { _ in
            self.queryParams = [String: String]()
        })
        .onOpenURL { url in
            let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
            if let queryItems = urlComponents?.queryItems {
                for queryItem in queryItems {
                    if let val = queryItem.value {
                        self.queryParams[queryItem.name] = val
                    }
                }
            }
        }
	}
}
