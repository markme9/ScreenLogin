//
//  LoggedInScreen.swift
//  ScreenLogin
//
//  Created by zoya me on 10/20/22.
//

import SwiftUI

struct LoggedInScreen: View {
    var body: some View {
        VStack{
            
            Text("if you find this tutorial helpful then Please consider to donate me, it will help me a lot to paying my school fee. Thanks")
                .font(.system(size: 20, weight: .heavy, design: .rounded))
                .padding()
                .foregroundColor(Color.white)
            
            Button {
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
            } label: {
                Text("Logout")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(30)
                    .shadow(radius: 5)
                    .padding([.leading, .trailing])
                    
            }
        }
    }
}

struct LoggedInScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInScreen()
    }
}
