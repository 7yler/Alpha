Haystack
========

[![Build Status](https://travis-ci.org/Legoless/Haystack.svg)](https://travis-ci.org/Legoless/Haystack) [![Version Badge](https://cocoapod-badges.herokuapp.com/v/Haystack/badge.png)](http://www.google.com)  [![Badge w/ Platform](https://cocoapod-badges.herokuapp.com/p/NSStringMask/badge.svg)](https://cocoadocs.org/docsets/NSStringMask)
[![Pod License](http://img.shields.io/cocoapods/l/Haystack.svg?style=flat)](http://opensource.org/licenses/MIT)

Haystack SDK contains a multiple resources for **iOS** developers, including a collection of simple Objective-C classes and categories that fit in almost every project. Most of these classes are not large or structured enough to fit in a special library or framework, but are regurarely needed throughout the most projects you are working on. Basically it is meant to fill the void of classes without entire libraries.

Project is actively developed and as the Apple SDK's changes, project is updated. Note that the project is not finished and might contain bugs. Feel free to open an issue.

*Please contact me for contributions to the project. If you notice an useful extension to the iOS SDK's that can be included in the SDK, please contact us.*

Update
========
Certain design-oriented classes and categories are in the process of being moved to the DesignKit project, to the base module. Haystack will still serve as a base project for all common functionalities.

Contents
========
Haystack is **not limited only** to Objective-C code, but contains multiple resources used in development. Resources are divided into sections, each of which is represented by a folder of the same name:

- **Pods**

   Example podfiles that are used in many of the commercial projects, including more advanced configurations and even podspec files to create new specifications.  
   
   
- **Scripts**

   Handful of bash and Ruby scripts that help with iOS development. Scripts include management of Xcode SDK's, copying them around, which is useful for Beta development.

- **SDK**

   Contains Objective-C classes and categories that are installed part of a CocoaPods install. The classes are general and extend base Apple SDK's.  
   
   - **[Categories](https://github.com/Legoless/Haystack/blob/master/Wiki/Categories.md)**
     - *Foundation*
        - NSArray+Class
        - NSData+Base64
        - NSDate+Additional
        - NSDate+Timestamp
        - NSDictionary+Class
        - NSObject+Property
        - NSObject+PropertyList
        - NSObject+Runtime
        - NSObject+Swizzle
        - NSString+Additional
        - NSString+Random
        - NSString+Validation
     - *UIKit*
        - UIAlertView+Short
        - UIApplication+Information
        - UIApplication+Screenshot
        - UIApplication+Version
        - UIButton+Position
        - UIColor+Create
        - UIColor+Flat
        - UIDevice+Capabilities
        - UIDevice+DeviceInfo
        - UIDevice+Hardware
        - UIDevice+Network
        - UIDevice+Software
        - UIFont+SmallCaps
        - UIView+Cell
        - UIView+Debug
        - UIView+Hierarchy
        - UIView+Snapshot
        - UIViewController+BackgroundImage
   - **[Classes](https://github.com/Legoless/Haystack/blob/master/Wiki/Classes.md)**
     - *HSMath*
     - *HSUnitFormatter*
     - *HSWeakPointer*

- **Templates**

   Contains Liftoff templates for different types of iOS or Mac OS X projects.
   
- **Tests**

   Contains Rspec style tests for Haystack SDK.

- **Wiki**

   Development guidelines, project initialization and deployment workflows, App Store suggestions, Wikis for development tools, instructions, tutorials, most useful libraries and more.  
   
   - [Categories](https://github.com/Legoless/Haystack/blob/master/Wiki/Categories.md)
   - [Classes](https://github.com/Legoless/Haystack/blob/master/Wiki/Classes.md)
   - [GitIgnore](https://github.com/Legoless/Haystack/blob/master/Wiki/GitIgnore.md)
   - [Libraries](https://github.com/Legoless/Haystack/blob/master/Wiki/Libraries.md)

Usage
=======

Documentation
-------
All header files and fully documented for ease of use. Only method stubs are displayed in readme, to keep it short. The documentation is in DoxyGen format, allowing Xcode to parse documentation headers.

Installation & Setup
--------
You can install the SDK via CocoaPods:
```
pod 'Haystack'
```

Or manually drag & drop `Haystack` folder into Xcode project, then follow the **Using in project** section.

Using in project
--------
It is recommended for you to add Haystack.h file into precompiled header (.pch) file. That way all classes and categories are added to all files and you can use them everywhere throughout the project.

Documents
=======
Haystack SDK includes documents that can be used to improve development workflow.

- **Deployment workflow**
  - Automated testing
  - Continuous Integration
- **Coding guidelines**
- **Development tools**

Contact
======

Dal Rupnik

- [legoless](https://github.com/legoless) on **GitHub**
- [@thelegoless](https://twitter.com/thelegoless) on **Twitter**
- [legoless@arvystate.net](mailto:legoless@arvystate.net)

License
======

MIT Licensed. See [LICENSE](https://github.com/Legoless/Haystack/blob/master/LICENSE) file for more information.
