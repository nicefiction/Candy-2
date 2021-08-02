// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI
import CoreData



struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.managedObjectContext) var moc
   @FetchRequest(entity: Country.entity(),
                 sortDescriptors: []) var countries: FetchedResults<Country>
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      /*
       List {
               ForEach(countries, id: \.self) { country in
                   Section(header: Text(country.wrappedFullName)) {
                       ForEach(country.candyArray, id: \.self) { candy in
                           Text(candy.wrappedName)
                       }
                   }
               }
           }
       */
      VStack {
         List {
            ForEach(countries,
                    id: \.self) { (country: Country) in
               Section(header: Text(country.wrappedLongName)) {
                  ForEach(country.wrappedCandies,
                          id: \.self) { (candy: Candy) in
                     Text(candy.wrappedName)
                  }
               }
            }
         }
         VStack(spacing: 20) {
            Button("Add Candies") {
               let candy1 = Candy(context: self.moc)
               candy1.name = "Mars"
               candy1.origin = Country(context: self.moc)
               candy1.origin?.shortName = "UK"
               candy1.origin?.longName = "United Kingdom"
               
               let candy2 = Candy(context: self.moc)
               candy2.name = "KitKat"
               candy2.origin = Country(context: self.moc)
               candy2.origin?.shortName = "UK"
               candy2.origin?.longName = "United Kingdom"
               
               let candy3 = Candy(context: self.moc)
               candy3.name = "Twix"
               candy3.origin = Country(context: self.moc)
               candy3.origin?.shortName = "UK"
               candy3.origin?.longName = "United Kingdom"
               
               let candy4 = Candy(context: self.moc)
               candy4.name = "Toblerone"
               candy4.origin = Country(context: self.moc)
               candy4.origin?.shortName = "CH"
               candy4.origin?.longName = "Switzerland"
            }
            Button("Save Candies") {
               if self.moc.hasChanges {
                  try? self.moc.save()
               }
            }
         }
      }
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}
