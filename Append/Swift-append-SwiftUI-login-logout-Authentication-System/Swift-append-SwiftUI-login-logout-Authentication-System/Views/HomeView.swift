//
//  HomeView.swift
//  Swift-append-SwiftUI-login-logout-Authentication-System
//
//  Created by Doniel Tripura on 10/5/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session: UserSession
    
    var body: some View {
        VStack(spacing: 20) {
            Text(LocalizedStringKey("WELCOME_MESSAGE"))
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Button(action: {
                session.logout()
            }) {
                Text(LocalizedStringKey("LOGOUT_TITLE"))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}



#Preview {
    HomeView()
}
