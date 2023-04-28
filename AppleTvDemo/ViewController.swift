
import UIKit
import Backendless

class ViewController: UIViewController {
    
    @IBOutlet var objectSavedLabel: UILabel!
    @IBOutlet var liveUpdateObjectPropertyLabel: UILabel!
    @IBOutlet var propertyLabel: UILabel!
    @IBOutlet var changePropertyValueTextField: UITextField!
    @IBOutlet var updateButton: UIButton!
    
    var dataStore: MapDrivenDataStore?
    var testObject: [String : Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changePropertyValueTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        saveTestObject()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if ((textField.text?.count)! > 0) {
            updateButton.isEnabled = true
        }
        else {
            updateButton.isEnabled = false
        }
    }
    
    func showErrorAlert(_ fault: Fault) {
        let alert = UIAlertController(title: String(format: "Error %@", fault.faultCode), message: fault.message, preferredStyle: .alert)
        let dismissButton = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(dismissButton)
        present(alert, animated: true, completion: nil)
    }
    
    func saveTestObject() {
        dataStore = Backendless.shared.data.ofTable("TestTable")
        testObject = ["foo" : "Hello World"]
        dataStore?.save(entity: testObject!, responseHandler: { savedTestObject in
            self.objectSavedLabel.text = "Object has been saved in the real-time database"
            self.liveUpdateObjectPropertyLabel.text = "Live update object property"
            self.propertyLabel.text = savedTestObject["foo"] as? String
            self.testObject = savedTestObject
            let eventHandler = self.dataStore?.rt
            if let savedObjectId = savedTestObject["objectId"] as? String {
                let whereClause = String(format: "objectId = '%@'", savedObjectId)
                let _ = eventHandler?.addUpdateListener(whereClause: whereClause, responseHandler: {
                    updatedTestObject in
                        if (updatedTestObject["foo"] != nil) {
                            self.propertyLabel.text = updatedTestObject["foo"] as? String
                        }
                }, errorHandler: { fault in
                    self.showErrorAlert(fault)
                })
            }
        }, errorHandler: { fault in
            self.showErrorAlert(fault)
        })
    }
    
    @IBAction func pressedUpdate(_ sender: Any) {
        if testObject != nil,
           let property = changePropertyValueTextField.text {
            testObject!["foo"] = property
            dataStore?.save(entity: testObject!, responseHandler: { updatedTestObject in
            }, errorHandler: { fault in
                self.showErrorAlert(fault)
            })
        }
        changePropertyValueTextField.text = ""
        updateButton.isEnabled = false
    }
}
