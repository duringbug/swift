<!--
 * @Description: 
 * @Author: 唐健峰
 * @Date: 2023-09-07 15:57:42
 * @LastEditors: ${author}
 * @LastEditTime: 2023-09-08 17:47:30
-->
# ios系统中swift的简单使用
## 项目初始化
假设已经可以使用swift
尝试
```bash
swift --version
```
出现类似
```bash
swift-driver version: 1.62.15 Apple Swift version 5.7.2 (swiftlang-5.7.2.135.5 clang-1400.0.29.51)
Target: arm64-apple-macosx12.0
```
说明可以正常使用
**项目初始化:**
```bash
swift package init --type executable
```
<small>
在初始化包时选择了 --type executable，那么默认会创建一个包含可执行目标的项目。如果没有可执行目标，你需要在 Package.swift 文件中创建一个，并确保它包含了你的程序入口点。
</small><br/><br/>

会生成.build、Source、Tests、.gitignore、Package.swift文件

## 运行
在终端中，导航到你的包的根目录，即包含 Package.swift 文件的目录。
```bash
swift build
```
一旦构建成功，你可以使用以下命令来运行你的 Swift 可执行程序：
```bash
.build/debug/你的可执行文件名
```
**"你的可执行文件名"一般是根目录文件夹的名字**

