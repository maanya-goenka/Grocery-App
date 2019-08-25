//
//  ViewController.swift
//  Grocery App
//
//  Created by Mihikaa Goenka on 7/21/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageFood: UIImageView!
    var imageFood2: UIImageView!
    var imageFood3: UIImageView!
    var groceryItemLabel: UILabel!
    var quantityLabel: UILabel!
    var itemTextView: UITextView!
    var quantityTextView: UITextView!
    var addButton: UIButton!
    var deleteButton: UIButton!
    var listBox: UITextView!
    var list: [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        // Do any additional setup after loading the view, typically from a nib.
        
        imageFood = UIImageView()
        imageFood.translatesAutoresizingMaskIntoConstraints = false
        imageFood.image = UIImage(named: "cookie")
        imageFood.clipsToBounds = true
        imageFood.contentMode = .scaleAspectFit
        view.addSubview(imageFood)
        
        imageFood2 = UIImageView()
        imageFood2.translatesAutoresizingMaskIntoConstraints = false
        imageFood2.image = UIImage(named: "taco")
        imageFood2.clipsToBounds = true
        imageFood2.contentMode = .scaleAspectFit
        view.addSubview(imageFood2)
        
        imageFood3 = UIImageView()
        imageFood3.translatesAutoresizingMaskIntoConstraints = false
        imageFood3.image = UIImage(named: "icecream")
        imageFood3.clipsToBounds = true
        imageFood3.contentMode = .scaleAspectFit
        view.addSubview(imageFood3)
        
        groceryItemLabel = UILabel()
        groceryItemLabel.text = "Grocery Items: "
        groceryItemLabel.textColor = .white
        groceryItemLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(groceryItemLabel)
        
        quantityLabel = UILabel()
        quantityLabel.text = "Quantity: "
        quantityLabel.textColor = .white
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(quantityLabel)
        
        itemTextView = UITextView()
        itemTextView.translatesAutoresizingMaskIntoConstraints = false
        itemTextView.text = ""
        itemTextView.isEditable = true
        itemTextView.font = UIFont.systemFont(ofSize: 15)
        itemTextView.backgroundColor = .orange
        itemTextView.textColor = .black
        view.addSubview(itemTextView)

        quantityTextView = UITextView()
        quantityTextView.translatesAutoresizingMaskIntoConstraints = false
        quantityTextView.text = ""
        quantityTextView.isEditable = true
        quantityTextView.font = UIFont.systemFont(ofSize: 15)
        quantityTextView.backgroundColor = .green
        quantityTextView.textColor = .black
        view.addSubview(quantityTextView)
        
        addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("ADD", for: .normal)
        addButton.setTitleColor(.green, for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        view.addSubview(addButton)

        deleteButton = UIButton()
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.setTitle("DELETE", for: .normal)
        deleteButton.setTitleColor(.red, for: .normal)
        deleteButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        deleteButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        view.addSubview(deleteButton)
        
        listBox = UITextView()
        listBox.translatesAutoresizingMaskIntoConstraints = false
        listBox.text = "                Hi, this is your grocery list :)\n"
        listBox.isEditable = false
        listBox.font = UIFont.systemFont(ofSize: 20)
        listBox.backgroundColor = .black
        listBox.textColor = .white
        view.addSubview(listBox)
        
        
        setupConstraints()
        
    }

    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            imageFood.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageFood.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageFood.heightAnchor.constraint(equalToConstant: 100),
            imageFood.widthAnchor.constraint(equalToConstant: 100)
            ])
        
        NSLayoutConstraint.activate([
            imageFood2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageFood2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            imageFood2.heightAnchor.constraint(equalToConstant: 100),
            imageFood2.widthAnchor.constraint(equalToConstant: 100)
            ])
        
        NSLayoutConstraint.activate([
            imageFood3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageFood3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            imageFood3.heightAnchor.constraint(equalToConstant: 100),
            imageFood3.widthAnchor.constraint(equalToConstant: 100)
            ])
        
        NSLayoutConstraint.activate([
            groceryItemLabel.topAnchor.constraint(equalTo: imageFood.bottomAnchor, constant: 20),
            groceryItemLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            ])
        
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: groceryItemLabel.bottomAnchor, constant: 10),
            quantityLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 62.5),
            ])
        

        NSLayoutConstraint.activate([
            itemTextView.topAnchor.constraint(equalTo: imageFood.bottomAnchor, constant: 20),
            itemTextView.leadingAnchor.constraint(equalTo: groceryItemLabel.trailingAnchor, constant: 10),
            itemTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            itemTextView.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            quantityTextView.topAnchor.constraint(equalTo: itemTextView.bottomAnchor, constant: 10),
            quantityTextView.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 10),
            quantityTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            quantityTextView.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 30),
            addButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 150),
            ])
        
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 30),
            deleteButton.leadingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: 10),
            ])
        
        NSLayoutConstraint.activate([
            listBox.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 25),
            listBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            listBox.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            listBox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            listBox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
            ])
        
        
    }
  
    @objc func addButtonPressed(){
        if let item = itemTextView.text, let quantity = quantityTextView.text, item != "", quantity != ""{
            list[item] = quantity
            listBox.text = listBox.text + "\n \(item) : \(quantity)"
        }
        itemTextView.text = ""
        quantityTextView.text = ""
    }
    
    @objc func deleteButtonPressed(){
        if let item = itemTextView.text, item != "" {
            list.removeValue(forKey: item)
        }
        itemTextView.text = ""
        quantityTextView.text = ""
        listBox.text = "                Hi, this is your grocery list :)\n"
        for (item2, quantity2) in list {
            listBox.text = listBox.text + "\n \(item2) : \(quantity2)"
        }
    }

}
