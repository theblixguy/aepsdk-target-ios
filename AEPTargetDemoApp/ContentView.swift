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

import AEPServices
import AEPTarget
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Prefetch") {
                prefetch()
            }.padding(10)

            Button("Location displayed") {
                locationDisplayed()
            }.padding(10)

            Button("Location clicked") {
                locationClicked()
            }.padding(10)

            Button("Reset Experience") {
                resetExperience()
            }.padding(10)

            Button("Get Third Party Id") {
                getThirdPartyId()
            }.padding(10)

            Button("Get Tnt Id") {
                getTntId()
            }.padding(10)

            Button("Set Third Party Id") {
                setThirdPartyId()
            }.padding(10)
        }
    }

    func prefetch() {
        Target.prefetchContent(
            prefetchObjectArray: [
                TargetPrefetch(name: "aep-loc-1", targetParameters: nil),
                TargetPrefetch(name: "aep-loc-2", targetParameters: nil),
            ],
            targetParameters: nil, completion: nil
        )
    }

    func locationDisplayed() {
        Target.displayedLocations(mboxNames: ["aep-loc-1", "aep-loc-2"], targetParameters: TargetParameters(parameters: ["mbox_parameter_key": "mbox_parameter_value"], profileParameters: ["name": "Smith"], order: TargetOrder(id: "id1", total: 1.0, purchasedProductIds: ["ppId1"]), product: TargetProduct(productId: "pId1", categoryId: "cId1")))
    }

    func locationClicked() {
        Target.clickedLocation(mboxName: "aep-loc-1", targetParameters: TargetParameters(parameters: ["mbox_parameter_key": "mbox_parameter_value"], profileParameters: ["name": "Smith"], order: TargetOrder(id: "id1", total: 1.0, purchasedProductIds: ["ppId1"]), product: TargetProduct(productId: "pId1", categoryId: "cId1")))
    }

    func resetExperience() {
        Target.resetExperience()
    }

    func getThirdPartyId() {
        Target.getThirdPartyId { id in
            Log.debug(label: "AEPTargetDemoApp", id)
        }
    }

    func getTntId() {
        Target.getTntId { id in
            Log.debug(label: "AEPTargetDemoApp", id)
        }
    }

    func setThirdPartyId() {
        Target.setThirdPartyId("SomeThirdPartyId")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
