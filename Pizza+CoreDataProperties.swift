//
//  Pizza+CoreDataProperties.swift
//  Pizza App
//
//  Created by Ananthamoorthy Haniman on 2022-05-17.
//
//

import Foundation
import CoreData


extension Pizza {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pizza> {
        return NSFetchRequest<Pizza>(entityName: "Pizza")
    }

    @NSManaged public var name: String?
    @NSManaged public var ingredients: String?
    @NSManaged public var imageName: String?
    @NSManaged public var thumbnailName: String?
    @NSManaged public var type: String?
    @NSManaged public var isFavourite: Bool

}

extension Pizza : Identifiable {

}
