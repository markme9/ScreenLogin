//
//  FirebaseManager.swift
//  ScreenLogin
//
//  Created by zoya me on 10/20/22.
//

import Foundation
import Firebase
import FirebaseAuth


class FirebaseManager: ObservableObject {
    
    func signInWithEmail(email: String, password : String, completion: @escaping (Bool, String)-> Void){
        
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            
            if err != nil{
                
                completion(false,(err?.localizedDescription)!)
                return
            }
            
            completion(true,(res?.user.email)!)
        }
    }
    
    func signUpWithEmail(email: String, password : String, completion: @escaping (Bool, String)-> Void){
        
        Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
            
            if err != nil{
                
                completion(false,(err?.localizedDescription)!)
                return
            }
            
            completion(true,(res?.user.email)!)
        }
    }
}


