//
//  Course.swift
//  AnimatedApp
//
//  Created by Meng To on 2022-04-14.
//

import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var caption: String
    var color: Color
    var image: Image
}

var courses = [
    Course(title: "Welcome to Start Code",
           subtitle: "Your journey to mastering coding begins here!",
           caption: "Unlock endless coding opportunities",
           color: Color(hex: "7850F0"),
           image: Image("Topic 1")),
    Course(title: "Mastering C++",
              subtitle: "Learn C++ from the basics to advanced techniques. Explore object-oriented programming, memory management, and more.",
              caption: "Unlock the power of C++",
              color: Color(hex: "FF5733"),
              image: Image("Topic 2")),
       
       Course(title: "Building Applications with C#",
              subtitle: "Create powerful applications using C#. Dive into Visual Studio, .NET, and learn how to build robust software solutions.",
              caption: "Master application development with C#",
              color: Color(hex: "28A745"),
              image: Image("Topic 1")),
       
       Course(title: "Java for Developers",
              subtitle: "Become proficient in Java. Learn how to build scalable applications, work with Java frameworks, and manage databases.",
              caption: "Start building in Java today",
              color: Color(hex: "FFC107"),
              image: Image("Topic 2")),
]
