//
//  FeedsButtonView.swift
//  iosApp
//
//  Created by Aliaksei Ivanouski on 31/07/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import CodeScanner

struct FeedsButtonView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var isShowingScanner = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            
            VStack {
                Text(" feed button ")
                    .font(.custom("KaushanScript-Regular", size: 50))
                    .foregroundColor(.black)
                    .frame(width: 320, height: 100)
                    .padding(.bottom, 25)
                
                Button(action: {
                    self.isShowingScanner = true
                }, label: {
                    CustomButton(title: " Scan QR-code ", systemImage: "qrcode.viewfinder",
                                 width: 340, height: 340,
                                 font: .custom("KaushanScript-Regular", size: 40),
                                 color: .black)
                })
                .padding(.bottom, 44)
                .sheet(isPresented: $isShowingScanner) {
                    CodeScannerView(codeTypes: [.qr], simulatedData: "Test Data", completion: handleQRCode)
                }
                
                Spacer()
                
                HStack {
                    Text("Already have an accont?")
                        .font(.system(size: 14))
                    
                    Button(
                        action: {
                            viewModel.toLogin.toggle()
                        }, label: {
                            Text("Log In")
                                .font(.system(size: 14, weight: .semibold))
                                .underline()
                        })
                }
                .foregroundColor(.gray)
                .padding(.bottom, 16)
            }
            .padding(.top, 44)
        }
    }
}

extension FeedsButtonView {
    func handleQRCode(result: Result<ScanResult, ScanError>) {
        self.isShowingScanner = false
        
        switch result {
        case .success(let result):
            print("Scan result: \(result.string)")
            
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
}
