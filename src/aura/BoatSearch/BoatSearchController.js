/**
 * Created on 23/03/2019.
 */
({
    onFormSubmit: function(cmp, event, helper){
        var formData = event.getParam("formData");
        var boatSearchResults = cmp.find('boatSearchResults'); //child component id
        boatSearchResults.search(formData.boatTypeId); //calling aura:method from child component baotSearchResults
    },
})