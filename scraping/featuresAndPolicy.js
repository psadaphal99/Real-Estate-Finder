const axios = require("axios");

let config = {
  'operationName': 'BuildingQuery',
  'variables': {
    'buildingKey': 'BhZhsN',
    'cache': false,
    'latitude': null,
    'longitude': null,
    'lotId': null,
    'update': false
  },
  'extensions': {
    'persistedQuery': {
      'version': 1,
      'sha256Hash': '363e5a06e86e920a85592e0aff0a72f9b8344d2aeb6620401c04397bd59ce4b6'
    }
  }
}

module.exports.getfeaturesPolicies=async (buildingKey)=>{
  try{
    config.buildingKey=buildingKey;
    const response = await axios.post(
      'https://www.zillow.com/graphql/',
      config,
      {
        headers: {
          'authority': 'www.zillow.com',
          'accept': '*/*',
          'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
          'client-id': 'vertical-living',
          'content-type': 'application/json',
          'cookie': 'zguid=24|%241c07ad5a-013a-414c-8de0-e6dd3f1927f3; zjs_anonymous_id=%221c07ad5a-013a-414c-8de0-e6dd3f1927f3%22; zg_anonymous_id=%22b12cfb56-8683-4de0-bc96-03c0bb46b9e2%22; _ga=GA1.2.2117336386.1698620681; _pxvid=8a6278d6-76af-11ee-94ad-2a6c7c036f86; _gcl_au=1.1.563082542.1698620682; _fbp=fb.1.1698620682482.689885454; __pdst=b6c851a3d9c743e4ba822047439655b9; _pin_unauth=dWlkPVlXSmhNamt6TVRNdE9EZzNNeTAwTkRBMExUazNaR1F0TkRFeU9UUTJOR1F5WkRFMQ; userid=X|3|702ce64ad44f3ad1%7C10%7CXtSO4hXgdJm8kSC_So0CCsRaWJ87cVMdTbGo5u_zpuQ%3D; loginmemento=1|1972a1db38f6333a857fe88b13c63eea181707c7780c2c7715bd6c0324d3d2a1; zjs_user_id=%22X1-ZUrg6lfja7in7t_2dooi%22; optimizelyEndUserId=oeu1698645874828r0.8007526115552703; zgcus_lbut=; zgcus_aeut=232535335; zgcus_ludi=33513999-76ea-11ee-b26b-0674b1233ce2-23253; _cs_c=0; _hp2_id.1215457233=%7B%22userId%22%3A%224099756662114896%22%2C%22pageviewId%22%3A%22605567542308427%22%2C%22sessionId%22%3A%223089545390150217%22%2C%22identity%22%3A%22X1-ZUrg6lfja7in7t_2dooi%22%2C%22trackerVersion%22%3A%224.0%22%2C%22identityField%22%3Anull%2C%22isIdentified%22%3A1%7D; _cs_id=3b1636b4-1685-afdb-eb75-3f5af3fbffb6.1698645875.1.1698645896.1698645875.1.1732809875688; FSsampler=1760860852; _derived_epik=dj0yJnU9REdoVzRoeHdMaHhuMWwxMGNUYnl3S0F5WEgxVVJuSDAmbj1jYUdIajg5OU1zY0hSR1NVUmFlMjF3Jm09NCZ0PUFBQUFBR1Z3TDQ0JnJtPTQmcnQ9QUFBQUFHVndMNDQmc3A9Mg; _gid=GA1.2.873077960.1702010489; __gads=ID=0c91ea0489b35baf:T=1698620682:RT=1702010491:S=ALNI_Ma9ZynSBEfz4TNDFg7CcPq19Nm9AQ; __gpi=UID=000009ff6f93d04b:T=1698620682:RT=1702010491:S=ALNI_MZQ0YGs8VkLBtuAB5ScLxqP0iAPyA; _clck=tmmp43%7C2%7Cfhd%7C0%7C1397; tfpsi=4adc2fdc-d171-450a-a979-6b11ddb737c2; _gat=1; JSESSIONID=F51E31E047AA4C7BCADAAF84B47AE7F9; zgsession=1|14c5255b-0005-4dfb-9f59-b8cf1d7ed552; ZILLOW_SID=1|AAAAAVVbFRIBVVsVEoOUe0VDBsOm7UzCuvzS2ryf1bO2RGtrP%2FmlP6uOxCFhi3WENTF57nw1UpR6USeT3iut0AWD0U1V%2BBF%2Fiw; AWSALB=3pI4rh3N/eUFwdQ0VwAAaXpPn3y8FWAE8oBFba6gzQ5g8rAerGJ4bzpi0lpzHJ3EI7SvaXCxlfGl+UToekVvAHhBydCHYI/JNBwDKBggvqDEu4VOWdPNmezbogJv; AWSALBCORS=3pI4rh3N/eUFwdQ0VwAAaXpPn3y8FWAE8oBFba6gzQ5g8rAerGJ4bzpi0lpzHJ3EI7SvaXCxlfGl+UToekVvAHhBydCHYI/JNBwDKBggvqDEu4VOWdPNmezbogJv; _pxff_cc=U2FtZVNpdGU9TGF4Ow==; pxcts=4151d3ac-9584-11ee-a819-ce5e0e2e8c91; _pxff_cfp=1; _pxff_bsco=1; DoubleClickSession=true; _uetsid=0ee02b80958411ee8f7539c19bf9b2ad; _uetvid=8b55237076af11ee94718b632ddb8344; _px3=9b5b7a2cb14ddab68180979ddf75f3903876fe3e6b844a77e764d184260786ea:Nu9ed7pM5gQaTNa08CZf+FWu1ie7WTkHVGhfxSUyYl6QIxDFZrnboP79MQ2vl+kqIVhxe4UVZ0dUKVTM81K1vg==:1000:4tXjqEkCL0MtRJKVMso4u8Ejr/AkeLyLLFnKrdmh8G0eCFMsBf5l+BkNgAkcA2osCDzX3vC4Z0PC24f9oe0SWFevEKLqP+asYsiKyRDDTiATwewAC8qjXm8j4+zI4/u1xhGqnL5odzyV60H3qQcsJUphHh0d2GqKSft7ZOw4AC7HRLeMOIUsoCtg+baDcnc/7kOV3QosKuQhzx4d8lvRnQkbQAq2WY2fkmnsZjLjjD4=; search=6|1704602579318%7Crect%3D42.43188091148111%2C-70.65343683433534%2C42.16270187515638%2C-71.60100763511659%26rid%3D44269%26disp%3Dmap%26mdm%3Dauto%26p%3D1%26z%3D1%26listPriceActive%3D1%26fs%3D0%26fr%3D1%26mmm%3D0%26rs%3D0%26ah%3D0%26singlestory%3D0%26housing-connector%3D0%26abo%3D0%26garage%3D0%26pool%3D0%26ac%3D0%26waterfront%3D0%26finished%3D0%26unfinished%3D0%26cityview%3D0%26mountainview%3D0%26parkview%3D0%26waterview%3D0%26hoadata%3D1%26zillow-owned%3D0%263dhome%3D0%26featuredMultiFamilyBuilding%3D0%26excludeNullAvailabilityDates%3D0%26commuteMode%3Ddriving%26commuteTimeOfDay%3Dnow%09%0944269%09%7B%22isList%22%3Atrue%2C%22isMap%22%3Atrue%7D%09%09%09%09%09; _clsk=zggvh9%7C1702010579905%7C5%7C0%7Ck.clarity.ms%2Fcollect',
          'origin': 'https://www.zillow.com',
          //'referer': 'https://www.zillow.com/apartments/boston-ma/the-laneway/5Xj8g9/',
          'sec-ch-ua': '"Not_A Brand";v="8", "Chromium";v="120", "Google Chrome";v="120"',
          'sec-ch-ua-mobile': '?0',
          'sec-ch-ua-platform': '"macOS"',
          'sec-fetch-dest': 'empty',
          'sec-fetch-mode': 'cors',
          'sec-fetch-site': 'same-origin',
          'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
        }
      }
    );
    let f1 = response.data.data.building.amenityDetails.customAmenities.rawAmenities;
    let f2 = response.data.data.building.amenityDetails.unitFeatures;
    let features = f1.concat(f2);
    let policy=[];
    let pet = response.data.data.building.buildingAttributes.petPolicyDescription;
    let parking = response.data.data.building.buildingAttributes.parkingDescription || "Flexible Parking available";
    let lease = response.data.data.building.buildingAttributes.leaseLengths || "Flexible Lease Policy"; 

    return {
      features: features,
      policies: [parking, lease]
    }

  } catch(e){
    console.error("error in properties", e);
    throw(e);
  } 
}

module.exports.getfeaturesPolicies("5Xjwqv").then(s=>{console.log(s)});

// features
// customPropertyAmenities
// customUnitAmenities
// utilitiesIncluded

// data.building.amenityDetails.customAmenities.rawAmenities || data.building.amenityDetails.unitFeatures."customAmenities" //5020

// data.building.buildingAttributes petPolicyDescription
// parkingDescription
// leaseLengths