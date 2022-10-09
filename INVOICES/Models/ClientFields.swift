//
//  ClientFields.swift
//  INVOICES
//
//  Created by Koen Sas on 27/09/2022.
//

import Foundation
import Firebase

struct ClientFields: Identifiable {
    
    // id(en niet ID) moet in deze lijst staan anders protocol error
   
    var id: String
    
    var varClientName:String
    var varClientContact:String
    var varClientStreet:String
    var varClientStreetNr:String
    var varClientPostalCode:String
    var varClientCity:String
    var varClientCountry:String
    var varClientEmail:String
    var varClientRemarks:String
    var varClientVAT:String

    
}
