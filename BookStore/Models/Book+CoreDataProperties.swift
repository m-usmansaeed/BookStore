//
//  Book+CoreDataProperties.swift
//  BookStore
//
//  Created by M Usman Saeed on 08/07/2017.
//  Copyright © 2017 MUS. All rights reserved.
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book");
    }

    @NSManaged public var bookTitle: String?
    @NSManaged public var bookId: Int16

    
    static let books = [
        "The Adventures of Augie March",
        "All the King’s Men",
        "American Pastoral",
        "An American Tragedy",
        "Animal Farm",
        "Appointment in Samarra",
        "Are You There God? It’s Me, Margaret",
        "The Assistant",
        "At Swim-Two-Birds",
        "Atonement",
        "Beloved",
        "The Berlin Stories",
        "The Big Sleep",
        "The Blind Assassin",
        "Blood Meridian",
        "Brideshead Revisited",
        "The Bridge of San Luis Rey",
        "Call It Sleep",
        "Catch-22",
        "The Catcher in the Rye",
        "A Clockwork Orange",
        "The Confessions of Nat Turner",
        "The Corrections",
        "The Crying of Lot 49",
        "A Dance to the Music of Time",
        "The Day of the Locust",
        "Death Comes for the Archbishop",
        "A Death in the Family",
        "The Death of the Heart",
        "Deliverance",
        "Dog Soldiers",
        "Falconer",
        "The French Lieutenant’s Woman",
        "The Golden Notebook",
        "Go Tell it on the Mountain",
        "Gone With the Wind",
        "The Grapes of Wrath",
        "Gravity’s Rainbow",
        "The Great Gatsby",
        "A Handful of Dust",
        "The Heart is A Lonely Hunter",
        "The Heart of the Matter",
        "Herzog",
        "Housekeeping",
        "A House for Mr. Biswas",
        "I, Claudius",
        "Infinite Jest",
        "Invisible Man",
        "Light in August",
        "The Lion, The Witch and the Wardrobe",
        "Lolita",
        "Lord of the Flies",
        "The Lord of the Rings",
        "The Moviegoer",
        "Loving",
        "Lucky Jim",
        "The Man Who Loved Children",
        "Midnight’s Children",
        "Money",
        "Mrs. Dalloway",
        "Naked Lunch",
        "Native Son",
        "Neuromancer",
        "Never Let Me Go",
        "1984",
        "On the Road",
        "One Flew Over the Cuckoo’s Nest",
        "The Painted Bird",
        "Pale Fire",
        "A Passage to India",
        "Play It As It Lays",
        "Portnoy’s Complaint",
        "Possession",
        "The Power and the Glory",
        "The Prime of Miss Jean Brodie",
        "Rabbit, Run",
        "Ragtime",
        "The Recognitions",
        "Red Harvest",
        "Revolutionary Road",
        "The Sheltering Sky",
        "Slaughterhouse Five",
        "Snow Crash",
        "The Sot-Weed Factor",
        "The Sound and the Fury",
        "The Sportswriter",
        "The Spy Who Came in From the Cold",
        "The Sun Also Rises",
        "Their Eyes Were Watching God",
        "Things Fall Apart",
        "To Kill a Mockingbird",
        "To the Lighthouse",
        "Tropic of Cancer",
        "Ubik",
        "Under the Net",
        "Under the Volcano",
        "Watchmen",
        "White Noise",
        "White Teeth",
        "Wide Sargasso Sea"
    ]

}
