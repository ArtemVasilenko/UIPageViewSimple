//
//  MyPageViewController.swift
//  UIPageViewSimple
//
//  Created by Артем on 3/15/19.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController {
    
    private (set) lazy var orederedViewControllers: [UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RedVC"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GreenVC"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BlueVC"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OrangeVC")
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let firstVC = orederedViewControllers.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
            
            dataSource = self
            
        }
        
    }
}

extension MyPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orederedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previosIndex = viewControllerIndex - 1
        guard previosIndex >= 0 else { return nil }
        guard orederedViewControllers.count > previosIndex else { return nil }
        
        return orederedViewControllers[previosIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orederedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        guard nextIndex >= 0 else { return nil }
        guard orederedViewControllers.count != nextIndex else { return nil }
        guard orederedViewControllers.count > nextIndex else { return nil }
        
        return orederedViewControllers[nextIndex]
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orederedViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        
        guard let firstViewController = viewControllers?.first,
            let viewControllersIndex = self.orederedViewControllers.index(of: firstViewController)
            else {return 0}
        
        return viewControllersIndex
        
    }
    
}
