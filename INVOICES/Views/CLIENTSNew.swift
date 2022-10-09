//
//  CLIENTSNew.swift
//  INVOICES
//
//  Created by Koen Sas on 28/09/2022.
//

import SwiftUI
import Firebase

struct CLIENTSNew: View {
    
    
    // naar class ViewModel: ObservableObject
    @ObservedObject var vModel = ViewModel()
    
    @State private var showHome:Bool = false
    @State private var showClients:Bool = false
    @State private var showCallsheets:Bool = false
    @State private var showDetails:Bool = false
    @State private var showInvoices:Bool = false
    
    @State var varClientName = ""
    @State var varClientContact = ""
    @State var varClientStreet = ""
    @State var varClientStreetNr = ""
    @State var varClientPostalCode = ""
    @State var varClientCity = ""
    @State var varClientCountry = ""
    @State var varClientEmail = ""
    @State var varClientRemarks = ""
    @State var varClientVAT = ""
    
    
    // Observable staat in Models/TitleTest.swift
    @ObservedObject var obsTitleFields = modTitleTransfer()
    
    var body: some View {
        
    // in groepen onder de 10 anders error
            
            VStack{
                
                Group{
                    TextField("txtclientName", text:  $varClientName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 350, height: 30, alignment: .center)
                        
                    TextField("txtclientContact", text: $varClientContact)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 350, height: 30, alignment: .center)
                    TextField("txtClientStreet", text: $varClientStreet)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 350, height: 30, alignment: .center)
                    TextField("txtClientStreetNr", text: $varClientStreetNr)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 350, height: 30, alignment: .center)
                    TextField("txtClientPostalCode", text: $varClientPostalCode)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 350, height: 30, alignment: .center)
                }
                Group{
                    TextField("txtClientCity", text: $varClientCity)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 350, height: 30, alignment: .center)
                    TextField("txtClientCountry", text: $varClientCountry)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 350, height: 30, alignment: .center)
                    TextField("txtClientEmail", text: $varClientEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 350, height: 30, alignment: .center)
                    TextField("txtClientRemarks", text: $varClientRemarks)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 350, height: 30, alignment: .center)
                    TextField("txtClientVAT", text: $varClientVAT)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 350, height: 30, alignment: .center)
                }
                
    
                Button {
                    vModel.addData(txtClientName: varClientName,
                                   txtClientContact: varClientContact,
                                   txtClientStreet: varClientStreet,
                                   txtClientStreetNr: varClientStreetNr,
                                   txtClientPostalCode: varClientPostalCode,
                                   txtClientCity: varClientCity,
                                   txtClientCountry: varClientCountry,
                                   txtClientEmail: varClientEmail,
                                   txtClientRemarks: varClientRemarks,
                                   txtClientVAT: varClientVAT)
                                    
                    
                    // clear the fields
                    varClientName = ""
                    varClientContact = ""
                    varClientStreet = ""
                    varClientStreetNr = ""
                    varClientPostalCode = ""
                    varClientCity = ""
                    varClientCountry = ""
                    varClientEmail = ""
                    varClientRemarks = ""
                    varClientVAT = ""
                    
            
                    
                } label: {
                    Text("insert new client")
                }

                }
                
            
        }
        
        
    }


struct CLIENTSNew_Previews: PreviewProvider {
    static var previews: some View {
        CLIENTSNew()
    }
}
