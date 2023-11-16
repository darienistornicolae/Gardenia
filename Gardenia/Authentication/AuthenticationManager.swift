//
//  AuthenticationManager.swift
//  Gardening
//
//  Created by Darie-Nistor Nicolae on 19.07.2023.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
final class AuthenticationManager: ObservableObject {
    @Published var userSession: User?
    @Published var currentUser: UserModel?
    @Published var currentGarden: Garden?
    
    let dataBase = Firestore.firestore()
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            do {
                await fetchUser()   
                
            }
        }
    }
    
    //MARK: User
    
    func signIn(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            
            await fetchUser()
        } catch {
            print("Failed to Log in: \(error.localizedDescription)")
        }
    }
    
    func deleteUser() async throws {
            guard let currentUser = currentUser, let userSession = userSession else {
                print("ERROR: User is not signed in")
                return
            }

            do {
                // Delete user account from Firebase Authentication
                try await userSession.delete()

                // Delete user data from Firestore
                let userDocumentRef = dataBase.collection("users").document(currentUser.id)
                try await userDocumentRef.delete()

                // Clear local user data
                self.userSession = nil
                self.currentUser = nil
                self.currentGarden = nil
            } catch {
                print("ERROR: Deleting account failed. \(error.localizedDescription)")
                throw error
            }
        }
    
    func createUser(email: String, password: String, fullName: String) async throws {
        do {
           
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = UserModel(id: result.user.uid, fullName: fullName, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await dataBase.collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch  {
           print("ERROR: User creation failed. \(error.localizedDescription)")
        }
    }
    
    func resetPassword(email: String) async throws {
       try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("ERROR: User is not signed in")
            return
        }
        
        do {
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            guard let data = snapshot.data() else {
                print("ERROR: User data not found")
                return
            }
            
            let user = try Firestore.Decoder().decode(UserModel.self, from: data)
            self.currentUser = user
        } catch {
            print("ERROR: Fetching user data failed - \(error)")
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("ERROR: The user couldn't sign out. \(error.localizedDescription)")
        }
    }
    
    

}
