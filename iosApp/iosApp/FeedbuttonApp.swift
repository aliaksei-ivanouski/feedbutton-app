import SwiftUI

@main
struct FeedbuttonApp: App {
	var body: some Scene {
		WindowGroup {
			ContentView()
                .environmentObject(AuthViewModel.shared)
		}
	}
}
