import CArch

protocol TestProtocolInc {}
protocol TestProtocolInc2 {}

@SyncAlias
protocol TestProtocol: TestProtocolInc, ErrorAsyncHandler {
    
    func syncFunction(_ object: Any)
    
    func asyncFunction(_ object: Any) async
    
    func asyncObtain(with id: String) async
    
    func asyncThrowsFunction(_ object: Any) async throws
    
    func asyncThrowsObtain(with id: String) async throws
    
    func asyncThrowsObtain(with id: String, and object: Any) async throws
}

struct Test: TestProtocol {
    
    func syncFunction(_ object: Any) {
        print(object)
    }
    
    func asyncFunction(_ object: Any) async {
        print(object)
    }
    
    func asyncObtain(with id: String) async {
        print(id)
    }
    
    func asyncThrowsFunction(_ object: Any) async throws {
        print(object)
    }
    
    func asyncThrowsObtain(with id: String) async throws {
        print(id)
    }
    
    func asyncThrowsObtain(with id: String, and object: Any) async throws {
        print(id, object)
    }
    
    func encountered(_ error: Swift.Error) {
        print(error)
    }
}

let test = Test()
test.asyncFunction(0)
test.asyncThrowsFunction("Some")
test.asyncThrowsObtain(with: "Id")

@UIContactor
@MainActor protocol TestUIProtocol {
    
    func function(_ object: Any)
    
    func function(with id: String)
    
    func function(with id: String, and object: Any)
    
    func function1(_ object: Any) async
    
    func function2(with id: String) async throws
    
    func function3(with id: String, and object: Any) -> Int
}

struct TestUI: TestUIProtocol {
    
    nonisolated init() {}
    
    func function(_ object: Any) {
        print(object)
    }
    
    func function(with id: String) {
        print(id)
    }
    
    func function(with id: String, and object: Any) {
        print(id, object)
    }
    
    func function1(_ object: Any) async {
        print(object)
    }
    
    func function2(with id: String) async throws {
        print(id)
    }
    
    func function3(with id: String, and object: Any) -> Int {
        print(id, object)
        return 0
    }
}

let testUI = TestUI()
test.asyncFunction("")
