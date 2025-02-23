//
//  ViewController.swift
//  StudentDatabaseApp
//
//  Created by Manuel Santos Souza on 23/02/25.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var studentNamesLabel: UILabel!
	@IBOutlet weak var studentSearchLabel: UILabel!
	@IBOutlet weak var searchStudentTextField: UITextField!
	@IBOutlet weak var studentNameTextField: UITextField!

	var students: [String] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		studentNamesLabel.text = ""
		studentSearchLabel.text = ""
		studentNamesLabel.frame = CGRect(
			x: 20,
			y: 70,
			width: view.frame.width - 40,
			height: studentNamesLabel.frame.height * 3)
	}

	@IBAction func searchButtonTapped(_ sender: Any) {
		guard let studentName = searchStudentTextField.text,
			studentName != "",
			students.contains(studentName)
		else {
			studentSearchLabel.text = "Student not found!"
			return
		}

		studentSearchLabel.text = "\(studentName) exists!"
		searchStudentTextField.text = ""
	}

	@IBAction func submitButtonTapped(_ sender: Any) {
		guard let studentName = studentNameTextField.text,
			studentName != "",
			studentName.count > 3
		else {
			return
		}

		students.append(studentName)

		var interingStudents = ""
		for student in students {
			interingStudents += " \(student)"
		}

		studentNamesLabel.text = interingStudents
		studentNameTextField.text = ""
	}

}
