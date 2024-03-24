const rent = require("./RentListings");
const sale = require("./SaleListings");
const owners = require("./readCSV");
const brokers = require("./broker");
const csvWriter = require("./Writer");

async function runScript() {

    try{
        // get the rental data
        let rentalListing = await rent.getRentListings();
        console.log("rentalListings are ");
        console.log(rentalListing);
        
        // get the broker data for rented properties
        rentalListing = await getBrokerInfo(rentalListing);

        // // get the sale data
        let saleListing = await sale.getSaleListings();
        console.log("saleListings are ");
        console.log(saleListing);

        // get the broker data for sale properties info
        saleListing = await getBrokerInfo(saleListing);

        // get ALL owners info
        let ownerData = await owners.getOwners();
        console.log("onerData is ", ownerData);
 

        // getting owner and rent property mapping
        let rentData = await mapPropertyAndOwners(rentalListing, ownerData);
        console.log("rentData = ", rentData);

        // getting owner and sale property mapping
        let saleData = await mapPropertyAndOwners(saleListing, ownerData);
        console.log("saleData = ", saleData); 

        //write rental listings in csv
        await csvWriter.writeInCSV(rentData, "rent");
        await csvWriter.writeInCSV(saleData, "sale");
    } catch(e) {
        console.error("error in runScript", e);
    }
}

async function mapPropertyAndOwners(propData, ownerData) {
try{
    let result = [];
    for(let i=0;i<propData.length;i++){
        //get owner name from address
        console.log("street name = ", propData[i].streetName);
        let oInfo = await getOwnerInfo(propData[i].streetName, ownerData);
        propData[i].ownerName = oInfo;
        console.log(oInfo);
        result.push(propData[i]); 
    }
    return result;
} catch(e){
    console.error("error in mapPropertyAndOwners", e);
    throw(e);
}

}

async function getOwnerInfo(prop, ownerData) {
    try{
        for(let i=0;i<ownerData.length;i++) {
            let search = ownerData[i].ST_NUM + " "+ ownerData[i].ST_NAME;
            let si = ownerData[i].ST_NAME;
            if((prop.toLowerCase()).includes(search.toLowerCase())) {
                console.log("owner found");
                return ownerData[i].OWNER;
            }
            else if((prop.toLowerCase()).includes(si.toLowerCase())) {
                console.log("owner found");
                return ownerData[i].OWNER;
            }
        }

        return "BOSTON LLC"
    } catch(e){
        console.error("error in getOwnerInfo", e);
        throw(e);
    }
}

async function getBrokerInfo(property) {
    try{
        let result =[];
        for(let i=0;i<property.length;i++) {
            let info = await brokers.getBrokerInfo(property[i].zpid);
            property[i].brokerName=info?.displayName;
            property[i].brokerBusinessName=info?.businessName;
            property[i].brokerPhonenumber=info?.phoneNumber;
            result.push(property[i]);
        }
        return result;
    } catch(e){
        console.error("error in getBrokerInfo", e);
        throw(e);
    }

}
runScript();