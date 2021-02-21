/*
 Copyright 2021 Adobe. All rights reserved.
 This file is licensed to you under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License. You may obtain a copy
 of the License at http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software distributed under
 the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
 OF ANY KIND, either express or implied. See the License for the specific language
 governing permissions and limitations under the License.
 */
import Foundation

@objc(AEPTargetRequestObject)
public class TargetRequest: NSObject, Codable {
    internal let mBoxName: String
    internal let defaultContent: String
    internal var responseId: String?
    internal let targetParameters: TargetParameters?

    public init(mBoxName: String, defaultContent: String, targetParameters: TargetParameters? = nil) {
        self.mBoxName = mBoxName
        self.defaultContent = defaultContent
        self.targetParameters = targetParameters
    }
}
