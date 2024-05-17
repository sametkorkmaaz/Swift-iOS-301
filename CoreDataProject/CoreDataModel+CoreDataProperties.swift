//
//  CoreDataModel+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Samet Korkmaz on 12.04.2024.
//
//

import Foundation
import CoreData


extension CoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataModel> {
        return NSFetchRequest<CoreDataModel>(entityName: "CoreDataModel")
    }

    @NSManaged public var alan1: String?
    @NSManaged public var alan2: Int64
    @NSManaged public var alan3: Bool

}

extension CoreDataModel : Identifiable {

}
