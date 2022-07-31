import SwiftUI
import shared

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0

	var body: some View {
        Group {
            if viewModel.userSession != nil {
                if let user = viewModel.userSession {
                    MainTabView(user: user, selectedIndex: $selectedIndex)
                }
            } else if viewModel.toLogin {
                LoginView()
            } else {
                FeedsButtonView()
            }
        }
	}
}
