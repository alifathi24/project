// Declaring optionals
var userName: String? = "Alice"
var userAge: Int? = nil
var isSubscribe: Bool? = true

print(userName ?? "Anonymous")
print(userAge ?? 32)
print(isSubscribe ?? false)

var optionalMessage: String?
let displayMessage: String = optionalMessage ?? "No message available"
print(displayMessage)

var userProfile: (name: String, email: String?)? = (name: "David", email: "david@example.com")
let emailLength = userProfile?.email?.count
print(emailLength ?? "Unknown")

var firstName: String = "Alice"
var middleName: String? = "Marie"
var lastName: String = "Johnson"

let displayMiddle = middleName ?? ""
let fullName = firstName + (displayMiddle.isEmpty ? " " : " " + displayMiddle + " ") + lastName
print(fullName)

// When middle name is missing
var anotherUser = (first: "Bob", middle: String?.none, last: "Smith")
let anotherMiddle = anotherUser.middle ?? ""
let anotherFullName = anotherUser.first + (anotherMiddle.isEmpty ? " " : " " + anotherMiddle + " ") + anotherUser.last

print(anotherFullName)

// force unwrapping
var definitelyHasValue: String! = "Hello!"
let unwrappedValue = definitelyHasValue!
print(unwrappedValue)
