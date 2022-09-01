class findFacilityAtCluster{
    
    checkFacility(facility){
        const apartmentFacilities = require("./dataApartment");
        const data = []
        let blabla = apartmentFacilities.map(function(elem){
            
            if(elem.facilities[facility] == true){
                data.push(elem.cluster)
            }
            else{
                //pass
            }
        });
        console.log(data)
    }
}

module.exports = findFacilityAtCluster;