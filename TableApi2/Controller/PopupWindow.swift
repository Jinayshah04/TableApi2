import UIKit

// Define a protocol to send the joke data back
protocol PopupWindowDelegate: AnyObject {
    func addJoke(joke: JokeModel)
}

class PopupWindow: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var idInput: UITextField!
    @IBOutlet weak var typeInput: UITextField!
    @IBOutlet weak var setupInput: UITextField!
    @IBOutlet weak var punchlineInput: UITextField!
    @IBOutlet weak var addJokeButton: UIButton!
    
    // MARK: - Delegate Property
    weak var delegate: PopupWindowDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addJokeButtonClicked(_ sender: UIButton) {
        // Validate inputs
        guard let idText = idInput.text, let id = Int(idText), id > 0,
              let type = typeInput.text, !type.isEmpty,
              let setup = setupInput.text, !setup.isEmpty,
              let punchline = punchlineInput.text, !punchline.isEmpty else {
            // You might want to show an alert if inputs are invalid
            return
        }
        
        // Create the joke model
        let newJoke = JokeModel(id: id, type: type, setup: setup, punchline: punchline)
        
        // Pass the new joke back to the ViewController using the delegate
        delegate?.addJoke(joke: newJoke)
        
        // Dismiss the popup
        self.dismiss(animated: true, completion: nil)
    }
}
