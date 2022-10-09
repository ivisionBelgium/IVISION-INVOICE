//
//  ViewModel.swift
//  INVOICES
//
//  Created by Koen Sas on 27/09/2022.
//

import Foundation
import Firebase

class ViewModel: ObservableObject {
    
    @Published var lst = [ClientFields]()
    
    
    func updateData(ClientFieldToUpdate: ClientFields) {
        
        let db = Firestore.firestore()
        
        db.collection("Clients").document(ClientFieldToUpdate.id).setData(["clientName": "name updated: \(ClientFieldToUpdate.varClientName)",
            
                                                                           "clientContact": "contact updated: \(ClientFieldToUpdate.varClientContact)",
                                                                           "clientStreet": "street updated: \(ClientFieldToUpdate.varClientStreet)",
                                                                           "clientStreetNr": "street nr updated: \(ClientFieldToUpdate.varClientStreetNr)",
                                                                           "clientPostalCode": "Postal Code updated: \(ClientFieldToUpdate.varClientPostalCode)",
                                                                           "clientCity": "City Updated: \(ClientFieldToUpdate.varClientCity)",
                                                                           "clientCountry": "contact updated: \(ClientFieldToUpdate.varClientCountry)",
                                                                           "clientEmail": "contact updated: \(ClientFieldToUpdate.varClientEmail)",
                                                                           "clientRemarks": "contact updated: \(ClientFieldToUpdate.varClientRemarks)",
                                                                           "clientVAT": "contact updated: \(ClientFieldToUpdate.varClientVAT)"
                                                                
                                                                          ], merge: true) { error in
            
            if error == nil {
                
                //refresh data
                self.getData()
            }
            else {
                
                // Handle error
                
            }
          
        }
        
    }
 
    func deleteData(ClientFieldsToDelete: ClientFields ){
        
        // get a reference to the database
        
        let db = Firestore.firestore()
        
        // get dociment
        
        db.collection("Clients").document(ClientFieldsToDelete.id).delete { error in
            
            if error == nil {
                // no errors
                
                // update the ui from the main thread
                
                DispatchQueue.main.async {
                    // remove the clientField doc that was delete
                    self.lst.removeAll { ClientFields in
                        // check for the client doc to remove
                        
                        return ClientFields.id == ClientFieldsToDelete.id
                }
                
              
                    
                }
                
                
            }
            
            
            
        }
        
        
    }
    
    
    func addData(txtClientName: String,
                 txtClientContact: String,
                 txtClientStreet: String,
                 txtClientStreetNr: String,
                 txtClientPostalCode: String,
                 txtClientCity: String,
                 txtClientCountry: String,
                 txtClientEmail: String,
                 txtClientRemarks: String,
                 txtClientVAT: String){
        
        // get reference to database
        
        let db = Firestore.firestore()
        let currentDateTime = Date()
        
        // add documents                       links = db field, rechts = add data entry hierboven
        db.collection("Clients").addDocument(data: ["clientName": txtClientName,
                                                    "clientContact": txtClientContact,
                                                    "clientStreet": txtClientStreet,
                                                    "clientStreetNr": txtClientStreetNr,
                                                    "clientPostalCode": txtClientPostalCode,
                                                    "clientCity": txtClientCity,
                                                    "clientCountry": txtClientCountry,
                                                    "clientEmail": txtClientEmail,
                                                    "clientRemarks": txtClientRemarks,
                                                    "clientVAT": txtClientVAT,
                                                    "clientDateInsert": currentDateTime,
                                                    "clientDateUpdate": currentDateTime
                                                    
                                                   
                                                   ]){ error in
            if error == nil {
                // geen error, call getData to fetch latest data,dispatch voor refresh zit in getData
                self.getData()
                
            }
            else {
                // handle error
                
            }
            
        }
    }
    
    
    
    func getData() {
        
        // get a reference to the databse
        
        let db = Firestore.firestore()
        
        // get the documents at a specific path
        db.collection("Clients").getDocuments { snapshot, error in
            
            if error == nil {
                
                // no errors
                
                if let snapshot = snapshot {
                    
                    // update om refresh in voorgrond thread ipv achtergrond
                    
                    DispatchQueue.main.async {
                        self.lst = snapshot.documents.map { d in
                            
                            return ClientFields(id: d.documentID,
                                                varClientName: d["varClientName"] as? String ?? "",
                                                varClientContact: d["varClientContact"] as? String ?? "",
                                                varClientStreet: d["varClientStreet"] as? String ?? "",
                                                varClientStreetNr: d["varClientStreetNr"] as? String ?? "",
                                                varClientPostalCode: d["varClientPostalCode"] as? String ?? "",
                                                varClientCity: d["varClientCity"] as? String ?? "",
                                                varClientCountry: d["varClientCountry"] as? String ?? "",
                                                varClientEmail: d["varClientEmail"] as? String ?? "",
                                                varClientRemarks: d["varClientRemarks"] as? String ?? "",
                                                varClientVAT: d["varClientVAT"] as? String ?? "")
                        }
                    }
                }
                else {
                    
                    // handle error
                    
                }
            }
            
        }
        
    }
    
} //bijgezet
