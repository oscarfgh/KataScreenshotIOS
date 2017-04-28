//
//  SuperHeroDetailViewControllerTests.swift
//  KataSuperHeroes
//
//  Created by Sergio Gutiérrez on 22/12/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import UIKit
@testable import KataScreenshot

class SuperHeroDetailViewControllerTests: ScreenshotTest {

    fileprivate let repository = MockSuperHeroesRepository()

    func testShowsRegularSuperHero() {
        let superHero = givenASuperHero(isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)

        verify(viewController: viewController)
    }

    func testShowsAvengersSuperHeroe() {
        let superHero = givenASuperHero(isAvenger: true)

        let viewController = getSuperHeroDetailViewController(superHero.name)

        verify(viewController: viewController)
    }
    
    func testShowsSuperHeroLongName() {
        let superHero = givenASuperHeroLongName(isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }
    
    func testShowsSuperHeroLongDescription() {
        let superHero = givenASuperHeroLongDescription(isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }
    
    func testShowsSuperHeroWithoutName() {
        let superHero = givenASuperHeroWithoutName(isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }
    
    func testShowsSuperHeroWithoutDescription() {
        let superHero = givenASuperHeroWithoutDescription(isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController(superHero.name)
        
        verify(viewController: viewController)
    }

    func givenASuperHero(isAvenger: Bool) -> SuperHero {
        let superHero = SuperHeroMother.givenASuperHero(isAvenger: isAvenger)
        repository.superHeroes = [superHero]
        return superHero
    }
    
    func givenASuperHeroLongName(isAvenger: Bool) -> SuperHero {
        let superHero = SuperHeroMother.givenASuperHeroLongName(isAvenger: isAvenger)
        repository.superHeroes = [superHero]
        return superHero
    }
    
    func givenASuperHeroLongDescription(isAvenger: Bool) -> SuperHero {
        let superHero = SuperHeroMother.givenASuperHeroLongDescription(isAvenger: isAvenger)
        repository.superHeroes = [superHero]
        return superHero
    }
    
    func givenASuperHeroWithoutName(isAvenger: Bool) -> SuperHero {
        let superHero = SuperHeroMother.givenASuperHeroWithoutName(isAvenger: isAvenger)
        repository.superHeroes = [superHero]
        return superHero
    }
    
    func givenASuperHeroWithoutDescription(isAvenger: Bool) -> SuperHero {
        let superHero = SuperHeroMother.givenASuperHeroWithoutDescription(isAvenger: isAvenger)
        repository.superHeroes = [superHero]
        return superHero
    }
    

    fileprivate func getSuperHeroDetailViewController(_ superHeroName: String) -> UIViewController {
        let superHeroDetailViewController = ServiceLocator()
            .provideSuperHeroDetailViewController(superHeroName) as! SuperHeroDetailViewController
        superHeroDetailViewController.presenter = SuperHeroDetailPresenter(
            ui: superHeroDetailViewController,
            superHeroName: superHeroName,
            getSuperHeroByName: GetSuperHeroByName(repository: repository)
        )

        let rootViewController = UINavigationController()
        rootViewController.viewControllers = [superHeroDetailViewController]

        return rootViewController
    }
}
