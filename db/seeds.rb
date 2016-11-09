# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Course.create(name: "Web Development", description:"Learn the skills to become an entry level FUll Stack Web Developer! 12 weeks, all day, EVERYDAY!")
Course.create(name: "UX", description: "Learn the skills of a UX designer and put them to work while building a comprehensive portfolio. 10 weeks, all day, Monday through Friday!")
Course.create(name: "iOS", description: "Train in the coding, design, and iteration skills essesntial to build you own iOS app!")
Course.create(name: "Android Development", description:"Train in the coding, design, and iteration skills essential to build your own Android app!")

Language.create(name: "HTML 5")
Language.create(name: "CSS")
Language.create(name: "Javascript")
Language.create(name: "Ruby")
Language.create(name: "Rails")
Language.create(name: "React")
Language.create(name: "Angular 2")
Language.create(name: "Meteor")
Language.create(name: "Python")
Language.create(name: "Node.JS")
Language.create(name: "Socket.IO")
Language.create(name: "Action Cable")
Language.create(name: "Bootstrap")
Language.create(name: "Semantic UI")
Language.create(name: "Bootstrap")

Event.create(name: "Meet & Greet WDI 5")

Student.create(first_name: "Admin", last_name: "Tan", email: "admin@email.com", password: "admin@email.com", admin: "true")
Student.create(first_name: "Eugene", last_name: "Oei", email: "eugene@email.com", password: "eugene@email.com", linkedin: "https://sg.linkedin.com/in/eugeneoei", github: "https://github.com/eugeneoei", website:"www.soccernet.com", contact:91181444, description: "I am a man", admin: "false", event_id: 1, school: "Singapore Management University", qualification: "Bachelor's Degree
", degree: "Finance", graduation: "2014-05-01", profile_pic_url: "http://res.cloudinary.com/di820hhex/image/upload/v1476362172/gexcxefsms1omvadmxr6.jpg", course_id: 1, one_liner: "Hush.sg is my baby", link: "eugeneoei")
Student.create(first_name: "Denise", last_name: "Lim", email: "denise@email.com", password: "opopopop", linkedin: "https://www.linkedin.com/in/denise-lim", github: "https://github.com/thekneeslim", website:"https://www.google.com", contact:93829339, description: "Collect moments, not things. Spend on experiences, not materials. Be scared and do it anyway!", admin: "true", event_id: 1, school: "Singapore Management University", qualification: "Bachelor's Degree
", degree: "Accountancy", graduation: "2014-05-01", profile_pic_url: "http://res.cloudinary.com/di820hhex/image/upload/v1476250731/hmzwcwaom7enzjc8z7rr.jpg", course_id: 1, one_liner: "Professional slacker", link: "deniselim")

Work.create(title: "CEO", start: "2016-08-15", end: "2016-11-04", description: "I built Hush.sg from scratch with PHP", student_id: 2, company: "Hush.sg")
