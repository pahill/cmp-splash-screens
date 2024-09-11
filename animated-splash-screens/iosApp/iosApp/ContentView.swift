import UIKit
import SwiftUI
import ComposeApp

struct ComposeView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        MainViewControllerKt.MainViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct ContentView: View {
    @State var scaleAmount = 1.0
    @State var isHomeRootScreen = false
    
    var body: some View {
        ZStack {
            if isHomeRootScreen {
                ComposeView()
            } else {
                Image(.kotlin)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(scaleAmount)
                    .frame(width:60)
                    .onAppear() {
                        withAnimation(.easeIn(duration: 2)){
                            scaleAmount = 0.0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                            isHomeRootScreen = true
                        })
                    }
            }
        }.ignoresSafeArea(( isHomeRootScreen ? .keyboard : .all))
    }
}



