//
//  PrefixProtocolExtension.swift
//  BHXSwiftTool
//
//  Created by yit on 2020/9/3.
//  Copyright © 2020 baishuang. All rights reserved.
//

// 利用协议实现前缀效果 为了避免和系统的方法同名引起的错误 <核心代码 返回结构体 Base是用来做区分不同的类型>

struct BXH<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}
protocol BXHPrefixProtocolExtension {}
extension BXHPrefixProtocolExtension {
    // 添加类属性的 set是为了可以修改self里的内容
    static var bxh: BXH<Self>.Type {
        get { BXH<Self>.self }
        set {}
    }
    
    var bxh: BXH<Self> {
        get {BXH(self)}
        set {}
    }
}


//使用案例1 判断一个字符串中有多少个数字

extension String : BXHPrefixProtocolExtension{}
extension BXH where Base == String {
    func numberCount() -> Int {
        var count = 0
        for c in base where ("0"..."9").contains(c) {
            count += 1
        }
        return count
    }
}

//使用案例2  给类以及子类添加方法

class Person: BXHPrefixProtocolExtension {}

extension BXH where Base: Person {
    func run()  {
        print("\(self)run")
    }
    
    static func eat() {
        print("\(self)eat")
    }
}

class Student: Person {}
