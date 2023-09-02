import Foundation

protocol Publisher {
    var observers: [Observer] { get set }
    func subscribe(observer: Observer)
    func unSubscribe(observer: Observer)
    func notify(message: String)
}

protocol Observer {
    var id: String { get set }
    func update(message: String)
}

class XStore : Publisher {
    var observers: [Observer]
    
    
    init(observers: [Observer]) {
        self.observers = observers
        
    }
    
    func subscribe(observer: Observer) {
        observers.append(observer)
    }
    
    func unSubscribe(observer: Observer) {
        observer.update(message: "unSubcribe")
    
    }
    
    func notify(message: String) {
        for observer in observers {
            if observer.id == "unSubcribe"{
                continue
            }
            else{
                print("\(observer.id)님 \(message)")
            }
        }
    }
    
}

class Customer : Observer {
    var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func update(message: String) {
        id = message
    }
    
    
}

let xStore = XStore(observers: [])
let cheolsu = Customer(id: "철수")
let younghee = Customer(id: "영희")
let mina = Customer(id: "미나")
let minsu = Customer(id: "민수")

// 구독
xStore.subscribe(observer: cheolsu)
xStore.subscribe(observer: younghee)
xStore.subscribe(observer: minsu)
xStore.notify(message: "iPhone 15 출시!")

// 구독취소
xStore.unSubscribe(observer: younghee)
xStore.notify(message: "iPad Pro 입고!")
