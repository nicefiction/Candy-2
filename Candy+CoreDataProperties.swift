// Candy+CoreDataProperties.swift

// MARK: - LIBRARIES -

import Foundation
import CoreData



extension Candy {
   
   @nonobjc
   public class func fetchRequest()
   -> NSFetchRequest<Candy> {
      
      return NSFetchRequest<Candy>(entityName: "Candy")
   }
   
   
   @NSManaged public var name: String?
   @NSManaged public var origin: Country?
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   public var wrappedName: String { return name ?? "N/A" }
}





// MARK: - EXTENSIONS -

extension Candy : Identifiable {}
