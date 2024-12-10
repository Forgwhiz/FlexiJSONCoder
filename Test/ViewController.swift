import UIKit
import FlexiJSONCoder

struct MyModel: Codable {
    var value_data: String
    var number_key: String
    var flag_book: Bool

    enum CodingKeys: String, CodingKey, CaseIterable {
        case value_data = "value"
        case number_key = "number"
        case flag_book = "flag"
    }
}

let dictionary: [String: Any?] = [
    "value" : "1",
    "flag": "true"
]

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [.fragmentsAllowed])
            let result = try FlexiJSONCoder().decode(MyModel.self, from: jsonData)
            
            print("Decoded model: \(result)")
        } catch {
            print("Error during decoding: \(error)")
        }
    }


}

