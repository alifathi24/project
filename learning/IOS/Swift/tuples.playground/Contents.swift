// Access tuple values
let userInfo = (name: "Sarah", age: 28, isStudent: true)

// Access by name (recommended)
print("Hello, \(userInfo.name)")
print("Age: \(userInfo.age)")

// Access by position (Starting at 0)
print("Name: \(userInfo.0)")
print("Age: \(userInfo.1)")
