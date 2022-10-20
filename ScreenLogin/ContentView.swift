//
//  ContentView.swift
//  ScreenLogin
//
//  Created by zoya me on 10/20/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    
    @State var rectangle: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    
    @State var message = ""
    @State var alert = false
    @StateObject var manager = FirebaseManager()
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        ZStack {
            ColoringCircle()
            ColoringCircle()
            
            if status {
                LoggedInScreen()
                
            }else {
                
                if rectangle {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 360)
                        .shadow(radius: 20)
                        .padding([.leading, .trailing], 25)
                        .overlay(
                            VStack {
                                HStack {
                                    Text("Sign Up")
                                        .font(.largeTitle.bold())
                                        .underline()
                                        .padding(.leading, 60)
                                        .padding(.top)
                                    Image("image")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .padding(.top, 10)
                                    Spacer()
                                }
                                TextField("Email", text: $email)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(Color.blue.opacity(0.3))
                                    .textContentType(.emailAddress)
                                    .cornerRadius(30)
                                    .padding([.leading, .trailing], 40)
                                
                                TextField("Password", text: $password)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(Color.pink.opacity(0.3))
                                    .cornerRadius(30)
                                    .padding([.leading, .trailing], 40)
                                
                                
                                Button {
                                    manager.signUpWithEmail(email: self.email, password: self.password) { (verified, status) in
                                        
                                        if !verified{
                                            
                                            self.message = status
                                            self.alert.toggle()
                                            
                                        }
                                        else{
                                            
                                            UserDefaults.standard.set(true, forKey: "status")
                                            
                                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                email = ""
                                                password = ""
                                            }
                                        }
                                    }
                                    
                                } label: {
                                    Text("Create Account")
                                        .font(.title.bold())
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .background(Color.yellow)
                                        .foregroundStyle(Color(.white))
                                        .cornerRadius(30)
                                        .padding(.top)
                                        .padding([.leading, .trailing], 40)
                                }
                                .alert(isPresented: $alert) {
                                    
                                    Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
                                }
                                
                                VStack {
                                    Spacer()
                                    HStack {
                                        Text("Do have an account?")
                                            .font(.system(size: 16))
                                        Button {
                                            withAnimation {
                                                rectangle.toggle()
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                email = ""
                                                password = ""
                                            }
                                            
                                        } label: {
                                            Text("Sign In")
                                                .bold()
                                                .font(.system(size: 19))
                                                .underline()
                                                .foregroundColor(Color.blue)
                                            
                                            
                                        }
                                        
                                    }
                                    
                                }
                                .padding(.bottom, 10)
                                
                                Spacer()
                            }
                            
                            
                        )
                } else {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 360)
                        .shadow(radius: 20)
                        .padding([.leading, .trailing], 25)
                        .overlay(
                            VStack {
                                HStack {
                                    Text("Sign In")
                                        .font(.largeTitle.bold())
                                        .underline()
                                        .padding(.leading, 60)
                                        .padding(.top)
                                    Image("image")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .padding(.top, 10)
                                    Spacer()
                                }
                                TextField("Email", text: $email)
                                    .padding()
                                    .textContentType(.emailAddress)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .textContentType(.emailAddress)
                                    .background(Color.blue.opacity(0.3))
                                    .cornerRadius(30)
                                    .padding([.leading, .trailing], 40)
                                
                                TextField("Password", text: $password)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(Color.pink.opacity(0.3))
                                    .cornerRadius(30)
                                    .padding([.leading, .trailing], 40)
                                
                                
                                Button {
                                    manager.signInWithEmail(email: self.email, password: self.password) { (verified, status) in
                                        
                                        if !verified {
                                            
                                            self.message = status
                                            self.alert.toggle()
                                        }
                                        else{
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                email = ""
                                                password = ""
                                            }
                                            
                                            UserDefaults.standard.set(true, forKey: "status")
                                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                                        }
                                    }
                                } label: {
                                    Text("Sign In")
                                        .font(.title.bold())
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .background(Color.black)
                                        .foregroundStyle(Color(.white))
                                        .cornerRadius(30)
                                        .padding(.top)
                                        .padding([.leading, .trailing], 40)
                                }
                                .alert(isPresented: $alert) {
                                    
                                    Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
                                }
                                
                                VStack {
                                    Spacer()
                                    HStack {
                                        Text("Don't have an account?")
                                            .font(.system(size: 16))
                                        Button {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                email = ""
                                                password = ""
                                            }
                                            
                                            withAnimation {
                                                rectangle.toggle()
                                            }
                                            
                                        } label: {
                                            Text("Sign Up")
                                                .bold()
                                                .font(.system(size: 19))
                                                .underline()
                                                .foregroundColor(Color(UIColor.magenta))
                                            
                                        }
                                        
                                    }
                                    
                                }
                                .padding(.bottom, 10)
                                
                                Spacer()
                            }
                            
                            
                        )
                }
            }
            
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                
                let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                self.status = status
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
