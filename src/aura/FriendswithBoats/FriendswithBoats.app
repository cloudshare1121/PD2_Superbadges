<!--
 - Created 20/03/2019.
 -->

<aura:application description="FriendswithBoats" extends="force:slds">
    <div class="c-container">
        <lightning:layout pullToBoundary="medium">
            <lightning:layoutItem flexibility="auto" padding="horizontal-medium">
                <div class="custom-box">
                    <lightning:card title="Find a Boat" class="findABoat">
                        <p class="slds-p-horizontal_small">
                            <c:BoatSearchForm />
                        </p>
                    </lightning:card>
                </div>
                <br/>

                <div class="custom-box">
                    <lightning:card title="Matching Boats">
                        <p class="slds-p-horizontal_small">
                            <c:BoatSearchResults />
                        </p>
                    </lightning:card>
                </div>
            </lightning:layoutItem>
            <lightning:layoutItem flexibility="auto" padding="horizontal-medium">
                <div class="custom-box">
                	<lightning:card title="Boat Details">
                        <p class="slds-p-horizontal_small">
                            <c:BoatDetails />
                        </p>
                    </lightning:card>
                
                </div>
            </lightning:layoutItem>
        </lightning:layout>
    </div>

</aura:application>