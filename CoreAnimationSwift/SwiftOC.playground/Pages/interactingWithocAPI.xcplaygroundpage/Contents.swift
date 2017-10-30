//: [Previous](@previous)
/*:
 # swift与oc api相互调用
 */
/*:
 ## 初始化
 * oc中初始化方法init与initWith，在swift中转化后会直接被去掉
 * swift 中不需要调用alloc,swift会自动处理
 */
//in oc    :  UITableView *myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
//in swift :  let myTableView: UITableView = UITableView(frame: .zero, style: .grouped)

import Foundation
import UIKit
/*:
 ## 工厂方法及便利初始化
 * 为了一致性与简洁性，在swift中oc中的工厂方法被导入成便利初始化方法。
 */
//in oc : UIColor *color = [UIColor colorWithRed:0.5 green:0.0 blue:0.5 alpha:1.0];
//in swift: let color = UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0)
/*:
 ## 失败的初始化
  * oc init(),init!()代表初始化不会失败， oc init?()代表初始化可能失败
 */
if let image = UIImage(contentsOfFile: "MyImage.png") {
} else {
}
/*:
 ## 访问属性
 *
 */
/*:
 ## 对象比较swift
 * == 比较对象内容
 * === 比较对象指针是否指向同一块内存区
 */
//: [Next](@next)
