//  Scope Lab #1: Scope Demo
//
//  # Instructions:
//  - With a partner, throughly annotate this file to describe
//    the scope of each and every variable and constant,
//    including those declared as part of function parameters.
//  - Add comments at the end of each line with a new variable
//    to annotate their scope.
//  - We will do the first few together.


import Foundation

let appName: String = "Scope Explorer" // Global, available anywhere in the project
var globalUserCount: Int = 0 // Global, available anywhere in the project

@MainActor // Ignore this
class ScopeDemoViewModel { // Global, available anywhere in the project

    static let maxCachedItems: Int = 100 // Global, through the type ScopeDemoViewModel without needing an instance
    static var sharedInstanceCount: Int = 0 // Global, through the type ScopeDemoViewModel without needing an instance

    let id: UUID // Local, available only through ScopeDemoViewModel
    var title: String // Local, available only through ScopeDemoViewModel
    private var isDirty: Bool = false // Local, available only within ScopeDemoViewModel
    fileprivate var lastSyncDate: Date // Local, available only through ScopeDemoViewModel within this file
    internal var retryCount: Int = 0 // Local, available only through ScopeDemoViewModel
    public var isEnabled: Bool = true // Local, available only through ScopeDemoViewModel

    var isSynced: Bool { // Local, available only through ScopeDemoViewModel
        return !isDirty
    }

    private var shouldRetry: Bool { // Local, available only within ScopeDemoViewModel
        return retryCount < 3 && !isSynced
    }

    static var descriptionText: String { // Global, available only through ScopeDemoViewModel
        return "This type demonstrates many different scopes."
    }

    struct SyncSettings { // Local, available only through ScopeDemoViewModel
        let maxAttempts: Int // Local, available only through SyncSettings
        var delayBetweenAttempts: TimeInterval // Local, available only through SyncSettings
        private(set) var lastUsedVersion: String // Local, available only within SyncSettings

        mutating func markUsed(version: String) { // Local, available only through SyncSettings
            lastUsedVersion = version
        }
    }

    var syncSettings: SyncSettings // Local, available only through ScopeDemoViewModel

    init(title: String) {
        self.id = UUID() // Shadowing ScopeViewDemoModel's local properties
        self.title = title // Shadowing ScopeViewDemoModel's local properties
        self.syncSettings = SyncSettings( // Shadowing ScopeViewDemoModel's local properties
            maxAttempts: 3,
            delayBetweenAttempts: 2.0,
            lastUsedVersion: "1.0"
        )
        self.lastSyncDate = Date() // Shadowing ScopeViewDemoModel's local properties

        let initialStatusMessage = "Created view model with title: \(title)"
        print(initialStatusMessage) // Local, contained in ScopeViewDemoModel's initialization

        ScopeDemoViewModel.sharedInstanceCount += 1
    }

    convenience init() { // Shadowing ScopeViewDemoModel's local initializing function
        self.init(title: "Untitled")
    }

    func performSync() { // Local, available only through ScopeViewDemoModel
        let startTime = Date() // Local, available only within this function
        var attempts = 0 // Local, available only within this function

        let retryCount = 0 // Local, available only within this function
        print("Local retryCount (shadowing property): \(retryCount)")

        func attemptSyncOnce() -> Bool { // Local function, available only within this function
            attempts += 1
            globalUserCount += 1

            let syncId = UUID() // Local variable, available only within this function
            print("Attempt \(attempts) with id \(syncId)")
            return Bool.random()
        }

        while attempts < syncSettings.maxAttempts {
            let success = attemptSyncOnce() // Local, available only within this while loop
            if success {
                lastSyncDate = Date()
                isDirty = false
                break
            }
        }

        let elapsed = Date().timeIntervalSince(startTime) // Local variable, available only within this function
        print("Sync finished in \(elapsed) seconds")
    }

    private func logStatusChange(from old: String, to new: String) { // Local func, available only within this class
        let logMessage = "Status changed from \(old) to \(new)" // Local constant, available only within this function
        print(logMessage)
    }

    func updateTitle(to newTitle: String, animated: Bool) { // Local, available through this class
        let oldTitle = title // Local variable, available only within this function updateTitle
        title = newTitle
        isDirty = true

        if animated {
            animateTitleChange(from: oldTitle, to: newTitle)
        }
    }

    private func animateTitleChange(from old: String, to new: String) { // Local func, available only within this class
        let animationDuration: TimeInterval = 0.25 // Local constants, available only within this function

        let animations = { // Local computed variable, available only within this function
            let transitionText = "\(old) → \(new)" // Local constant, available only within this computed variable
            print("Animating title change: \(transitionText)")
        }

        performAnimation(duration: animationDuration, animations: animations)
    }

    private func performAnimation(duration: TimeInterval, animations: () -> Void) { // Local func, available only within this class
        print("Starting animation for \(duration) seconds")
        animations()
        print("Animation complete")
    }

    static func resetSharedInstanceCount() { // Global func, available through this class
        sharedInstanceCount = 0
    }

    static func makeSampleViewModels() -> [ScopeDemoViewModel] { // Local func, available only within this class
        let titles = ["Home", "Profile", "Settings", "About"] // Local constant, available only within this function
        var result: [ScopeDemoViewModel] = [] // Local variable, available only within this function

        for name in titles {
            let model = ScopeDemoViewModel(title: name) // Local, available only within this for loop
            result.append(model)
        }

        return result
    }
    
    fileprivate func markAsDirtyForTesting() { // Local func, available only through this class within this file
        isDirty = true
    }
}

fileprivate extension ScopeDemoViewModel { // Global, available only within this file
    func debugPrintState() { // Local func, available only through this class
        print("Debug id: \(id)")
        print("Debug lastSyncDate: \(String(describing: lastSyncDate))")
    }
}

@MainActor // Ignore this
func runScopeDemo() { // Global func, available anywhere
    let models = ScopeDemoViewModel.makeSampleViewModels() // Local constant, available only within this func
    print("Created \(models.count) models in \(appName)")
    print("Global user count: \(globalUserCount)")

    if let first = models.first {
        first.performSync()
    }
}
