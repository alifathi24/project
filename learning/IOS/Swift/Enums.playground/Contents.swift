import Foundation

// Basic enum syntax

enum TaskStatus {
    case pending
    case inProgress(startedAt: Date)
    case completed(completedAt: Date, rating: Int)
    case cancelled(reason: String)
}

let currentStatus = TaskStatus.pending
let anotherStatus: TaskStatus = .completed  (completedAt: Date(), rating: 4)

print(currentStatus)
print(anotherStatus)
