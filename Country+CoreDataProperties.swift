// Country+CoreDataProperties.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/one-to-many-relationships-with-core-data-swiftui-and-fetchrequest

// MARK: - LIBRARIES -

import Foundation
import CoreData



extension Country {
   
   @nonobjc
   public class func fetchRequest()
   -> NSFetchRequest<Country> {
      
      return NSFetchRequest<Country>(entityName: "Country")
   }
   
   
   @NSManaged public var shortName: String?
   @NSManaged public var longName: String?
   @NSManaged public var candy: NSSet?
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   public var wrappedShortName: String { return shortName ?? "N/A" }
   public var wrappedLongName: String { return longName ?? "N/A" }
   public var wrappedCandies: [Candy] {
      /// `STEP 1` : Convert the NSSet to a Set<Candy>
      ///  – a Swift-native type where we know the types of its contents .
      let candySet = candy as? Set<Candy> ?? []
      /// `STEP 2` : Convert that Set<Candy> into an array ,
      /// so that ForEach can read individual values from there .
      return candySet.sorted { (candy1: Candy, candy2: Candy) in
         /// `STEP 3` : Sort that array , so the candy bars come in a sensible order .
         candy1.wrappedName < candy2.wrappedName
      }
   }
}





// MARK: - EXTENSIONS
// MARK: Generated accessors for candy -
extension Country {
   
   @objc(addCandyObject:)
   @NSManaged public func addToCandy(_ value: Candy)
   
   @objc(removeCandyObject:)
   @NSManaged public func removeFromCandy(_ value: Candy)
   
   @objc(addCandy:)
   @NSManaged public func addToCandy(_ values: NSSet)
   
   @objc(removeCandy:)
   @NSManaged public func removeFromCandy(_ values: NSSet)
}



extension Country : Identifiable {}
