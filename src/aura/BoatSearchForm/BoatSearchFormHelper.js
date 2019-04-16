({        
    getBoatTypes: function(cmp){
        var action = cmp.get("c.GetBoatTypes");
        action.setCallback(this, function(response){
            var state = response.getState();
            var opts = [];
            if (state === "SUCCESS") {
                var allValues = response.getReturnValue();

                if (allValues != undefined && allValues.length > 0) {
                    opts.push({
                        class: "optionClass",
                        label: "All Types",
                        value: "ALL"
                    });
                }
                for (var i = 0; i < allValues.length; i++) {
                    opts.push({
                        class: "optionClass",
                        label: allValues[i].Name,
                        value: allValues[i].Id
                    });
                }
                //console.log('opts: '+JSON.stringify(opts));
                cmp.set('v.options', opts);
                cmp.set('v.selectedValue', 'ALL');

                /*setTimeout(function () {
                    var response = {
                        selectedType: 0,
                        options: opts
                    };
                    
                    onResponse.call(null, response);
                }, 2000);*/
            }
        });
        $A.enqueueAction(action);             
        
    },        
})