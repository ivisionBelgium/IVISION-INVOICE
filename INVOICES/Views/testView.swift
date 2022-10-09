//
//  testView.swift
//  INVOICES
//
//  Created by Koen Sas on 28/09/2022.
//

import SwiftUI
import Firebase

class ClientID: ObservableObject {
    
    @Published var clientID = 0
    
}

struct changeView: View{
    
    @EnvironmentObject var clientID: ClientID
    
    var body: some View {
        
        VStack{
            
            Text("ClientID:  \(clientID.clientID)")
            Button("increase"){
                self.clientID.clientID += 1
                
                
            }
            
        }
    }
    
    
}

struct testView: View {
    
    @ObservedObject var vModel = ViewModel()
    
    // create usezr of client
    @ObservedObject var obsClientID = ClientID()
    
    // om navigationlink volledig te customaliseren
    @State private var selection: String? = nil
    
    @State var varclientID2 = 0
    
    @State private var varFullscreen = false
    
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 20){
                
                Button("Toggle fulscreen"){
                    
                    self.varFullscreen.toggle()
        
                }
                .navigationBarTitle("Fullscreen")
                .navigationBarHidden(varFullscreen)
                
                
//                Text("Client bar variatie 1: \(varclientID2)")
//                    .navigationBarTitle("nav")
//                    .navigationBarItems(
//                                        leading:
//                                            Button("Add 1"){
//                                            self.varclientID2 += 1
//                                            },
//                                        trailing:
//                                            Button("substract"){
//                                            self.varclientID2 -= 1
//                                        }
//                    )
                
                Text("client bar twee buttons trailing: \(varclientID2)")
                    
                    .navigationBarTitle("Navigatie Titel")
                    .navigationBarItems(
                                    trailing:
                                        HStack{
                                            Button("add 1"){
                                                    self.varclientID2 += 1
                                            } // zonder ','
                                        
                                            Button("substract"){
                                                    self.varclientID2 -= 1
                                            }
                                        }
                    
                    )
                
                //client is current client
                Text("client ID: \(obsClientID.clientID)")
                List(vModel.lst){ item in
                    
                    Text(item.varClientName).foregroundColor(.green)
                   
                }
                NavigationLink(destination: changeView()){
                    
                    Text("Show detail view")
                }
                
              
                }
            //.navigationBarTitle("Navigation")
            .statusBar(hidden: varFullscreen)
                
            
            }
        
        .environmentObject(obsClientID)
      
            
        
        
    }
    init(){
        
        vModel.getData()
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
