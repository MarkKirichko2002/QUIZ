//
//  CategoryTableViewController.swift
//  QUIZ
//
//  Created by Марк Киричко on 26.02.2022.
//

import UIKit
import SCLAlertView

final class CategoryTableViewController: UITableViewController {
    
    @IBOutlet weak var InfoCategoriesButton: UIBarButtonItem!
    
    var categories = QuizStorage.shared.categories
    
    var player = SoundClass()
    
    var quizes = [QuizPlanets(), QuizHistory(), QuizAnatomy(), QuizSport(), QuizGames(), QuizIQ(), QuizEconomy(), QuizGeography(), QuizEconomy(), QuizPhysics(), QuizChemistry(), QuizInformatics(), QuizUnderwater()]
    
    @IBAction func ShowCategoriesInfo() {
        player.Sound(resource: "future click sound.wav")
        SCLAlertView().showInfo("О Категориях", subTitle: "В каждой категории викторины по 20 вопросов максимальный результат равен 100 баллам. После того как вы пройдете одну из различных категорий ваш результат появиться в таблице \"Список Игроков\". На данный момент количество категорий равно \(categories.count).")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(categories.count)
        navigationItem.title = "Категории (\(categories.count))"
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        player.Sound(resource: "selected sound.wav")
        switch(indexPath.row) {
        case 0:  goToQuize(quiz: QuizPlanets())
        case 1:  goToQuize(quiz: QuizHistory())
        case 2:  goToQuize(quiz: QuizAnatomy())
        case 3:  goToQuize(quiz: QuizSport())
        case 4:  goToQuize(quiz: QuizGames())
        case 5:  goToQuize(quiz: QuizIQ())
        case 6:  goToQuize(quiz: QuizEconomy())
        case 7:  goToQuize(quiz: QuizGeography())
        case 8:  goToQuize(quiz: QuizEcology())
        case 9:  goToQuize(quiz: QuizPhysics())
        case 10: goToQuize(quiz: QuizChemistry())
        case 11: goToQuize(quiz: QuizInformatics())
        case 12: goToQuize(quiz: QuizLiterature())
        case 13: goToQuize(quiz: QuizRoadTraffic())
        case 14: goToQuize(quiz: QuizSwift())
        case 15: goToQuize(quiz: QuizUnderwater())
        case 16: PresentRandomQuiz()
            
        default: break
        }
    }
    
    @objc func PresentRandomQuiz() {
        var randomindex = Int.random(in: 0..<quizes.count)
        var lastindex = Int.random(in: 0..<quizes.count)
        var random = quizes[randomindex]
        
        if lastindex == randomindex {
            print("first time?")
            print(randomindex)
            print(lastindex)
            goToQuize(quiz: random)
        } else {
            print("other quiz")
            print(randomindex)
            print(lastindex)
            goToQuize(quiz: random)
        }
        
    }
    
    func goToQuize(quiz: QuizBase) {
        DispatchQueue.main.async {
            guard let vc = self.storyboard?.instantiateViewController(identifier: "BaseQuizViewController") else {return}
            (vc as? BaseQuizViewController)?.setQuizeModel(quiz: quiz)
            guard let window = self.view.window else {return}
            window.rootViewController = vc
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
        
        cell.configure(categories[indexPath.row])
        
        
        return cell
    }
    
}