## swift
### 编译过程:swiftc
输入
```bash
swiftc -v
```
显示
```bash
Apple Swift version 5.7.2 (swiftlang-5.7.2.135.5 clang-1400.0.29.51)
Target: arm64-apple-macosx12.0
```
![LLVM](https://img-blog.csdnimg.cn/2a000d2d64cc404999b5c60553d26a2e.png#pic_center)

#### swiftc -o
文件:./TestSwiftc.swift
```swift
public struct MyApp {
    public private(set) var text = "Hello, World!"

    public static func main() {
        print(MyApp().text)
    }
}
MyApp.main() 
```
```bash
swiftc -o TestSwiftc.out TestSwiftc.swift
```
生成一个TestSwiftc.out字，这个就是可执行文件
```bash
./TestSwiftc.out
```
```bash
Hello, World!
```
#### swiftc -dump-ast
```bash
swiftc TestSwiftc.swift -dump-ast
```
<small style="color:red"><em>swiftc -dump-ast 是 Swift 编译器（swiftc）的一个命令，用于将 Swift 源代码文件转换为其抽象语法树（AST）的文本表示并输出到标准输出。AST 是编译器在编译源代码时使用的内部数据结构，它表示了源代码的结构和语法。

当运行 swiftc -dump-ast 命令时，它会读取指定的 Swift 源代码文件（例如 TestSwiftc.swift），将其编译成 AST 并显示在终端上。这可以帮助更深入地了解 Swift 编译器如何解析和理解你的代码，以及代码的结构是如何映射到 AST 中的。

请注意，-dump-ast 命令主要用于调试和学习目的，通常不会在生产环境中使用。它有助于开发者深入了解编译器内部的工作原理和代码解析过程。</em></small>

```bash
tangjianfeng@tangjianfengdeMacBook-Air MyApp % swiftc TestSwiftc.swift -dump-ast
(source_file "TestSwiftc.swift"
  (struct_decl range=[TestSwiftc.swift:1:8 - line:7:1] "MyApp" interface type='MyApp.Type' access=public non-resilient
    (pattern_binding_decl range=[TestSwiftc.swift:2:25 - line:2:36]
      (pattern_named type='String' 'text')
      Original init:
      (string_literal_expr type='String' location=TestSwiftc.swift:2:36 range=[TestSwiftc.swift:2:36 - line:2:36] encoding=utf8 value="Hello, World!" builtin_initializer=Swift.(file).String extension.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:) initializer=**NULL**)
      Processed init:
      (string_literal_expr type='String' location=TestSwiftc.swift:2:36 range=[TestSwiftc.swift:2:36 - line:2:36] encoding=utf8 value="Hello, World!" builtin_initializer=Swift.(file).String extension.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:) initializer=**NULL**))
    (var_decl range=[TestSwiftc.swift:2:29 - line:2:29] "text" type='String' interface type='String' access=public readImpl=stored writeImpl=stored readWriteImpl=stored
      (accessor_decl implicit range=[TestSwiftc.swift:2:29 - line:2:29] 'anonname=0x11f8a4100' interface type='(MyApp) -> () -> String' access=public get_for=text
        (parameter "self" type='MyApp' interface type='MyApp')
        (parameter_list)
        (brace_stmt implicit range=[TestSwiftc.swift:2:29 - line:2:29]
          (return_stmt implicit
            (member_ref_expr implicit type='String' decl=TestSwiftc.(file).MyApp.text@TestSwiftc.swift:2:29 direct_to_storage
              (declref_expr implicit type='MyApp' decl=TestSwiftc.(file).MyApp.<anonymous>.self@TestSwiftc.swift:2:29 function_ref=unapplied)))))
      (accessor_decl implicit range=[TestSwiftc.swift:2:29 - line:2:29] 'anonname=0x11f8a4360' interface type='(inout MyApp) -> (String) -> ()' access=private set_for=text
        (parameter "self" type='MyApp' interface type='MyApp')
        (parameter_list range=[TestSwiftc.swift:2:29 - line:2:29]
          (parameter "value" type='String' interface type='String'))
        (brace_stmt implicit range=[TestSwiftc.swift:2:29 - line:2:29]
          (assign_expr implicit type='()'
            (member_ref_expr implicit type='@lvalue String' decl=TestSwiftc.(file).MyApp.text@TestSwiftc.swift:2:29 direct_to_storage
              (declref_expr implicit type='@lvalue MyApp' decl=TestSwiftc.(file).MyApp.<anonymous>.self@TestSwiftc.swift:2:29 function_ref=unapplied))
            (declref_expr implicit type='String' decl=TestSwiftc.(file).MyApp.<anonymous>.value@TestSwiftc.swift:2:29 function_ref=unapplied))))
      (accessor_decl implicit range=[TestSwiftc.swift:2:29 - line:2:29] 'anonname=0x11f8a4528' interface type='(inout MyApp) -> () -> ()' access=private _modify_for=text
        (parameter "self" type='MyApp' interface type='MyApp')
        (parameter_list)
        (brace_stmt implicit range=[TestSwiftc.swift:2:29 - line:2:29]
          (yield_stmt implicit range=[TestSwiftc.swift:2:29 - line:2:29]
            (inout_expr implicit type='inout String'
              (member_ref_expr implicit type='@lvalue String' decl=TestSwiftc.(file).MyApp.text@TestSwiftc.swift:2:29 direct_to_impl
                (declref_expr implicit type='@lvalue MyApp' decl=TestSwiftc.(file).MyApp.<anonymous>.self@TestSwiftc.swift:2:29 function_ref=unapplied)))))))
    (func_decl range=[TestSwiftc.swift:4:12 - line:6:5] "main()" interface type='(MyApp.Type) -> () -> ()' access=public type
      (parameter "self")
      (parameter_list range=[TestSwiftc.swift:4:28 - line:4:29])
      (call_expr type='()' location=TestSwiftc.swift:5:9 range=[TestSwiftc.swift:5:9 - line:5:27] nothrow
        (declref_expr type='(Any..., String, String) -> ()' location=TestSwiftc.swift:5:9 range=[TestSwiftc.swift:5:9 - line:5:9] decl=Swift.(file).print(_:separator:terminator:) function_ref=single)
        (argument_list labels=_:separator:terminator:
          (argument
            (vararg_expansion_expr implicit type='Any...' location=TestSwiftc.swift:5:15 range=[TestSwiftc.swift:5:15 - line:5:23]
              (array_expr implicit type='Any...' location=TestSwiftc.swift:5:15 range=[TestSwiftc.swift:5:15 - line:5:23] initializer=**NULL**
                (erasure_expr implicit type='Any' location=TestSwiftc.swift:5:23 range=[TestSwiftc.swift:5:15 - line:5:23]
                  (member_ref_expr type='String' location=TestSwiftc.swift:5:23 range=[TestSwiftc.swift:5:15 - line:5:23] decl=TestSwiftc.(file).MyApp.text@TestSwiftc.swift:2:29
                    (call_expr type='MyApp' location=TestSwiftc.swift:5:15 range=[TestSwiftc.swift:5:15 - line:5:21] nothrow
                      (constructor_ref_call_expr type='() -> MyApp' location=TestSwiftc.swift:5:15 range=[TestSwiftc.swift:5:15 - line:5:15] nothrow
                        (declref_expr implicit type='(MyApp.Type) -> () -> MyApp' location=TestSwiftc.swift:5:15 range=[TestSwiftc.swift:5:15 - line:5:15] decl=TestSwiftc.(file).MyApp.init()@TestSwiftc.swift:1:15 function_ref=single)
                        (argument_list implicit
                          (argument
                            (type_expr type='MyApp.Type' location=TestSwiftc.swift:5:15 range=[TestSwiftc.swift:5:15 - line:5:15] typerepr='MyApp'))
                        ))
                      (argument_list)))))))
          (argument label=separator
            (default_argument_expr implicit type='String' location=TestSwiftc.swift:5:14 range=[TestSwiftc.swift:5:14 - line:5:14] default_args_owner=Swift.(file).print(_:separator:terminator:) param=1))
          (argument label=terminator
            (default_argument_expr implicit type='String' location=TestSwiftc.swift:5:14 range=[TestSwiftc.swift:5:14 - line:5:14] default_args_owner=Swift.(file).print(_:separator:terminator:) param=2))
        )))
    (constructor_decl implicit range=[TestSwiftc.swift:1:15 - line:1:15] "init(text:)" interface type='(MyApp.Type) -> (String) -> MyApp' access=internal designated
      (parameter "self")
      (parameter_list range=[TestSwiftc.swift:1:15 - line:1:15]
        (parameter "text" apiName=text type='String' interface type='String' default_arg=stored property)))
    (constructor_decl implicit range=[TestSwiftc.swift:1:15 - line:1:15] "init()" interface type='(MyApp.Type) -> () -> MyApp' access=internal designated
      (parameter "self")
      (parameter_list)
      (brace_stmt implicit range=[TestSwiftc.swift:1:15 - line:1:15]
        (return_stmt range=[TestSwiftc.swift:1:15 - line:1:15]))))
  (top_level_code_decl range=[TestSwiftc.swift:8:1 - line:8:12]
    (brace_stmt implicit range=[TestSwiftc.swift:8:1 - line:8:12]
      (call_expr type='()' location=TestSwiftc.swift:8:7 range=[TestSwiftc.swift:8:1 - line:8:12] nothrow
        (dot_syntax_call_expr type='() -> ()' location=TestSwiftc.swift:8:7 range=[TestSwiftc.swift:8:1 - line:8:7] nothrow
          (declref_expr type='(MyApp.Type) -> () -> ()' location=TestSwiftc.swift:8:7 range=[TestSwiftc.swift:8:7 - line:8:7] decl=TestSwiftc.(file).MyApp.main()@TestSwiftc.swift:4:24 function_ref=single)
          (argument_list implicit
            (argument
              (type_expr type='MyApp.Type' location=TestSwiftc.swift:8:1 range=[TestSwiftc.swift:8:1 - line:8:1] typerepr='MyApp'))
          ))
        (argument_list)))))
```
#### swiftc -emit-sil
```bash
swiftc TestSwiftc.swift -emit-sil
```
<small style="color:red"><em>
swift TestSwiftc.swift -emit-sil 是一个用于生成 Swift 中间表示（Swift Intermediate Language，简称 SIL）的命令。SIL 是一种低级的中间表示，用于表示 Swift 代码的抽象语法树（AST）经过类型检查和优化后的形式。它在 Swift 编译器内部用于执行许多优化和代码生成任务。

使用 -emit-sil 选项运行 Swift 编译器时，它会编译指定的 Swift 源代码文件（例如 TestSwiftc.swift）并输出生成的 SIL 代码。这个命令通常用于分析 Swift 代码的内部表示，以便开发者深入了解编译器的优化过程、代码生成过程以及诊断性能问题。

生成的 SIL 代码可以非常详细，包括函数、变量、操作和控制流等信息，因此它对于理解代码的执行过程和性能瓶颈非常有用。但需要注意的是，SIL 是 Swift 编译器的内部表示，与普通的 Swift 代码语法不同，因此它可能看起来比较复杂。

总之，swift -emit-sil 是一个用于生成 Swift 中间表示（SIL）的命令，通常用于调试、性能分析和深入了解 Swift 代码的编译过程。
</em></small>

```bash
tangjianfeng@tangjianfengdeMacBook-Air MyApp % swiftc TestSwiftc.swift -emit-sil 
sil_stage canonical

import Builtin
import Swift
import SwiftShims

public struct MyApp {
  @_hasStorage @_hasInitialValue public private(set) var text: String { get set }
  public static func main()
  init()
  init(text: String = "Hello, World!")
}

// main
sil @main : $@convention(c) (Int32, UnsafeMutablePointer<Optional<UnsafeMutablePointer<Int8>>>) -> Int32 {
bb0(%0 : $Int32, %1 : $UnsafeMutablePointer<Optional<UnsafeMutablePointer<Int8>>>):
  %2 = metatype $@thin MyApp.Type                 // user: %4
  // function_ref static MyApp.main()
  %3 = function_ref @$s10TestSwiftc5MyAppV4mainyyFZ : $@convention(method) (@thin MyApp.Type) -> () // user: %4
  %4 = apply %3(%2) : $@convention(method) (@thin MyApp.Type) -> ()
  %5 = integer_literal $Builtin.Int32, 0          // user: %6
  %6 = struct $Int32 (%5 : $Builtin.Int32)        // user: %7
  return %6 : $Int32                              // id: %7
} // end sil function 'main'

// variable initialization expression of MyApp.text
sil [transparent] @$s10TestSwiftc5MyAppV4textSSvpfi : $@convention(thin) () -> @owned String {
bb0:
  %0 = string_literal utf8 "Hello, World!"        // user: %5
  %1 = integer_literal $Builtin.Word, 13          // user: %5
  %2 = integer_literal $Builtin.Int1, -1          // user: %5
  %3 = metatype $@thin String.Type                // user: %5
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %4 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %5
  %5 = apply %4(%0, %1, %2, %3) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %6
  return %5 : $String                             // id: %6
} // end sil function '$s10TestSwiftc5MyAppV4textSSvpfi'

// String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
sil [always_inline] [readonly] [_semantics "string.makeUTF8"] @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String

// MyApp.text.getter
sil [transparent] @$s10TestSwiftc5MyAppV4textSSvg : $@convention(method) (@guaranteed MyApp) -> @owned String {
// %0 "self"                                      // users: %2, %1
bb0(%0 : $MyApp):
  debug_value %0 : $MyApp, let, name "self", argno 1, implicit // id: %1
  %2 = struct_extract %0 : $MyApp, #MyApp.text    // users: %4, %3
  retain_value %2 : $String                       // id: %3
  return %2 : $String                             // id: %4
} // end sil function '$s10TestSwiftc5MyAppV4textSSvg'

// MyApp.text.setter
sil hidden [transparent] @$s10TestSwiftc5MyAppV4textSSvs : $@convention(method) (@owned String, @inout MyApp) -> () {
// %0 "value"                                     // users: %11, %8, %4, %2
// %1 "self"                                      // users: %5, %3
bb0(%0 : $String, %1 : $*MyApp):
  debug_value %0 : $String, let, name "value", argno 1, implicit // id: %2
  debug_value %1 : $*MyApp, var, name "self", argno 2, implicit, expr op_deref // id: %3
  retain_value %0 : $String                       // id: %4
  %5 = begin_access [modify] [static] %1 : $*MyApp // users: %10, %6
  %6 = struct_element_addr %5 : $*MyApp, #MyApp.text // users: %8, %7
  %7 = load %6 : $*String                         // user: %9
  store %0 to %6 : $*String                       // id: %8
  release_value %7 : $String                      // id: %9
  end_access %5 : $*MyApp                         // id: %10
  release_value %0 : $String                      // id: %11
  %12 = tuple ()                                  // user: %13
  return %12 : $()                                // id: %13
} // end sil function '$s10TestSwiftc5MyAppV4textSSvs'

// static MyApp.main()
sil @$s10TestSwiftc5MyAppV4mainyyFZ : $@convention(method) (@thin MyApp.Type) -> () {
// %0 "self"                                      // users: %9, %1
bb0(%0 : $@thin MyApp.Type):
  debug_value %0 : $@thin MyApp.Type, let, name "self", argno 1, implicit // id: %1
  %2 = integer_literal $Builtin.Word, 1           // user: %4
  // function_ref _allocateUninitializedArray<A>(_:)
  %3 = function_ref @$ss27_allocateUninitializedArrayySayxG_BptBwlF : $@convention(thin) <τ_0_0> (Builtin.Word) -> (@owned Array<τ_0_0>, Builtin.RawPointer) // user: %4
  %4 = apply %3<Any>(%2) : $@convention(thin) <τ_0_0> (Builtin.Word) -> (@owned Array<τ_0_0>, Builtin.RawPointer) // users: %6, %5
  %5 = tuple_extract %4 : $(Array<Any>, Builtin.RawPointer), 0 // user: %16
  %6 = tuple_extract %4 : $(Array<Any>, Builtin.RawPointer), 1 // user: %7
  %7 = pointer_to_address %6 : $Builtin.RawPointer to [strict] $*Any // user: %13
  // function_ref MyApp.init()
  %8 = function_ref @$s10TestSwiftc5MyAppVACycfC : $@convention(method) (@thin MyApp.Type) -> @owned MyApp // user: %9
  %9 = apply %8(%0) : $@convention(method) (@thin MyApp.Type) -> @owned MyApp // users: %12, %10
  %10 = struct_extract %9 : $MyApp, #MyApp.text   // users: %14, %11
  retain_value %10 : $String                      // id: %11
  release_value %9 : $MyApp                       // id: %12
  %13 = init_existential_addr %7 : $*Any, $String // user: %14
  store %10 to %13 : $*String                     // id: %14
  // function_ref _finalizeUninitializedArray<A>(_:)
  %15 = function_ref @$ss27_finalizeUninitializedArrayySayxGABnlF : $@convention(thin) <τ_0_0> (@owned Array<τ_0_0>) -> @owned Array<τ_0_0> // user: %16
  %16 = apply %15<Any>(%5) : $@convention(thin) <τ_0_0> (@owned Array<τ_0_0>) -> @owned Array<τ_0_0> // users: %25, %22
  // function_ref default argument 1 of print(_:separator:terminator:)
  %17 = function_ref @$ss5print_9separator10terminatoryypd_S2StFfA0_ : $@convention(thin) () -> @owned String // user: %18
  %18 = apply %17() : $@convention(thin) () -> @owned String // users: %24, %22
  // function_ref default argument 2 of print(_:separator:terminator:)
  %19 = function_ref @$ss5print_9separator10terminatoryypd_S2StFfA1_ : $@convention(thin) () -> @owned String // user: %20
  %20 = apply %19() : $@convention(thin) () -> @owned String // users: %23, %22
  // function_ref print(_:separator:terminator:)
  %21 = function_ref @$ss5print_9separator10terminatoryypd_S2StF : $@convention(thin) (@guaranteed Array<Any>, @guaranteed String, @guaranteed String) -> () // user: %22
  %22 = apply %21(%16, %18, %20) : $@convention(thin) (@guaranteed Array<Any>, @guaranteed String, @guaranteed String) -> ()
  release_value %20 : $String                     // id: %23
  release_value %18 : $String                     // id: %24
  release_value %16 : $Array<Any>                 // id: %25
  %26 = tuple ()                                  // user: %27
  return %26 : $()                                // id: %27
} // end sil function '$s10TestSwiftc5MyAppV4mainyyFZ'

// _allocateUninitializedArray<A>(_:)
sil [always_inline] [_semantics "array.uninitialized_intrinsic"] @$ss27_allocateUninitializedArrayySayxG_BptBwlF : $@convention(thin) <τ_0_0> (Builtin.Word) -> (@owned Array<τ_0_0>, Builtin.RawPointer)

// MyApp.init()
sil hidden @$s10TestSwiftc5MyAppVACycfC : $@convention(method) (@thin MyApp.Type) -> @owned MyApp {
// %0 "$metatype"
bb0(%0 : $@thin MyApp.Type):
  %1 = alloc_stack [lexical] $MyApp, var, name "self", implicit // users: %10, %11, %12
  %2 = string_literal utf8 "Hello, World!"        // user: %7
  %3 = integer_literal $Builtin.Word, 13          // user: %7
  %4 = integer_literal $Builtin.Int1, -1          // user: %7
  %5 = metatype $@thin String.Type                // user: %7
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %6 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %7
  %7 = apply %6(%2, %3, %4, %5) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %8
  %8 = struct $MyApp (%7 : $String)               // users: %10, %13, %9
  retain_value %8 : $MyApp                        // id: %9
  store %8 to %1 : $*MyApp                        // id: %10
  destroy_addr %1 : $*MyApp                       // id: %11
  dealloc_stack %1 : $*MyApp                      // id: %12
  return %8 : $MyApp                              // id: %13
} // end sil function '$s10TestSwiftc5MyAppVACycfC'

// _finalizeUninitializedArray<A>(_:)
sil shared [readnone] [_semantics "array.finalize_intrinsic"] @$ss27_finalizeUninitializedArrayySayxGABnlF : $@convention(thin) <Element> (@owned Array<Element>) -> @owned Array<Element> {
// %0                                             // user: %2
bb0(%0 : $Array<Element>):
  %1 = alloc_stack $Array<Element>                // users: %6, %5, %4, %2
  store %0 to %1 : $*Array<Element>               // id: %2
  // function_ref Array._endMutation()
  %3 = function_ref @$sSa12_endMutationyyF : $@convention(method) <τ_0_0> (@inout Array<τ_0_0>) -> () // user: %4
  %4 = apply %3<Element>(%1) : $@convention(method) <τ_0_0> (@inout Array<τ_0_0>) -> ()
  %5 = load %1 : $*Array<Element>                 // user: %7
  dealloc_stack %1 : $*Array<Element>             // id: %6
  return %5 : $Array<Element>                     // id: %7
} // end sil function '$ss27_finalizeUninitializedArrayySayxGABnlF'

// default argument 1 of print(_:separator:terminator:)
sil shared @$ss5print_9separator10terminatoryypd_S2StFfA0_ : $@convention(thin) () -> @owned String {
bb0:
  %0 = string_literal utf8 " "                    // user: %5
  %1 = integer_literal $Builtin.Word, 1           // user: %5
  %2 = integer_literal $Builtin.Int1, -1          // user: %5
  %3 = metatype $@thin String.Type                // user: %5
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %4 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %5
  %5 = apply %4(%0, %1, %2, %3) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %6
  return %5 : $String                             // id: %6
} // end sil function '$ss5print_9separator10terminatoryypd_S2StFfA0_'

// default argument 2 of print(_:separator:terminator:)
sil shared @$ss5print_9separator10terminatoryypd_S2StFfA1_ : $@convention(thin) () -> @owned String {
bb0:
  %0 = string_literal utf8 "\n"                   // user: %5
  %1 = integer_literal $Builtin.Word, 1           // user: %5
  %2 = integer_literal $Builtin.Int1, -1          // user: %5
  %3 = metatype $@thin String.Type                // user: %5
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %4 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %5
  %5 = apply %4(%0, %1, %2, %3) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %6
  return %5 : $String                             // id: %6
} // end sil function '$ss5print_9separator10terminatoryypd_S2StFfA1_'

// print(_:separator:terminator:)
sil @$ss5print_9separator10terminatoryypd_S2StF : $@convention(thin) (@guaranteed Array<Any>, @guaranteed String, @guaranteed String) -> ()

// default argument 0 of MyApp.init(text:)
sil hidden @$s10TestSwiftc5MyAppV4textACSS_tcfcfA_ : $@convention(thin) () -> @owned String {
bb0:
  %0 = string_literal utf8 "Hello, World!"        // user: %5
  %1 = integer_literal $Builtin.Word, 13          // user: %5
  %2 = integer_literal $Builtin.Int1, -1          // user: %5
  %3 = metatype $@thin String.Type                // user: %5
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %4 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %5
  %5 = apply %4(%0, %1, %2, %3) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %6
  return %5 : $String                             // id: %6
} // end sil function '$s10TestSwiftc5MyAppV4textACSS_tcfcfA_'

// MyApp.init(text:)
sil hidden @$s10TestSwiftc5MyAppV4textACSS_tcfC : $@convention(method) (@owned String, @thin MyApp.Type) -> @owned MyApp {
// %0 "$implicit_value"                           // user: %2
// %1 "$metatype"
bb0(%0 : $String, %1 : $@thin MyApp.Type):
  %2 = struct $MyApp (%0 : $String)               // user: %3
  return %2 : $MyApp                              // id: %3
} // end sil function '$s10TestSwiftc5MyAppV4textACSS_tcfC'

// Array._endMutation()
sil shared [_semantics "array.end_mutation"] @$sSa12_endMutationyyF : $@convention(method) <Element> (@inout Array<Element>) -> () {
// %0                                             // users: %9, %1
bb0(%0 : $*Array<Element>):
  %1 = struct_element_addr %0 : $*Array<Element>, #Array._buffer // user: %2
  %2 = struct_element_addr %1 : $*_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %3
  %3 = struct_element_addr %2 : $*_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // user: %4
  %4 = load %3 : $*Builtin.BridgeObject           // user: %5
  %5 = end_cow_mutation %4 : $Builtin.BridgeObject // user: %6
  %6 = struct $_BridgeStorage<__ContiguousArrayStorageBase> (%5 : $Builtin.BridgeObject) // user: %7
  %7 = struct $_ArrayBuffer<Element> (%6 : $_BridgeStorage<__ContiguousArrayStorageBase>) // user: %8
  %8 = struct $Array<Element> (%7 : $_ArrayBuffer<Element>) // user: %9
  store %8 to %0 : $*Array<Element>               // id: %9
  %10 = tuple ()                                  // user: %11
  return %10 : $()                                // id: %11
} // end sil function '$sSa12_endMutationyyF'

sil_property #MyApp.text ()


// Mappings from '#fileID' to '#filePath':
//   'TestSwiftc/TestSwiftc.swift' => 'TestSwiftc.swift'


```
#### swiftc -emit-ir
```bash
swiftc TestSwiftc.swift -emit-ir
```
<small style="color:red"><em>当你运行 swiftc TestSwiftc.swift -emit-ir 命令时，它会将指定的 Swift 源代码文件（例如 TestSwiftc.swift）编译成 LLVM IR，并输出生成的 LLVM IR 代码。这个命令通常用于了解 Swift 代码在编译器中的转换过程，以及进行与 LLVM 相关的性能分析。

生成的 LLVM IR 代码是针对 LLVM 编译器和优化器的，可以通过 LLVM 工具链进一步编译成目标机器代码。这使得 LLVM IR 代码可以用于探索 Swift 代码的底层实现细节，以及进行性能分析和优化。

需要注意的是，LLVM IR 是一种低级表示，通常比 Swift 代码更复杂和难以阅读。因此，这个命令主要用于高级用户、编译器开发者和需要深入了解编译过程的人员，而不是一般的应用程序开发者。</em></small>
```bash
tangjianfeng@tangjianfengdeMacBook-Air MyApp % swiftc TestSwiftc.swift -emit-ir
; ModuleID = '<swift-imported-modules>'
source_filename = "<swift-imported-modules>"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx12.0.0"

%swift.full_type = type { i8**, %swift.type }
%swift.type = type { i64 }
%swift.vwtable = type { i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i64, i64, i32, i32 }
%swift.type_metadata_record = type { i32 }
%swift.bridge = type opaque
%T10TestSwiftc5MyAppV = type <{ %TSS }>
%TSS = type <{ %Ts11_StringGutsV }>
%Ts11_StringGutsV = type <{ %Ts13_StringObjectV }>
%Ts13_StringObjectV = type <{ %Ts6UInt64V, %swift.bridge* }>
%Ts6UInt64V = type <{ i64 }>
%Any = type { [24 x i8], %swift.type* }
%TSa = type <{ %Ts12_ArrayBufferV }>
%Ts12_ArrayBufferV = type <{ %Ts14_BridgeStorageV }>
%Ts14_BridgeStorageV = type <{ %swift.bridge* }>
%swift.metadata_response = type { %swift.type*, i64 }
%swift.opaque = type opaque

@.str = private unnamed_addr constant [14 x i8] c"Hello, World!\00"
@"$sypN" = external global %swift.full_type
@"$sSSN" = external global %swift.type, align 8
@"$s10TestSwiftc5MyAppV4textSSvpMV" = unnamed_addr constant { i32 } zeroinitializer, align 4
@"\01l_entry_point" = private constant { i32 } { i32 trunc (i64 sub (i64 ptrtoint (i32 (i32, i8**)* @main to i64), i64 ptrtoint ({ i32 }* @"\01l_entry_point" to i64)) to i32) }, section "__TEXT, __swift5_entry, regular, no_dead_strip", align 4
@"$s10TestSwiftc5MyAppVWV" = internal constant %swift.vwtable { i8* bitcast (%swift.opaque* ([24 x i8]*, [24 x i8]*, %swift.type*)* @"$s10TestSwiftc5MyAppVwCP" to i8*), i8* bitcast (void (%swift.opaque*, %swift.type*)* @"$s10TestSwiftc5MyAppVwxx" to i8*), i8* bitcast (%swift.opaque* (%swift.opaque*, %swift.opaque*, %swift.type*)* @"$s10TestSwiftc5MyAppVwcp" to i8*), i8* bitcast (%swift.opaque* (%swift.opaque*, %swift.opaque*, %swift.type*)* @"$s10TestSwiftc5MyAppVwca" to i8*), i8* bitcast (i8* (i8*, i8*, %swift.type*)* @__swift_memcpy16_8 to i8*), i8* bitcast (%swift.opaque* (%swift.opaque*, %swift.opaque*, %swift.type*)* @"$s10TestSwiftc5MyAppVwta" to i8*), i8* bitcast (i32 (%swift.opaque*, i32, %swift.type*)* @"$s10TestSwiftc5MyAppVwet" to i8*), i8* bitcast (void (%swift.opaque*, i32, i32, %swift.type*)* @"$s10TestSwiftc5MyAppVwst" to i8*), i64 16, i64 16, i32 65543, i32 2147483647 }, align 8
@.str.1 = private constant [11 x i8] c"TestSwiftc\00"
@"$s10TestSwiftcMXM" = linkonce_odr hidden constant <{ i32, i32, i32 }> <{ i32 0, i32 0, i32 trunc (i64 sub (i64 ptrtoint ([11 x i8]* @.str.1 to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32 }>, <{ i32, i32, i32 }>* @"$s10TestSwiftcMXM", i32 0, i32 2) to i64)) to i32) }>, section "__TEXT,__const", align 4
@.str.2 = private constant [6 x i8] c"MyApp\00"
@"$s10TestSwiftc5MyAppVMn" = constant <{ i32, i32, i32, i32, i32, i32, i32 }> <{ i32 81, i32 trunc (i64 sub (i64 ptrtoint (<{ i32, i32, i32 }>* @"$s10TestSwiftcMXM" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32 }>, <{ i32, i32, i32, i32, i32, i32, i32 }>* @"$s10TestSwiftc5MyAppVMn", i32 0, i32 1) to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint ([6 x i8]* @.str.2 to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32 }>, <{ i32, i32, i32, i32, i32, i32, i32 }>* @"$s10TestSwiftc5MyAppVMn", i32 0, i32 2) to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint (%swift.metadata_response (i64)* @"$s10TestSwiftc5MyAppVMa" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32 }>, <{ i32, i32, i32, i32, i32, i32, i32 }>* @"$s10TestSwiftc5MyAppVMn", i32 0, i32 3) to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint ({ i32, i32, i16, i16, i32, i32, i32, i32 }* @"$s10TestSwiftc5MyAppVMF" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i32, i32, i32, i32, i32, i32, i32 }>, <{ i32, i32, i32, i32, i32, i32, i32 }>* @"$s10TestSwiftc5MyAppVMn", i32 0, i32 4) to i64)) to i32), i32 1, i32 2 }>, section "__TEXT,__const", align 4
@"$s10TestSwiftc5MyAppVMf" = internal constant <{ i8**, i64, <{ i32, i32, i32, i32, i32, i32, i32 }>*, i32, [4 x i8] }> <{ i8** getelementptr inbounds (%swift.vwtable, %swift.vwtable* @"$s10TestSwiftc5MyAppVWV", i32 0, i32 0), i64 512, <{ i32, i32, i32, i32, i32, i32, i32 }>* @"$s10TestSwiftc5MyAppVMn", i32 0, [4 x i8] zeroinitializer }>, align 8
@"symbolic _____ 10TestSwiftc5MyAppV" = linkonce_odr hidden constant <{ i8, i32, i8 }> <{ i8 1, i32 trunc (i64 sub (i64 ptrtoint (<{ i32, i32, i32, i32, i32, i32, i32 }>* @"$s10TestSwiftc5MyAppVMn" to i64), i64 ptrtoint (i32* getelementptr inbounds (<{ i8, i32, i8 }>, <{ i8, i32, i8 }>* @"symbolic _____ 10TestSwiftc5MyAppV", i32 0, i32 1) to i64)) to i32), i8 0 }>, section "__TEXT,__swift5_typeref, regular", align 2
@"symbolic SS" = linkonce_odr hidden constant <{ [2 x i8], i8 }> <{ [2 x i8] c"SS", i8 0 }>, section "__TEXT,__swift5_typeref, regular", align 2
@0 = private constant [5 x i8] c"text\00", section "__TEXT,__swift5_reflstr, regular"
@"$s10TestSwiftc5MyAppVMF" = internal constant { i32, i32, i16, i16, i32, i32, i32, i32 } { i32 trunc (i64 sub (i64 ptrtoint (<{ i8, i32, i8 }>* @"symbolic _____ 10TestSwiftc5MyAppV" to i64), i64 ptrtoint ({ i32, i32, i16, i16, i32, i32, i32, i32 }* @"$s10TestSwiftc5MyAppVMF" to i64)) to i32), i32 0, i16 0, i16 12, i32 1, i32 2, i32 trunc (i64 sub (i64 ptrtoint (<{ [2 x i8], i8 }>* @"symbolic SS" to i64), i64 ptrtoint (i32* getelementptr inbounds ({ i32, i32, i16, i16, i32, i32, i32, i32 }, { i32, i32, i16, i16, i32, i32, i32, i32 }* @"$s10TestSwiftc5MyAppVMF", i32 0, i32 6) to i64)) to i32), i32 trunc (i64 sub (i64 ptrtoint ([5 x i8]* @0 to i64), i64 ptrtoint (i32* getelementptr inbounds ({ i32, i32, i16, i16, i32, i32, i32, i32 }, { i32, i32, i16, i16, i32, i32, i32, i32 }* @"$s10TestSwiftc5MyAppVMF", i32 0, i32 7) to i64)) to i32) }, section "__TEXT,__swift5_fieldmd, regular", align 4
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00"
@.str.4 = private unnamed_addr constant [2 x i8] c" \00"
@"$s10TestSwiftc5MyAppVHn" = private constant %swift.type_metadata_record { i32 trunc (i64 sub (i64 ptrtoint (<{ i32, i32, i32, i32, i32, i32, i32 }>* @"$s10TestSwiftc5MyAppVMn" to i64), i64 ptrtoint (%swift.type_metadata_record* @"$s10TestSwiftc5MyAppVHn" to i64)) to i32) }, section "__TEXT, __swift5_types, regular", align 4
@__swift_reflection_version = linkonce_odr hidden constant i16 3
@llvm.used = appending global [12 x i8*] [i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* bitcast ({ i64, %swift.bridge* } ()* @"$s10TestSwiftc5MyAppV4textSSvpfi" to i8*), i8* bitcast ({ i64, %swift.bridge* } (i64, %swift.bridge*)* @"$s10TestSwiftc5MyAppV4textSSvg" to i8*), i8* bitcast (void ()* @"$s10TestSwiftc5MyAppV4mainyyFZ" to i8*), i8* bitcast ({ i32 }* @"$s10TestSwiftc5MyAppV4textSSvpMV" to i8*), i8* bitcast ({ i32 }* @"\01l_entry_point" to i8*), i8* bitcast (<{ i32, i32, i32, i32, i32, i32, i32 }>* @"$s10TestSwiftc5MyAppVMn" to i8*), i8* bitcast (%swift.metadata_response (i64)* @"$s10TestSwiftc5MyAppVMa" to i8*), i8* bitcast (%swift.type* @"$s10TestSwiftc5MyAppVN" to i8*), i8* bitcast ({ i32, i32, i16, i16, i32, i32, i32, i32 }* @"$s10TestSwiftc5MyAppVMF" to i8*), i8* bitcast (%swift.type_metadata_record* @"$s10TestSwiftc5MyAppVHn" to i8*), i8* bitcast (i16* @__swift_reflection_version to i8*)], section "llvm.metadata"

@"$s10TestSwiftc5MyAppVN" = alias %swift.type, bitcast (i64* getelementptr inbounds (<{ i8**, i64, <{ i32, i32, i32, i32, i32, i32, i32 }>*, i32, [4 x i8] }>, <{ i8**, i64, <{ i32, i32, i32, i32, i32, i32, i32 }>*, i32, [4 x i8] }>* @"$s10TestSwiftc5MyAppVMf", i32 0, i32 1) to %swift.type*)

define i32 @main(i32 %0, i8** %1) #0 {
entry:
  %2 = bitcast i8** %1 to i8*
  call swiftcc void @"$s10TestSwiftc5MyAppV4mainyyFZ"()
  ret i32 0
}

define swiftcc { i64, %swift.bridge* } @"$s10TestSwiftc5MyAppV4textSSvpfi"() #0 {
entry:
  %0 = call swiftcc { i64, %swift.bridge* } @"$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC"(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i64 13, i1 true)
  %1 = extractvalue { i64, %swift.bridge* } %0, 0
  %2 = extractvalue { i64, %swift.bridge* } %0, 1
  %3 = insertvalue { i64, %swift.bridge* } undef, i64 %1, 0
  %4 = insertvalue { i64, %swift.bridge* } %3, %swift.bridge* %2, 1
  ret { i64, %swift.bridge* } %4
}

define swiftcc { i64, %swift.bridge* } @"$s10TestSwiftc5MyAppV4textSSvg"(i64 %0, %swift.bridge* %1) #0 {
entry:
  %2 = call %swift.bridge* @swift_bridgeObjectRetain(%swift.bridge* returned %1) #1
  %3 = insertvalue { i64, %swift.bridge* } undef, i64 %0, 0
  %4 = insertvalue { i64, %swift.bridge* } %3, %swift.bridge* %1, 1
  ret { i64, %swift.bridge* } %4
}

define hidden swiftcc void @"$s10TestSwiftc5MyAppV4textSSvs"(i64 %0, %swift.bridge* %1, %T10TestSwiftc5MyAppV* nocapture swiftself dereferenceable(16) %2) #0 {
entry:
  %3 = call %swift.bridge* @swift_bridgeObjectRetain(%swift.bridge* returned %1) #1
  %.text = getelementptr inbounds %T10TestSwiftc5MyAppV, %T10TestSwiftc5MyAppV* %2, i32 0, i32 0
  %.text._guts = getelementptr inbounds %TSS, %TSS* %.text, i32 0, i32 0
  %.text._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %.text._guts, i32 0, i32 0
  %.text._guts._object._countAndFlagsBits = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text._guts._object, i32 0, i32 0
  %.text._guts._object._countAndFlagsBits._value = getelementptr inbounds %Ts6UInt64V, %Ts6UInt64V* %.text._guts._object._countAndFlagsBits, i32 0, i32 0
  %4 = load i64, i64* %.text._guts._object._countAndFlagsBits._value, align 8
  %.text._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text._guts._object, i32 0, i32 1
  %5 = load %swift.bridge*, %swift.bridge** %.text._guts._object._object, align 8
  %.text._guts1 = getelementptr inbounds %TSS, %TSS* %.text, i32 0, i32 0
  %.text._guts1._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %.text._guts1, i32 0, i32 0
  %.text._guts1._object._countAndFlagsBits = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text._guts1._object, i32 0, i32 0
  %.text._guts1._object._countAndFlagsBits._value = getelementptr inbounds %Ts6UInt64V, %Ts6UInt64V* %.text._guts1._object._countAndFlagsBits, i32 0, i32 0
  store i64 %0, i64* %.text._guts1._object._countAndFlagsBits._value, align 8
  %.text._guts1._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text._guts1._object, i32 0, i32 1
  store %swift.bridge* %1, %swift.bridge** %.text._guts1._object._object, align 8
  call void @swift_bridgeObjectRelease(%swift.bridge* %5) #1
  call void @swift_bridgeObjectRelease(%swift.bridge* %1) #1
  ret void
}

define swiftcc void @"$s10TestSwiftc5MyAppV4mainyyFZ"() #0 {
entry:
  %0 = call swiftcc { %swift.bridge*, i8* } @"$ss27_allocateUninitializedArrayySayxG_BptBwlF"(i64 1, %swift.type* getelementptr inbounds (%swift.full_type, %swift.full_type* @"$sypN", i32 0, i32 1))
  %1 = extractvalue { %swift.bridge*, i8* } %0, 0
  %2 = extractvalue { %swift.bridge*, i8* } %0, 1
  %3 = bitcast i8* %2 to %Any*
  %4 = call swiftcc { i64, %swift.bridge* } @"$s10TestSwiftc5MyAppVACycfC"()
  %5 = extractvalue { i64, %swift.bridge* } %4, 0
  %6 = extractvalue { i64, %swift.bridge* } %4, 1
  %7 = call %swift.bridge* @swift_bridgeObjectRetain(%swift.bridge* returned %6) #1
  call void @swift_bridgeObjectRelease(%swift.bridge* %6) #1
  %8 = getelementptr inbounds %Any, %Any* %3, i32 0, i32 1
  store %swift.type* @"$sSSN", %swift.type** %8, align 8
  %9 = getelementptr inbounds %Any, %Any* %3, i32 0, i32 0
  %10 = getelementptr inbounds %Any, %Any* %3, i32 0, i32 0
  %11 = bitcast [24 x i8]* %10 to %TSS*
  %._guts = getelementptr inbounds %TSS, %TSS* %11, i32 0, i32 0
  %._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %._guts, i32 0, i32 0
  %._guts._object._countAndFlagsBits = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %._guts._object, i32 0, i32 0
  %._guts._object._countAndFlagsBits._value = getelementptr inbounds %Ts6UInt64V, %Ts6UInt64V* %._guts._object._countAndFlagsBits, i32 0, i32 0
  store i64 %5, i64* %._guts._object._countAndFlagsBits._value, align 8
  %._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %._guts._object, i32 0, i32 1
  store %swift.bridge* %6, %swift.bridge** %._guts._object._object, align 8
  %12 = call swiftcc %swift.bridge* @"$ss27_finalizeUninitializedArrayySayxGABnlF"(%swift.bridge* %1, %swift.type* getelementptr inbounds (%swift.full_type, %swift.full_type* @"$sypN", i32 0, i32 1))
  %13 = call swiftcc { i64, %swift.bridge* } @"$ss5print_9separator10terminatoryypd_S2StFfA0_"()
  %14 = extractvalue { i64, %swift.bridge* } %13, 0
  %15 = extractvalue { i64, %swift.bridge* } %13, 1
  %16 = call swiftcc { i64, %swift.bridge* } @"$ss5print_9separator10terminatoryypd_S2StFfA1_"()
  %17 = extractvalue { i64, %swift.bridge* } %16, 0
  %18 = extractvalue { i64, %swift.bridge* } %16, 1
  call swiftcc void @"$ss5print_9separator10terminatoryypd_S2StF"(%swift.bridge* %12, i64 %14, %swift.bridge* %15, i64 %17, %swift.bridge* %18)
  call void @swift_bridgeObjectRelease(%swift.bridge* %18) #1
  call void @swift_bridgeObjectRelease(%swift.bridge* %15) #1
  call void @swift_bridgeObjectRelease(%swift.bridge* %12) #1
  ret void
}

declare swiftcc { i64, %swift.bridge* } @"$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC"(i8*, i64, i1) #0

; Function Attrs: nounwind
declare %swift.bridge* @swift_bridgeObjectRetain(%swift.bridge* returned) #1

; Function Attrs: nounwind
declare void @swift_bridgeObjectRelease(%swift.bridge*) #1

declare swiftcc { %swift.bridge*, i8* } @"$ss27_allocateUninitializedArrayySayxG_BptBwlF"(i64, %swift.type*) #0

define hidden swiftcc { i64, %swift.bridge* } @"$s10TestSwiftc5MyAppVACycfC"() #0 {
entry:
  %0 = alloca %T10TestSwiftc5MyAppV, align 8
  %1 = bitcast %T10TestSwiftc5MyAppV* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1, i8 0, i64 16, i1 false)
  %2 = bitcast %T10TestSwiftc5MyAppV* %0 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* %2)
  %3 = call swiftcc { i64, %swift.bridge* } @"$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC"(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i64 13, i1 true)
  %4 = extractvalue { i64, %swift.bridge* } %3, 0
  %5 = extractvalue { i64, %swift.bridge* } %3, 1
  %6 = call %swift.bridge* @swift_bridgeObjectRetain(%swift.bridge* returned %5) #1
  %.text = getelementptr inbounds %T10TestSwiftc5MyAppV, %T10TestSwiftc5MyAppV* %0, i32 0, i32 0
  %.text._guts = getelementptr inbounds %TSS, %TSS* %.text, i32 0, i32 0
  %.text._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %.text._guts, i32 0, i32 0
  %.text._guts._object._countAndFlagsBits = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text._guts._object, i32 0, i32 0
  %.text._guts._object._countAndFlagsBits._value = getelementptr inbounds %Ts6UInt64V, %Ts6UInt64V* %.text._guts._object._countAndFlagsBits, i32 0, i32 0
  store i64 %4, i64* %.text._guts._object._countAndFlagsBits._value, align 8
  %.text._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text._guts._object, i32 0, i32 1
  store %swift.bridge* %5, %swift.bridge** %.text._guts._object._object, align 8
  %7 = call %T10TestSwiftc5MyAppV* @"$s10TestSwiftc5MyAppVWOh"(%T10TestSwiftc5MyAppV* %0)
  %8 = bitcast %T10TestSwiftc5MyAppV* %0 to i8*
  call void @llvm.lifetime.end.p0i8(i64 16, i8* %8)
  %9 = insertvalue { i64, %swift.bridge* } undef, i64 %4, 0
  %10 = insertvalue { i64, %swift.bridge* } %9, %swift.bridge* %5, 1
  ret { i64, %swift.bridge* } %10
}

define linkonce_odr hidden swiftcc %swift.bridge* @"$ss27_finalizeUninitializedArrayySayxGABnlF"(%swift.bridge* %0, %swift.type* %Element) #0 {
entry:
  %Element1 = alloca %swift.type*, align 8
  %1 = alloca %TSa, align 8
  store %swift.type* %Element, %swift.type** %Element1, align 8
  %2 = bitcast %TSa* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2)
  %._buffer = getelementptr inbounds %TSa, %TSa* %1, i32 0, i32 0
  %._buffer._storage = getelementptr inbounds %Ts12_ArrayBufferV, %Ts12_ArrayBufferV* %._buffer, i32 0, i32 0
  %._buffer._storage.rawValue = getelementptr inbounds %Ts14_BridgeStorageV, %Ts14_BridgeStorageV* %._buffer._storage, i32 0, i32 0
  store %swift.bridge* %0, %swift.bridge** %._buffer._storage.rawValue, align 8
  %3 = call swiftcc %swift.metadata_response @"$sSaMa"(i64 0, %swift.type* %Element) #9
  %4 = extractvalue %swift.metadata_response %3, 0
  call swiftcc void @"$sSa12_endMutationyyF"(%swift.type* %4, %TSa* nocapture swiftself dereferenceable(8) %1)
  %._buffer2 = getelementptr inbounds %TSa, %TSa* %1, i32 0, i32 0
  %._buffer2._storage = getelementptr inbounds %Ts12_ArrayBufferV, %Ts12_ArrayBufferV* %._buffer2, i32 0, i32 0
  %._buffer2._storage.rawValue = getelementptr inbounds %Ts14_BridgeStorageV, %Ts14_BridgeStorageV* %._buffer2._storage, i32 0, i32 0
  %5 = load %swift.bridge*, %swift.bridge** %._buffer2._storage.rawValue, align 8
  %6 = bitcast %TSa* %1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %6)
  ret %swift.bridge* %5
}

define linkonce_odr hidden swiftcc { i64, %swift.bridge* } @"$ss5print_9separator10terminatoryypd_S2StFfA0_"() #0 {
entry:
  %0 = call swiftcc { i64, %swift.bridge* } @"$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC"(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0), i64 1, i1 true)
  %1 = extractvalue { i64, %swift.bridge* } %0, 0
  %2 = extractvalue { i64, %swift.bridge* } %0, 1
  %3 = insertvalue { i64, %swift.bridge* } undef, i64 %1, 0
  %4 = insertvalue { i64, %swift.bridge* } %3, %swift.bridge* %2, 1
  ret { i64, %swift.bridge* } %4
}

define linkonce_odr hidden swiftcc { i64, %swift.bridge* } @"$ss5print_9separator10terminatoryypd_S2StFfA1_"() #0 {
entry:
  %0 = call swiftcc { i64, %swift.bridge* } @"$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC"(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0), i64 1, i1 true)
  %1 = extractvalue { i64, %swift.bridge* } %0, 0
  %2 = extractvalue { i64, %swift.bridge* } %0, 1
  %3 = insertvalue { i64, %swift.bridge* } undef, i64 %1, 0
  %4 = insertvalue { i64, %swift.bridge* } %3, %swift.bridge* %2, 1
  ret { i64, %swift.bridge* } %4
}

declare swiftcc void @"$ss5print_9separator10terminatoryypd_S2StF"(%swift.bridge*, i64, %swift.bridge*, i64, %swift.bridge*) #0

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind
define linkonce_odr hidden %T10TestSwiftc5MyAppV* @"$s10TestSwiftc5MyAppVWOh"(%T10TestSwiftc5MyAppV* %0) #4 {
entry:
  %.text = getelementptr inbounds %T10TestSwiftc5MyAppV, %T10TestSwiftc5MyAppV* %0, i32 0, i32 0
  %.text._guts = getelementptr inbounds %TSS, %TSS* %.text, i32 0, i32 0
  %.text._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %.text._guts, i32 0, i32 0
  %.text._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text._guts._object, i32 0, i32 1
  %toDestroy = load %swift.bridge*, %swift.bridge** %.text._guts._object._object, align 8
  call void @swift_bridgeObjectRelease(%swift.bridge* %toDestroy) #1
  ret %T10TestSwiftc5MyAppV* %0
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

define hidden swiftcc { i64, %swift.bridge* } @"$s10TestSwiftc5MyAppV4textACSS_tcfcfA_"() #0 {
entry:
  %0 = call swiftcc { i64, %swift.bridge* } @"$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC"(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i64 13, i1 true)
  %1 = extractvalue { i64, %swift.bridge* } %0, 0
  %2 = extractvalue { i64, %swift.bridge* } %0, 1
  %3 = insertvalue { i64, %swift.bridge* } undef, i64 %1, 0
  %4 = insertvalue { i64, %swift.bridge* } %3, %swift.bridge* %2, 1
  ret { i64, %swift.bridge* } %4
}

define hidden swiftcc { i64, %swift.bridge* } @"$s10TestSwiftc5MyAppV4textACSS_tcfC"(i64 %0, %swift.bridge* %1) #0 {
entry:
  %2 = insertvalue { i64, %swift.bridge* } undef, i64 %0, 0
  %3 = insertvalue { i64, %swift.bridge* } %2, %swift.bridge* %1, 1
  ret { i64, %swift.bridge* } %3
}

; Function Attrs: nounwind
define internal %swift.opaque* @"$s10TestSwiftc5MyAppVwCP"([24 x i8]* noalias %dest, [24 x i8]* noalias %src, %swift.type* %MyApp) #5 {
entry:
  %object = bitcast [24 x i8]* %dest to %T10TestSwiftc5MyAppV*
  %object1 = bitcast [24 x i8]* %src to %T10TestSwiftc5MyAppV*
  %object.text = getelementptr inbounds %T10TestSwiftc5MyAppV, %T10TestSwiftc5MyAppV* %object, i32 0, i32 0
  %object1.text = getelementptr inbounds %T10TestSwiftc5MyAppV, %T10TestSwiftc5MyAppV* %object1, i32 0, i32 0
  %object.text._guts = getelementptr inbounds %TSS, %TSS* %object.text, i32 0, i32 0
  %object1.text._guts = getelementptr inbounds %TSS, %TSS* %object1.text, i32 0, i32 0
  %object.text._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %object.text._guts, i32 0, i32 0
  %object1.text._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %object1.text._guts, i32 0, i32 0
  %object.text._guts._object._countAndFlagsBits = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %object.text._guts._object, i32 0, i32 0
  %object1.text._guts._object._countAndFlagsBits = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %object1.text._guts._object, i32 0, i32 0
  %0 = bitcast %Ts6UInt64V* %object.text._guts._object._countAndFlagsBits to i8*
  %1 = bitcast %Ts6UInt64V* %object1.text._guts._object._countAndFlagsBits to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 8, i1 false)
  %object.text._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %object.text._guts._object, i32 0, i32 1
  %object1.text._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %object1.text._guts._object, i32 0, i32 1
  %2 = load %swift.bridge*, %swift.bridge** %object1.text._guts._object._object, align 8
  %3 = call %swift.bridge* @swift_bridgeObjectRetain(%swift.bridge* returned %2) #1
  store %swift.bridge* %2, %swift.bridge** %object.text._guts._object._object, align 8
  %4 = bitcast %T10TestSwiftc5MyAppV* %object to %swift.opaque*
  ret %swift.opaque* %4
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: nounwind
define internal void @"$s10TestSwiftc5MyAppVwxx"(%swift.opaque* noalias %object, %swift.type* %MyApp) #5 {
entry:
  %0 = bitcast %swift.opaque* %object to %T10TestSwiftc5MyAppV*
  %.text = getelementptr inbounds %T10TestSwiftc5MyAppV, %T10TestSwiftc5MyAppV* %0, i32 0, i32 0
  %.text._guts = getelementptr inbounds %TSS, %TSS* %.text, i32 0, i32 0
  %.text._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %.text._guts, i32 0, i32 0
  %.text._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text._guts._object, i32 0, i32 1
  %toDestroy = load %swift.bridge*, %swift.bridge** %.text._guts._object._object, align 8
  call void @swift_bridgeObjectRelease(%swift.bridge* %toDestroy) #1
  ret void
}

; Function Attrs: nounwind
define internal %swift.opaque* @"$s10TestSwiftc5MyAppVwcp"(%swift.opaque* noalias %dest, %swift.opaque* noalias %src, %swift.type* %MyApp) #5 {
entry:
  %0 = bitcast %swift.opaque* %dest to %T10TestSwiftc5MyAppV*
  %1 = bitcast %swift.opaque* %src to %T10TestSwiftc5MyAppV*
  %.text = getelementptr inbounds %T10TestSwiftc5MyAppV, %T10TestSwiftc5MyAppV* %0, i32 0, i32 0
  %.text1 = getelementptr inbounds %T10TestSwiftc5MyAppV, %T10TestSwiftc5MyAppV* %1, i32 0, i32 0
  %.text._guts = getelementptr inbounds %TSS, %TSS* %.text, i32 0, i32 0
  %.text1._guts = getelementptr inbounds %TSS, %TSS* %.text1, i32 0, i32 0
  %.text._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %.text._guts, i32 0, i32 0
  %.text1._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %.text1._guts, i32 0, i32 0
  %.text._guts._object._countAndFlagsBits = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text._guts._object, i32 0, i32 0
  %.text1._guts._object._countAndFlagsBits = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text1._guts._object, i32 0, i32 0
  %2 = bitcast %Ts6UInt64V* %.text._guts._object._countAndFlagsBits to i8*
  %3 = bitcast %Ts6UInt64V* %.text1._guts._object._countAndFlagsBits to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 8 %3, i64 8, i1 false)
  %.text._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text._guts._object, i32 0, i32 1
  %.text1._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text1._guts._object, i32 0, i32 1
  %4 = load %swift.bridge*, %swift.bridge** %.text1._guts._object._object, align 8
  %5 = call %swift.bridge* @swift_bridgeObjectRetain(%swift.bridge* returned %4) #1
  store %swift.bridge* %4, %swift.bridge** %.text._guts._object._object, align 8
  %6 = bitcast %T10TestSwiftc5MyAppV* %0 to %swift.opaque*
  ret %swift.opaque* %6
}

; Function Attrs: nounwind
define internal %swift.opaque* @"$s10TestSwiftc5MyAppVwca"(%swift.opaque* %dest, %swift.opaque* %src, %swift.type* %MyApp) #5 {
entry:
  %0 = bitcast %swift.opaque* %dest to %T10TestSwiftc5MyAppV*
  %1 = bitcast %swift.opaque* %src to %T10TestSwiftc5MyAppV*
  %.text = getelementptr inbounds %T10TestSwiftc5MyAppV, %T10TestSwiftc5MyAppV* %0, i32 0, i32 0
  %.text1 = getelementptr inbounds %T10TestSwiftc5MyAppV, %T10TestSwiftc5MyAppV* %1, i32 0, i32 0
  %.text._guts = getelementptr inbounds %TSS, %TSS* %.text, i32 0, i32 0
  %.text1._guts = getelementptr inbounds %TSS, %TSS* %.text1, i32 0, i32 0
  %.text._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %.text._guts, i32 0, i32 0
  %.text1._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %.text1._guts, i32 0, i32 0
  %.text._guts._object._countAndFlagsBits = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text._guts._object, i32 0, i32 0
  %.text1._guts._object._countAndFlagsBits = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text1._guts._object, i32 0, i32 0
  %.text._guts._object._countAndFlagsBits._value = getelementptr inbounds %Ts6UInt64V, %Ts6UInt64V* %.text._guts._object._countAndFlagsBits, i32 0, i32 0
  %.text1._guts._object._countAndFlagsBits._value = getelementptr inbounds %Ts6UInt64V, %Ts6UInt64V* %.text1._guts._object._countAndFlagsBits, i32 0, i32 0
  %2 = load i64, i64* %.text1._guts._object._countAndFlagsBits._value, align 8
  store i64 %2, i64* %.text._guts._object._countAndFlagsBits._value, align 8
  %.text._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text._guts._object, i32 0, i32 1
  %.text1._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text1._guts._object, i32 0, i32 1
  %3 = load %swift.bridge*, %swift.bridge** %.text1._guts._object._object, align 8
  %4 = call %swift.bridge* @swift_bridgeObjectRetain(%swift.bridge* returned %3) #1
  %oldValue = load %swift.bridge*, %swift.bridge** %.text._guts._object._object, align 8
  store %swift.bridge* %3, %swift.bridge** %.text._guts._object._object, align 8
  call void @swift_bridgeObjectRelease(%swift.bridge* %oldValue) #1
  %5 = bitcast %T10TestSwiftc5MyAppV* %0 to %swift.opaque*
  ret %swift.opaque* %5
}

; Function Attrs: nounwind
define linkonce_odr hidden i8* @__swift_memcpy16_8(i8* %0, i8* %1, %swift.type* %2) #5 {
entry:
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 16, i1 false)
  ret i8* %0
}

; Function Attrs: nounwind
define internal %swift.opaque* @"$s10TestSwiftc5MyAppVwta"(%swift.opaque* noalias %dest, %swift.opaque* noalias %src, %swift.type* %MyApp) #5 {
entry:
  %0 = bitcast %swift.opaque* %dest to %T10TestSwiftc5MyAppV*
  %1 = bitcast %swift.opaque* %src to %T10TestSwiftc5MyAppV*
  %.text = getelementptr inbounds %T10TestSwiftc5MyAppV, %T10TestSwiftc5MyAppV* %0, i32 0, i32 0
  %.text1 = getelementptr inbounds %T10TestSwiftc5MyAppV, %T10TestSwiftc5MyAppV* %1, i32 0, i32 0
  %.text._guts = getelementptr inbounds %TSS, %TSS* %.text, i32 0, i32 0
  %.text1._guts = getelementptr inbounds %TSS, %TSS* %.text1, i32 0, i32 0
  %.text._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %.text._guts, i32 0, i32 0
  %.text1._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %.text1._guts, i32 0, i32 0
  %.text._guts._object._countAndFlagsBits = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text._guts._object, i32 0, i32 0
  %.text1._guts._object._countAndFlagsBits = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text1._guts._object, i32 0, i32 0
  %.text._guts._object._countAndFlagsBits._value = getelementptr inbounds %Ts6UInt64V, %Ts6UInt64V* %.text._guts._object._countAndFlagsBits, i32 0, i32 0
  %.text1._guts._object._countAndFlagsBits._value = getelementptr inbounds %Ts6UInt64V, %Ts6UInt64V* %.text1._guts._object._countAndFlagsBits, i32 0, i32 0
  %2 = load i64, i64* %.text1._guts._object._countAndFlagsBits._value, align 8
  store i64 %2, i64* %.text._guts._object._countAndFlagsBits._value, align 8
  %.text._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text._guts._object, i32 0, i32 1
  %.text1._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text1._guts._object, i32 0, i32 1
  %3 = load %swift.bridge*, %swift.bridge** %.text1._guts._object._object, align 8
  %oldValue = load %swift.bridge*, %swift.bridge** %.text._guts._object._object, align 8
  store %swift.bridge* %3, %swift.bridge** %.text._guts._object._object, align 8
  call void @swift_bridgeObjectRelease(%swift.bridge* %oldValue) #1
  %4 = bitcast %T10TestSwiftc5MyAppV* %0 to %swift.opaque*
  ret %swift.opaque* %4
}

; Function Attrs: nounwind readonly
define internal i32 @"$s10TestSwiftc5MyAppVwet"(%swift.opaque* noalias %value, i32 %numEmptyCases, %swift.type* %MyApp) #7 {
entry:
  %0 = bitcast %swift.opaque* %value to %T10TestSwiftc5MyAppV*
  %1 = icmp eq i32 0, %numEmptyCases
  br i1 %1, label %41, label %2

2:                                                ; preds = %entry
  %3 = icmp ugt i32 %numEmptyCases, 2147483647
  br i1 %3, label %4, label %35

4:                                                ; preds = %2
  %5 = sub i32 %numEmptyCases, 2147483647
  %6 = bitcast %T10TestSwiftc5MyAppV* %0 to i8*
  %7 = getelementptr inbounds i8, i8* %6, i32 16
  br i1 false, label %8, label %9

8:                                                ; preds = %4
  br label %23

9:                                                ; preds = %4
  br i1 true, label %10, label %13

10:                                               ; preds = %9
  %11 = load i8, i8* %7, align 1
  %12 = zext i8 %11 to i32
  br label %23

13:                                               ; preds = %9
  br i1 false, label %14, label %18

14:                                               ; preds = %13
  %15 = bitcast i8* %7 to i16*
  %16 = load i16, i16* %15, align 1
  %17 = zext i16 %16 to i32
  br label %23

18:                                               ; preds = %13
  br i1 false, label %19, label %22

19:                                               ; preds = %18
  %20 = bitcast i8* %7 to i32*
  %21 = load i32, i32* %20, align 1
  br label %23

22:                                               ; preds = %18
  unreachable

23:                                               ; preds = %19, %14, %10, %8
  %24 = phi i32 [ 0, %8 ], [ %12, %10 ], [ %17, %14 ], [ %21, %19 ]
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %35, label %26

26:                                               ; preds = %23
  %27 = sub i32 %24, 1
  %28 = shl i32 %27, 128
  %29 = select i1 true, i32 0, i32 %28
  %30 = bitcast i8* %6 to i128*
  %31 = load i128, i128* %30, align 1
  %32 = trunc i128 %31 to i32
  %33 = or i32 %32, %29
  %34 = add i32 2147483647, %33
  br label %42

35:                                               ; preds = %23, %2
  %.text = getelementptr inbounds %T10TestSwiftc5MyAppV, %T10TestSwiftc5MyAppV* %0, i32 0, i32 0
  %.text._guts = getelementptr inbounds %TSS, %TSS* %.text, i32 0, i32 0
  %.text._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %.text._guts, i32 0, i32 0
  %.text._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text._guts._object, i32 0, i32 1
  %36 = bitcast %swift.bridge** %.text._guts._object._object to i64*
  %37 = load i64, i64* %36, align 8
  %38 = icmp uge i64 %37, 4294967296
  br i1 %38, label %is-valid-pointer, label %is-invalid-pointer

is-invalid-pointer:                               ; preds = %35
  %39 = trunc i64 %37 to i32
  br label %is-valid-pointer

is-valid-pointer:                                 ; preds = %is-invalid-pointer, %35
  %40 = phi i32 [ -1, %35 ], [ %39, %is-invalid-pointer ]
  br label %42

41:                                               ; preds = %entry
  br label %42

42:                                               ; preds = %41, %is-valid-pointer, %26
  %43 = phi i32 [ %40, %is-valid-pointer ], [ %34, %26 ], [ -1, %41 ]
  %44 = add i32 %43, 1
  ret i32 %44
}

; Function Attrs: nounwind
define internal void @"$s10TestSwiftc5MyAppVwst"(%swift.opaque* noalias %value, i32 %whichCase, i32 %numEmptyCases, %swift.type* %MyApp) #5 {
entry:
  %0 = bitcast %swift.opaque* %value to %T10TestSwiftc5MyAppV*
  %1 = bitcast %T10TestSwiftc5MyAppV* %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i32 16
  %3 = icmp ugt i32 %numEmptyCases, 2147483647
  br i1 %3, label %4, label %6

4:                                                ; preds = %entry
  %5 = sub i32 %numEmptyCases, 2147483647
  br label %6

6:                                                ; preds = %4, %entry
  %7 = phi i32 [ 0, %entry ], [ 1, %4 ]
  %8 = icmp ule i32 %whichCase, 2147483647
  br i1 %8, label %9, label %30

9:                                                ; preds = %6
  %10 = icmp eq i32 %7, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %9
  br label %24

12:                                               ; preds = %9
  %13 = icmp eq i32 %7, 1
  br i1 %13, label %14, label %15

14:                                               ; preds = %12
  store i8 0, i8* %2, align 8
  br label %24

15:                                               ; preds = %12
  %16 = icmp eq i32 %7, 2
  br i1 %16, label %17, label %19

17:                                               ; preds = %15
  %18 = bitcast i8* %2 to i16*
  store i16 0, i16* %18, align 8
  br label %24

19:                                               ; preds = %15
  %20 = icmp eq i32 %7, 4
  br i1 %20, label %21, label %23

21:                                               ; preds = %19
  %22 = bitcast i8* %2 to i32*
  store i32 0, i32* %22, align 8
  br label %24

23:                                               ; preds = %19
  unreachable

24:                                               ; preds = %21, %17, %14, %11
  %25 = icmp eq i32 %whichCase, 0
  br i1 %25, label %59, label %26

26:                                               ; preds = %24
  %27 = sub i32 %whichCase, 1
  %.text = getelementptr inbounds %T10TestSwiftc5MyAppV, %T10TestSwiftc5MyAppV* %0, i32 0, i32 0
  %.text._guts = getelementptr inbounds %TSS, %TSS* %.text, i32 0, i32 0
  %.text._guts._object = getelementptr inbounds %Ts11_StringGutsV, %Ts11_StringGutsV* %.text._guts, i32 0, i32 0
  %.text._guts._object._object = getelementptr inbounds %Ts13_StringObjectV, %Ts13_StringObjectV* %.text._guts._object, i32 0, i32 1
  %28 = zext i32 %27 to i64
  %29 = bitcast %swift.bridge** %.text._guts._object._object to i64*
  store i64 %28, i64* %29, align 8
  br label %59

30:                                               ; preds = %6
  %31 = sub i32 %whichCase, 1
  %32 = sub i32 %31, 2147483647
  br i1 true, label %37, label %33

33:                                               ; preds = %30
  %34 = lshr i32 %32, 128
  %35 = add i32 1, %34
  %36 = and i32 poison, %32
  br label %37

37:                                               ; preds = %33, %30
  %38 = phi i32 [ 1, %30 ], [ %35, %33 ]
  %39 = phi i32 [ %32, %30 ], [ %36, %33 ]
  %40 = zext i32 %39 to i128
  %41 = bitcast i8* %1 to i128*
  store i128 %40, i128* %41, align 8
  %42 = icmp eq i32 %7, 0
  br i1 %42, label %43, label %44

43:                                               ; preds = %37
  br label %58

44:                                               ; preds = %37
  %45 = icmp eq i32 %7, 1
  br i1 %45, label %46, label %48

46:                                               ; preds = %44
  %47 = trunc i32 %38 to i8
  store i8 %47, i8* %2, align 8
  br label %58

48:                                               ; preds = %44
  %49 = icmp eq i32 %7, 2
  br i1 %49, label %50, label %53

50:                                               ; preds = %48
  %51 = trunc i32 %38 to i16
  %52 = bitcast i8* %2 to i16*
  store i16 %51, i16* %52, align 8
  br label %58

53:                                               ; preds = %48
  %54 = icmp eq i32 %7, 4
  br i1 %54, label %55, label %57

55:                                               ; preds = %53
  %56 = bitcast i8* %2 to i32*
  store i32 %38, i32* %56, align 8
  br label %58

57:                                               ; preds = %53
  unreachable

58:                                               ; preds = %55, %50, %46, %43
  br label %59

59:                                               ; preds = %58, %26, %24
  ret void
}

; Function Attrs: noinline nounwind readnone
define swiftcc %swift.metadata_response @"$s10TestSwiftc5MyAppVMa"(i64 %0) #8 {
entry:
  ret %swift.metadata_response { %swift.type* bitcast (i64* getelementptr inbounds (<{ i8**, i64, <{ i32, i32, i32, i32, i32, i32, i32 }>*, i32, [4 x i8] }>, <{ i8**, i64, <{ i32, i32, i32, i32, i32, i32, i32 }>*, i32, [4 x i8] }>* @"$s10TestSwiftc5MyAppVMf", i32 0, i32 1) to %swift.type*), i64 0 }
}

define linkonce_odr hidden swiftcc void @"$sSa12_endMutationyyF"(%swift.type* %"Array<Element>", %TSa* nocapture swiftself dereferenceable(8) %0) #0 {
entry:
  %._buffer = getelementptr inbounds %TSa, %TSa* %0, i32 0, i32 0
  %._buffer._storage = getelementptr inbounds %Ts12_ArrayBufferV, %Ts12_ArrayBufferV* %._buffer, i32 0, i32 0
  %._buffer._storage.rawValue = getelementptr inbounds %Ts14_BridgeStorageV, %Ts14_BridgeStorageV* %._buffer._storage, i32 0, i32 0
  %1 = load %swift.bridge*, %swift.bridge** %._buffer._storage.rawValue, align 8
  %._buffer1 = getelementptr inbounds %TSa, %TSa* %0, i32 0, i32 0
  %._buffer1._storage = getelementptr inbounds %Ts12_ArrayBufferV, %Ts12_ArrayBufferV* %._buffer1, i32 0, i32 0
  %._buffer1._storage.rawValue = getelementptr inbounds %Ts14_BridgeStorageV, %Ts14_BridgeStorageV* %._buffer1._storage, i32 0, i32 0
  store %swift.bridge* %1, %swift.bridge** %._buffer1._storage.rawValue, align 8
  ret void
}

declare swiftcc %swift.metadata_response @"$sSaMa"(i64, %swift.type*) #0

attributes #0 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" }
attributes #1 = { nounwind }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { noinline nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" }
attributes #5 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind readonly "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" }
attributes #8 = { noinline nounwind readnone "frame-pointer"="none" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-a12" "target-features"="+aes,+crc,+crypto,+fp-armv8,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.3a,+zcm,+zcz" }
attributes #9 = { nounwind readnone }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15}
!swift.module.flags = !{!16}
!llvm.asan.globals = !{!17, !18, !19, !20, !21, !22, !23}
!llvm.linker.options = !{!24, !25, !26, !27, !28}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 13, i32 1]}
!1 = !{i32 1, !"Objective-C Version", i32 2}
!2 = !{i32 1, !"Objective-C Image Info Version", i32 0}
!3 = !{i32 1, !"Objective-C Image Info Section", !"__DATA,__objc_imageinfo,regular,no_dead_strip"}
!4 = !{i32 4, !"Objective-C Garbage Collection", i32 84346624}
!5 = !{i32 1, !"Objective-C Class Properties", i32 64}
!6 = !{i32 1, !"Objective-C Enforce ClassRO Pointer Signing", i8 0}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 1, !"branch-target-enforcement", i32 0}
!9 = !{i32 1, !"sign-return-address", i32 0}
!10 = !{i32 1, !"sign-return-address-all", i32 0}
!11 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 1}
!15 = !{i32 1, !"Swift Version", i32 7}
!16 = !{!"standard-library", i1 false}
!17 = !{<{ i32, i32, i32 }>* @"$s10TestSwiftcMXM", null, null, i1 false, i1 true}
!18 = !{<{ i32, i32, i32, i32, i32, i32, i32 }>* @"$s10TestSwiftc5MyAppVMn", null, null, i1 false, i1 true}
!19 = !{<{ i8, i32, i8 }>* @"symbolic _____ 10TestSwiftc5MyAppV", null, null, i1 false, i1 true}
!20 = !{<{ [2 x i8], i8 }>* @"symbolic SS", null, null, i1 false, i1 true}
!21 = !{[5 x i8]* @0, null, null, i1 false, i1 true}
!22 = !{{ i32, i32, i16, i16, i32, i32, i32, i32 }* @"$s10TestSwiftc5MyAppVMF", null, null, i1 false, i1 true}
!23 = !{%swift.type_metadata_record* @"$s10TestSwiftc5MyAppVHn", null, null, i1 false, i1 true}
!24 = !{!"-lswiftSwiftOnoneSupport"}
!25 = !{!"-lswiftCore"}
!26 = !{!"-lswift_Concurrency"}
!27 = !{!"-lswift_StringProcessing"}
!28 = !{!"-lobjc"}
```
#### swiftc -emit-assembly
```bash
swiftc TestSwiftc.swift -emit-assembly
```
<small style="color:red"><em>
swiftc TestSwiftc.swift -emit-assembly 是一个用于生成汇编代码（Assembly Code）的命令。汇编代码是一种低级的表示形式，它展示了源代码如何被编译成机器代码的具体指令序列。

当你运行 swiftc TestSwiftc.swift -emit-assembly 命令时，它会将指定的 Swift 源代码文件（例如 TestSwiftc.swift）编译成汇编代码，并输出生成的汇编代码。这个命令通常用于深入了解 Swift 代码如何被转化为机器代码，以及进行与底层机器代码相关的性能分析。

生成的汇编代码是特定于目标架构和操作系统的。它显示了每个函数的机器指令、寄存器分配和内存访问，以及其他与底层执行有关的细节。这对于调试和性能分析非常有用，但通常需要一定的汇编语言知识来理解。

需要注意的是，生成汇编代码的命令通常用于高级用户、系统编程人员和需要深入了解机器代码执行的人员，而不是一般的应用程序开发者。</em></small>
```bash
tangjianfeng@tangjianfengdeMacBook-Air MyApp % swiftc TestSwiftc.swift -emit-assembly
        .section        __TEXT,__text,regular,pure_instructions
        .build_version macos, 12, 0     sdk_version 13, 1
        .globl  _main
        .p2align        2
_main:
        .cfi_startproc
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        .cfi_def_cfa w29, 16
        .cfi_offset w30, -8
        .cfi_offset w29, -16
        bl      _$s10TestSwiftc5MyAppV4mainyyFZ
        mov     w0, #0
        ldp     x29, x30, [sp], #16
        ret
        .cfi_endproc

        .globl  _$s10TestSwiftc5MyAppV4textSSvpfi
        .p2align        2
_$s10TestSwiftc5MyAppV4textSSvpfi:
        .cfi_startproc
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        .cfi_def_cfa w29, 16
        .cfi_offset w30, -8
        .cfi_offset w29, -16
        adrp    x0, l_.str@PAGE
        add     x0, x0, l_.str@PAGEOFF
        mov     w8, #13
        mov     x1, x8
        mov     w8, #1
        and     w2, w8, #0x1
        bl      _$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC
        ldp     x29, x30, [sp], #16
        ret
        .cfi_endproc

        .globl  _$s10TestSwiftc5MyAppV4textSSvg
        .p2align        2
_$s10TestSwiftc5MyAppV4textSSvg:
        .cfi_startproc
        sub     sp, sp, #32
        stp     x29, x30, [sp, #16]
        add     x29, sp, #16
        .cfi_def_cfa w29, 16
        .cfi_offset w30, -8
        .cfi_offset w29, -16
        str     x0, [sp]
        mov     x0, x1
        str     x0, [sp, #8]
        bl      _swift_bridgeObjectRetain
        ldr     x0, [sp]
        ldr     x1, [sp, #8]
        ldp     x29, x30, [sp, #16]
        add     sp, sp, #32
        ret
        .cfi_endproc

        .private_extern _$s10TestSwiftc5MyAppV4textSSvs
        .globl  _$s10TestSwiftc5MyAppV4textSSvs
        .p2align        2
_$s10TestSwiftc5MyAppV4textSSvs:
        .cfi_startproc
        sub     sp, sp, #32
        stp     x29, x30, [sp, #16]
        add     x29, sp, #16
        .cfi_def_cfa w29, 16
        .cfi_offset w30, -8
        .cfi_offset w29, -16
        str     x0, [sp]
        mov     x0, x1
        str     x0, [sp, #8]
        bl      _swift_bridgeObjectRetain
        ldr     x8, [sp]
        ldr     x1, [sp, #8]
        ldr     x0, [x20, #8]
        str     x8, [x20]
        str     x1, [x20, #8]
        bl      _swift_bridgeObjectRelease
        ldr     x0, [sp, #8]
        bl      _swift_bridgeObjectRelease
        ldp     x29, x30, [sp, #16]
        add     sp, sp, #32
        ret
        .cfi_endproc

        .globl  _$s10TestSwiftc5MyAppV4mainyyFZ
        .p2align        2
_$s10TestSwiftc5MyAppV4mainyyFZ:
        .cfi_startproc
        sub     sp, sp, #96
        stp     x29, x30, [sp, #80]
        add     x29, sp, #80
        .cfi_def_cfa w29, 16
        .cfi_offset w30, -8
        .cfi_offset w29, -16
        adrp    x8, _$sypN@GOTPAGE
        ldr     x8, [x8, _$sypN@GOTPAGEOFF]
        add     x1, x8, #8
        str     x1, [sp, #40]
        mov     w8, #1
        mov     x0, x8
        bl      _$ss27_allocateUninitializedArrayySayxG_BptBwlF
        str     x0, [sp, #32]
        str     x1, [sp, #24]
        bl      _$s10TestSwiftc5MyAppVACycfC
        str     x0, [sp, #8]
        mov     x0, x1
        str     x0, [sp, #16]
        bl      _swift_bridgeObjectRetain
        ldr     x0, [sp, #16]
        bl      _swift_bridgeObjectRelease
        ldr     x10, [sp, #8]
        ldr     x8, [sp, #16]
        ldr     x9, [sp, #24]
        ldr     x0, [sp, #32]
        ldr     x1, [sp, #40]
        adrp    x11, _$sSSN@GOTPAGE
        ldr     x11, [x11, _$sSSN@GOTPAGEOFF]
        str     x11, [x9, #24]
        str     x10, [x9]
        str     x8, [x9, #8]
        bl      _$ss27_finalizeUninitializedArrayySayxGABnlF
        stur    x0, [x29, #-8]
        bl      _$ss5print_9separator10terminatoryypd_S2StFfA0_
        stur    x0, [x29, #-32]
        stur    x1, [x29, #-16]
        bl      _$ss5print_9separator10terminatoryypd_S2StFfA1_
        ldur    x2, [x29, #-16]
        mov     x3, x0
        ldur    x0, [x29, #-8]
        mov     x4, x1
        ldur    x1, [x29, #-32]
        stur    x4, [x29, #-24]
        bl      _$ss5print_9separator10terminatoryypd_S2StF
        ldur    x0, [x29, #-24]
        bl      _swift_bridgeObjectRelease
        ldur    x0, [x29, #-16]
        bl      _swift_bridgeObjectRelease
        ldur    x0, [x29, #-8]
        bl      _swift_bridgeObjectRelease
        ldp     x29, x30, [sp, #80]
        add     sp, sp, #96
        ret
        .cfi_endproc

        .private_extern _$s10TestSwiftc5MyAppVACycfC
        .globl  _$s10TestSwiftc5MyAppVACycfC
        .p2align        2
_$s10TestSwiftc5MyAppVACycfC:
        .cfi_startproc
        sub     sp, sp, #64
        stp     x29, x30, [sp, #48]
        add     x29, sp, #48
        .cfi_def_cfa w29, 16
        .cfi_offset w30, -8
        .cfi_offset w29, -16
        sub     x8, x29, #16
        str     x8, [sp, #8]
        stur    xzr, [x29, #-16]
        stur    xzr, [x29, #-8]
        adrp    x0, l_.str@PAGE
        add     x0, x0, l_.str@PAGEOFF
        mov     w8, #13
        mov     x1, x8
        mov     w8, #1
        and     w2, w8, #0x1
        bl      _$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC
        str     x0, [sp, #24]
        mov     x0, x1
        str     x0, [sp, #16]
        bl      _swift_bridgeObjectRetain
        ldr     x0, [sp, #8]
        ldr     x8, [sp, #24]
        ldr     x1, [sp, #16]
        stur    x8, [x29, #-16]
        stur    x1, [x29, #-8]
        bl      _$s10TestSwiftc5MyAppVWOh
        ldr     x1, [sp, #16]
        ldr     x0, [sp, #24]
        ldp     x29, x30, [sp, #48]
        add     sp, sp, #64
        ret
        .cfi_endproc

        .private_extern _$ss27_finalizeUninitializedArrayySayxGABnlF
        .globl  _$ss27_finalizeUninitializedArrayySayxGABnlF
        .weak_definition        _$ss27_finalizeUninitializedArrayySayxGABnlF
        .p2align        2
_$ss27_finalizeUninitializedArrayySayxGABnlF:
        .cfi_startproc
        sub     sp, sp, #48
        stp     x20, x19, [sp, #16]
        stp     x29, x30, [sp, #32]
        add     x29, sp, #32
        .cfi_def_cfa w29, 16
        .cfi_offset w30, -8
        .cfi_offset w29, -16
        .cfi_offset w19, -24
        .cfi_offset w20, -32
        mov     x8, x1
        str     x8, [sp, #8]
        mov     x20, sp
        str     x0, [sp]
        mov     x0, #0
        bl      _$sSaMa
        bl      _$sSa12_endMutationyyF
        ldr     x0, [sp]
        ldp     x29, x30, [sp, #32]
        ldp     x20, x19, [sp, #16]
        add     sp, sp, #48
        ret
        .cfi_endproc

        .private_extern _$ss5print_9separator10terminatoryypd_S2StFfA0_
        .globl  _$ss5print_9separator10terminatoryypd_S2StFfA0_
        .weak_definition        _$ss5print_9separator10terminatoryypd_S2StFfA0_
        .p2align        2
_$ss5print_9separator10terminatoryypd_S2StFfA0_:
        .cfi_startproc
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        .cfi_def_cfa w29, 16
        .cfi_offset w30, -8
        .cfi_offset w29, -16
        adrp    x0, l_.str.4@PAGE
        add     x0, x0, l_.str.4@PAGEOFF
        mov     w8, #1
        mov     x1, x8
        mov     w8, #1
        and     w2, w8, #0x1
        bl      _$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC
        ldp     x29, x30, [sp], #16
        ret
        .cfi_endproc

        .private_extern _$ss5print_9separator10terminatoryypd_S2StFfA1_
        .globl  _$ss5print_9separator10terminatoryypd_S2StFfA1_
        .weak_definition        _$ss5print_9separator10terminatoryypd_S2StFfA1_
        .p2align        2
_$ss5print_9separator10terminatoryypd_S2StFfA1_:
        .cfi_startproc
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        .cfi_def_cfa w29, 16
        .cfi_offset w30, -8
        .cfi_offset w29, -16
        adrp    x0, l_.str.3@PAGE
        add     x0, x0, l_.str.3@PAGEOFF
        mov     w8, #1
        mov     x1, x8
        mov     w8, #1
        and     w2, w8, #0x1
        bl      _$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC
        ldp     x29, x30, [sp], #16
        ret
        .cfi_endproc

        .private_extern _$s10TestSwiftc5MyAppVWOh
        .globl  _$s10TestSwiftc5MyAppVWOh
        .weak_definition        _$s10TestSwiftc5MyAppVWOh
        .p2align        2
_$s10TestSwiftc5MyAppVWOh:
        sub     sp, sp, #32
        stp     x29, x30, [sp, #16]
        add     x29, sp, #16
        str     x0, [sp, #8]
        ldr     x0, [x0, #8]
        bl      _swift_bridgeObjectRelease
        ldr     x0, [sp, #8]
        ldp     x29, x30, [sp, #16]
        add     sp, sp, #32
        ret

        .private_extern _$s10TestSwiftc5MyAppV4textACSS_tcfcfA_
        .globl  _$s10TestSwiftc5MyAppV4textACSS_tcfcfA_
        .p2align        2
_$s10TestSwiftc5MyAppV4textACSS_tcfcfA_:
        .cfi_startproc
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        .cfi_def_cfa w29, 16
        .cfi_offset w30, -8
        .cfi_offset w29, -16
        adrp    x0, l_.str@PAGE
        add     x0, x0, l_.str@PAGEOFF
        mov     w8, #13
        mov     x1, x8
        mov     w8, #1
        and     w2, w8, #0x1
        bl      _$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC
        ldp     x29, x30, [sp], #16
        ret
        .cfi_endproc

        .private_extern _$s10TestSwiftc5MyAppV4textACSS_tcfC
        .globl  _$s10TestSwiftc5MyAppV4textACSS_tcfC
        .p2align        2
_$s10TestSwiftc5MyAppV4textACSS_tcfC:
        .cfi_startproc
        ret
        .cfi_endproc

        .p2align        2
_$s10TestSwiftc5MyAppVwCP:
        sub     sp, sp, #32
        stp     x29, x30, [sp, #16]
        add     x29, sp, #16
        str     x0, [sp]
        ldr     x8, [x1]
        str     x8, [x0]
        ldr     x0, [x1, #8]
        str     x0, [sp, #8]
        bl      _swift_bridgeObjectRetain
        ldr     x0, [sp]
        ldr     x8, [sp, #8]
        str     x8, [x0, #8]
        ldp     x29, x30, [sp, #16]
        add     sp, sp, #32
        ret

        .p2align        2
_$s10TestSwiftc5MyAppVwxx:
        stp     x29, x30, [sp, #-16]!
        mov     x29, sp
        ldr     x0, [x0, #8]
        bl      _swift_bridgeObjectRelease
        ldp     x29, x30, [sp], #16
        ret

        .p2align        2
_$s10TestSwiftc5MyAppVwcp:
        sub     sp, sp, #32
        stp     x29, x30, [sp, #16]
        add     x29, sp, #16
        str     x0, [sp]
        ldr     x8, [x1]
        str     x8, [x0]
        ldr     x0, [x1, #8]
        str     x0, [sp, #8]
        bl      _swift_bridgeObjectRetain
        ldr     x0, [sp]
        ldr     x8, [sp, #8]
        str     x8, [x0, #8]
        ldp     x29, x30, [sp, #16]
        add     sp, sp, #32
        ret

        .p2align        2
_$s10TestSwiftc5MyAppVwca:
        sub     sp, sp, #32
        stp     x29, x30, [sp, #16]
        add     x29, sp, #16
        str     x0, [sp, #8]
        ldr     x8, [x1]
        str     x8, [x0]
        ldr     x0, [x1, #8]
        str     x0, [sp]
        bl      _swift_bridgeObjectRetain
        ldr     x8, [sp]
        ldr     x9, [sp, #8]
        ldr     x0, [x9, #8]
        str     x8, [x9, #8]
        bl      _swift_bridgeObjectRelease
        ldr     x0, [sp, #8]
        ldp     x29, x30, [sp, #16]
        add     sp, sp, #32
        ret

        .private_extern ___swift_memcpy16_8
        .globl  ___swift_memcpy16_8
        .weak_definition        ___swift_memcpy16_8
        .p2align        2
___swift_memcpy16_8:
        ldr     q0, [x1]
        str     q0, [x0]
        ret

        .p2align        2
_$s10TestSwiftc5MyAppVwta:
        sub     sp, sp, #32
        stp     x29, x30, [sp, #16]
        add     x29, sp, #16
        mov     x9, x0
        str     x9, [sp, #8]
        ldr     x8, [x1]
        str     x8, [x9]
        ldr     x8, [x1, #8]
        ldr     x0, [x9, #8]
        str     x8, [x9, #8]
        bl      _swift_bridgeObjectRelease
        ldr     x0, [sp, #8]
        ldp     x29, x30, [sp, #16]
        add     sp, sp, #32
        ret

        .p2align        2
_$s10TestSwiftc5MyAppVwet:
        sub     sp, sp, #48
        str     x0, [sp, #32]
        str     w1, [sp, #40]
        mov     w8, #1
        str     w8, [sp, #44]
        cbz     w1, LBB18_16
        b       LBB18_1
LBB18_1:
        ldr     w8, [sp, #40]
        mov     w9, #2147483647
        subs    w8, w8, w9
        b.ls    LBB18_13
        b       LBB18_2
LBB18_2:
        mov     w8, #0
        tbz     w8, #0, LBB18_4
        b       LBB18_3
LBB18_3:
        mov     w8, #0
        str     w8, [sp, #28]
        b       LBB18_11
LBB18_4:
        mov     w8, #1
        tbz     w8, #0, LBB18_6
        b       LBB18_5
LBB18_5:
        ldr     x8, [sp, #32]
        ldrb    w8, [x8, #16]
        str     w8, [sp, #28]
        b       LBB18_11
LBB18_6:
        mov     w8, #0
        tbz     w8, #0, LBB18_8
        b       LBB18_7
LBB18_7:
        ldr     x8, [sp, #32]
        ldrh    w8, [x8, #16]
        str     w8, [sp, #28]
        b       LBB18_11
LBB18_8:
        mov     w8, #0
        tbz     w8, #0, LBB18_10
        b       LBB18_9
LBB18_9:
        ldr     x8, [sp, #32]
        ldr     w8, [x8, #16]
        str     w8, [sp, #28]
        b       LBB18_11
LBB18_10:
        brk     #0x1
LBB18_11:
        ldr     w8, [sp, #28]
        str     w8, [sp, #24]
        cbz     w8, LBB18_13
        b       LBB18_12
LBB18_12:
        ldr     x8, [sp, #32]
        ldr     w11, [sp, #44]
        ldr     w9, [sp, #24]
        subs    w9, w9, #1
        mov     w10, #128
        lsl     w10, w9, w10
        mov     w9, #0
        ands    w11, w11, #0x1
        csel    w9, w9, w10, ne
        ldr     q0, [x8]
        fmov    w8, s0
        orr     w9, w8, w9
        mov     w8, #2147483647
        add     w8, w8, w9
        str     w8, [sp, #20]
        b       LBB18_17
LBB18_13:
        ldr     x9, [sp, #32]
        mov     w8, #-1
        ldr     x9, [x9, #8]
        str     x9, [sp, #8]
        mov     x10, #4294967296
        subs    x9, x9, x10
        str     w8, [sp, #16]
        b.hs    LBB18_15
        b       LBB18_14
LBB18_14:
        ldr     x8, [sp, #8]
        str     w8, [sp, #16]
        b       LBB18_15
LBB18_15:
        ldr     w8, [sp, #16]
        str     w8, [sp, #20]
        b       LBB18_17
LBB18_16:
        mov     w8, #-1
        str     w8, [sp, #20]
        b       LBB18_17
LBB18_17:
        ldr     w8, [sp, #20]
        add     w0, w8, #1
        add     sp, sp, #48
        ret

        .p2align        2
_$s10TestSwiftc5MyAppVwst:
        sub     sp, sp, #48
        str     x0, [sp, #24]
        str     w1, [sp, #36]
        mov     w8, #1
        str     w8, [sp, #40]
        mov     w8, #0
        mov     w9, #2147483647
        subs    w9, w2, w9
        str     w8, [sp, #44]
        b.ls    LBB19_2
        b       LBB19_1
LBB19_1:
        mov     w8, #1
        str     w8, [sp, #44]
        b       LBB19_2
LBB19_2:
        ldr     w8, [sp, #36]
        ldr     w9, [sp, #44]
        str     w9, [sp, #20]
        mov     w9, #2147483647
        subs    w8, w8, w9
        b.hi    LBB19_14
        b       LBB19_3
LBB19_3:
        ldr     w8, [sp, #20]
        cbnz    w8, LBB19_5
        b       LBB19_4
LBB19_4:
        b       LBB19_12
LBB19_5:
        ldr     w8, [sp, #20]
        subs    w8, w8, #1
        b.ne    LBB19_7
        b       LBB19_6
LBB19_6:
        ldr     x8, [sp, #24]
        strb    wzr, [x8, #16]
        b       LBB19_12
LBB19_7:
        ldr     w8, [sp, #20]
        subs    w8, w8, #2
        b.ne    LBB19_9
        b       LBB19_8
LBB19_8:
        ldr     x8, [sp, #24]
        strh    wzr, [x8, #16]
        b       LBB19_12
LBB19_9:
        ldr     w8, [sp, #20]
        subs    w8, w8, #4
        b.ne    LBB19_11
        b       LBB19_10
LBB19_10:
        ldr     x8, [sp, #24]
        str     wzr, [x8, #16]
        b       LBB19_12
LBB19_11:
        brk     #0x1
LBB19_12:
        ldr     w8, [sp, #36]
        cbz     w8, LBB19_26
        b       LBB19_13
LBB19_13:
        ldr     x9, [sp, #24]
        ldr     w8, [sp, #36]
        subs    w8, w8, #1
        str     x8, [x9, #8]
        b       LBB19_26
LBB19_14:
        ldr     w8, [sp, #40]
        ldr     w9, [sp, #36]
        mov     w10, #1
        subs    w9, w9, #1
        mov     w11, #2147483647
        subs    w9, w9, w11
        str     w9, [sp, #8]
        str     w10, [sp, #12]
        str     w9, [sp, #16]
        tbnz    w8, #0, LBB19_16
        b       LBB19_15
LBB19_15:
        ldr     w8, [sp, #4]
        ldr     w10, [sp, #8]
        mov     w9, #128
        lsr     w9, w10, w9
        add     w9, w9, #1
        and     w8, w8, w10
        str     w9, [sp, #12]
        str     w8, [sp, #16]
        b       LBB19_16
LBB19_16:
        ldr     w8, [sp, #20]
        ldr     x9, [sp, #24]
        ldr     w10, [sp, #12]
        ldr     w11, [sp, #16]
        str     w10, [sp]
        mov     w10, #0
        bfi     x11, x10, #32, #32
        mov     x10, #0
        mov.d   v0[0], x11
        mov.d   v0[1], x10
        str     q0, [x9]
        cbnz    w8, LBB19_18
        b       LBB19_17
LBB19_17:
        b       LBB19_25
LBB19_18:
        ldr     w8, [sp, #20]
        subs    w8, w8, #1
        b.ne    LBB19_20
        b       LBB19_19
LBB19_19:
        ldr     w8, [sp]
        ldr     x9, [sp, #24]
        strb    w8, [x9, #16]
        b       LBB19_25
LBB19_20:
        ldr     w8, [sp, #20]
        subs    w8, w8, #2
        b.ne    LBB19_22
        b       LBB19_21
LBB19_21:
        ldr     w8, [sp]
        ldr     x9, [sp, #24]
        strh    w8, [x9, #16]
        b       LBB19_25
LBB19_22:
        ldr     w8, [sp, #20]
        subs    w8, w8, #4
        b.ne    LBB19_24
        b       LBB19_23
LBB19_23:
        ldr     w8, [sp]
        ldr     x9, [sp, #24]
        str     w8, [x9, #16]
        b       LBB19_25
LBB19_24:
        brk     #0x1
LBB19_25:
        b       LBB19_26
LBB19_26:
        add     sp, sp, #48
        ret

        .globl  _$s10TestSwiftc5MyAppVMa
        .p2align        2
_$s10TestSwiftc5MyAppVMa:
        adrp    x8, _$s10TestSwiftc5MyAppVMf@PAGE
        add     x8, x8, _$s10TestSwiftc5MyAppVMf@PAGEOFF
        add     x0, x8, #8
        mov     x1, #0
        ret

        .private_extern _$sSa12_endMutationyyF
        .globl  _$sSa12_endMutationyyF
        .weak_definition        _$sSa12_endMutationyyF
        .p2align        2
_$sSa12_endMutationyyF:
        .cfi_startproc
        ldr     x8, [x20]
        str     x8, [x20]
        ret
        .cfi_endproc

        .section        __TEXT,__cstring,cstring_literals
l_.str:
        .asciz  "Hello, World!"

        .section        __TEXT,__const
        .globl  _$s10TestSwiftc5MyAppV4textSSvpMV
        .p2align        2
_$s10TestSwiftc5MyAppV4textSSvpMV:
        .space  4

        .section        __TEXT,__swift5_entry,regular,no_dead_strip
        .p2align        2
l_entry_point:
        .long   _main-l_entry_point

        .section        __DATA,__const
        .p2align        3
_$s10TestSwiftc5MyAppVWV:
        .quad   _$s10TestSwiftc5MyAppVwCP
        .quad   _$s10TestSwiftc5MyAppVwxx
        .quad   _$s10TestSwiftc5MyAppVwcp
        .quad   _$s10TestSwiftc5MyAppVwca
        .quad   ___swift_memcpy16_8
        .quad   _$s10TestSwiftc5MyAppVwta
        .quad   _$s10TestSwiftc5MyAppVwet
        .quad   _$s10TestSwiftc5MyAppVwst
        .quad   16
        .quad   16
        .long   65543
        .long   2147483647

        .section        __TEXT,__const
l_.str.1:
        .asciz  "TestSwiftc"

        .private_extern _$s10TestSwiftcMXM
        .globl  _$s10TestSwiftcMXM
        .weak_definition        _$s10TestSwiftcMXM
        .p2align        2
_$s10TestSwiftcMXM:
        .long   0
        .long   0
        .long   (l_.str.1-_$s10TestSwiftcMXM)-8

l_.str.2:
        .asciz  "MyApp"

        .globl  _$s10TestSwiftc5MyAppVMn
        .p2align        2
_$s10TestSwiftc5MyAppVMn:
        .long   81
        .long   (_$s10TestSwiftcMXM-_$s10TestSwiftc5MyAppVMn)-4
        .long   (l_.str.2-_$s10TestSwiftc5MyAppVMn)-8
        .long   (_$s10TestSwiftc5MyAppVMa-_$s10TestSwiftc5MyAppVMn)-12
        .long   (_$s10TestSwiftc5MyAppVMF-_$s10TestSwiftc5MyAppVMn)-16
        .long   1
        .long   2

        .section        __DATA,__const
        .p2align        3
_$s10TestSwiftc5MyAppVMf:
        .quad   _$s10TestSwiftc5MyAppVWV
        .quad   512
        .quad   _$s10TestSwiftc5MyAppVMn
        .long   0
        .space  4

        .private_extern "_symbolic _____ 10TestSwiftc5MyAppV"
        .section        __TEXT,__swift5_typeref
        .globl  "_symbolic _____ 10TestSwiftc5MyAppV"
        .weak_definition        "_symbolic _____ 10TestSwiftc5MyAppV"
        .p2align        1
"_symbolic _____ 10TestSwiftc5MyAppV":
        .byte   1
        .long   (_$s10TestSwiftc5MyAppVMn-"_symbolic _____ 10TestSwiftc5MyAppV")-1
        .byte   0

        .private_extern "_symbolic SS"
        .globl  "_symbolic SS"
        .weak_definition        "_symbolic SS"
        .p2align        1
"_symbolic SS":
        .space  2,83
        .byte   0

        .section        __TEXT,__swift5_reflstr
l___unnamed_1:
        .asciz  "text"

        .section        __TEXT,__swift5_fieldmd
        .p2align        2
_$s10TestSwiftc5MyAppVMF:
        .long   "_symbolic _____ 10TestSwiftc5MyAppV"-_$s10TestSwiftc5MyAppVMF
        .long   0
        .short  0
        .short  12
        .long   1
        .long   2
        .long   ("_symbolic SS"-_$s10TestSwiftc5MyAppVMF)-20
        .long   (l___unnamed_1-_$s10TestSwiftc5MyAppVMF)-24

        .section        __TEXT,__cstring,cstring_literals
l_.str.3:
        .asciz  "\n"

l_.str.4:
        .asciz  " "

        .section        __TEXT,__swift5_types
        .p2align        2
l_$s10TestSwiftc5MyAppVHn:
        .long   _$s10TestSwiftc5MyAppVMn-l_$s10TestSwiftc5MyAppVHn

        .private_extern ___swift_reflection_version
        .section        __TEXT,__const
        .globl  ___swift_reflection_version
        .weak_definition        ___swift_reflection_version
        .p2align        1
___swift_reflection_version:
        .short  3

        .no_dead_strip  _main
        .no_dead_strip  _$s10TestSwiftc5MyAppV4textSSvpfi
        .no_dead_strip  _$s10TestSwiftc5MyAppV4textSSvg
        .no_dead_strip  _$s10TestSwiftc5MyAppV4mainyyFZ
        .no_dead_strip  _$s10TestSwiftc5MyAppV4textSSvpMV
        .no_dead_strip  l_entry_point
        .no_dead_strip  _$s10TestSwiftc5MyAppVMn
        .no_dead_strip  _$s10TestSwiftc5MyAppVMa
        .no_dead_strip  _$s10TestSwiftc5MyAppVN
        .no_dead_strip  _$s10TestSwiftc5MyAppVMF
        .no_dead_strip  l_$s10TestSwiftc5MyAppVHn
        .no_dead_strip  ___swift_reflection_version
        .linker_option "-lswiftSwiftOnoneSupport"
        .linker_option "-lswiftCore"
        .linker_option "-lswift_Concurrency"
        .linker_option "-lswift_StringProcessing"
        .linker_option "-lobjc"
        .section        __DATA,__objc_imageinfo,regular,no_dead_strip
L_OBJC_IMAGE_INFO:
        .long   0
        .long   84346688

        .globl  _$s10TestSwiftc5MyAppVN
        .alt_entry      _$s10TestSwiftc5MyAppVN
.set _$s10TestSwiftc5MyAppVN, _$s10TestSwiftc5MyAppVMf+8
.subsections_via_symbols
```
### swift交互式解释器
```bash
swift repl
```
```bash
tangjianfeng@tangjianfengdeMacBook-Air MyApp %  swift repl
Welcome to Apple Swift version 5.7.2 (swiftlang-5.7.2.135.5 clang-1400.0.29.51).
Type :help for assistance.
  1> print("swift repl")
swift repl
  2> let a="100"
a: String = "100"
  3> Int(a)
$R0: Int? = 100
  4> let b=$R0+50
expression failed to parse:
error: repl.swift:4:7: error: value of optional type 'Int?' must be unwrapped to a value of type 'Int'
let b=$R0+50
      ^

repl.swift:4:7: note: coalesce using '??' to provide a default when the optional value contains 'nil'
let b=$R0+50
      ^
      (   ?? <#default value#>)

repl.swift:4:7: note: force-unwrap using '!' to abort execution if the optional value contains 'nil'
let b=$R0+50
      ^
         !


  4> let b=$R0!+50
b: Int = 150
```
帮助
```bash
:help
```
退出
```bash
:quit
```