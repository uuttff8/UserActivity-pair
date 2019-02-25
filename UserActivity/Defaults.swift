import Foundation


// This is UserDefaults safety wrapper
class Defaults {
    
    private class var userDefaults: UserDefaults {
        guard let userDefaults = UserDefaults(suiteName: "default") else {
            fatalError("Failed to instantiate user defaults from target's name")
        }
        return userDefaults
    }
    
    fileprivate enum Keys: String {
        case targetSteps = "targetSteps"
    }

    class var targetSteps: Int {
        get {
            return userDefaults[.targetSteps] ?? 0
        }
        set {
            userDefaults[.targetSteps] = newValue
        }
    }
    
    private subscript<T>(key: Keys) -> T? {
        get {
            return Defaults.userDefaults[key]
        }
        set {
            Defaults.userDefaults[key] = newValue
            Defaults.userDefaults.synchronize()
        }
    }
}

fileprivate extension UserDefaults {
    
    typealias Keys = Defaults.Keys
    
    subscript<T>(key: Keys) -> T? {
        get {
            return get(valueForKey: key)
        }
        set {
            set(value: newValue, forKey: key)
        }
    }
}

private extension UserDefaults {
    
    func get<T>(valueForKey key: Keys) -> T? {
        return object(forKey: key.rawValue) as? T
    }
    
    func set<T>(value: T, forKey key: Keys) {
        set(value, forKey: key.rawValue)
    }
}
