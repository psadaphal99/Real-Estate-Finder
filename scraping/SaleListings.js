const axios = require("axios");
const featPolicy = require("./featuresAndPolicy");
module.exports.getSaleListings = async()=>{
    try{
        let searchResults;
        const response = await axios.put(
            'https://www.zillow.com/async-create-search-page-state',
            {
              'searchQueryState': {
                'pagination': {},
                'isMapVisible': true,
                'mapBounds': {
                  'west': -71.60100763511659,
                  'east': -70.65343683433534,
                  'south': 42.16270187515638,
                  'north': 42.43188091148111
                },
                'regionSelection': [
                  {
                    'regionId': 44269,
                    'regionType': 6
                  }
                ],
                'filterState': {
                  'isAllHomes': {
                    'value': true
                  },
                  'sortSelection': {
                    'value': 'globalrelevanceex'
                  }
                },
                'isListVisible': true
              },
              'wants': {
                'cat1': [
                  'listResults',
                  'mapResults'
                ],
                'cat2': [
                  'total'
                ]
              },
              'requestId': 6,
              'isDebugRequest': false
            },
            {
              headers: {
                'authority': 'www.zillow.com',
                'accept': '*/*',
                'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
                'content-type': 'application/json',
                'cookie': 'zguid=24|%241c07ad5a-013a-414c-8de0-e6dd3f1927f3; zjs_anonymous_id=%221c07ad5a-013a-414c-8de0-e6dd3f1927f3%22; zg_anonymous_id=%22b12cfb56-8683-4de0-bc96-03c0bb46b9e2%22; _ga=GA1.2.2117336386.1698620681; _pxvid=8a6278d6-76af-11ee-94ad-2a6c7c036f86; _gcl_au=1.1.563082542.1698620682; _fbp=fb.1.1698620682482.689885454; __pdst=b6c851a3d9c743e4ba822047439655b9; _pin_unauth=dWlkPVlXSmhNamt6TVRNdE9EZzNNeTAwTkRBMExUazNaR1F0TkRFeU9UUTJOR1F5WkRFMQ; userid=X|3|702ce64ad44f3ad1%7C10%7CXtSO4hXgdJm8kSC_So0CCsRaWJ87cVMdTbGo5u_zpuQ%3D; loginmemento=1|1972a1db38f6333a857fe88b13c63eea181707c7780c2c7715bd6c0324d3d2a1; zjs_user_id=%22X1-ZUrg6lfja7in7t_2dooi%22; _derived_epik=dj0yJnU9Z1dfSjRLakF1VzBqNjdmR1NWeFlwVVpuTFNvUUpxeTgmbj12WlVCZ0J6MTJNNFYtNE9KYzF4VDNRJm09NCZ0PUFBQUFBR1VfTUN3JnJtPTQmcnQ9QUFBQUFHVV9NQ3cmc3A9NA; optimizelyEndUserId=oeu1698645874828r0.8007526115552703; zgcus_lbut=; zgcus_aeut=232535335; zgcus_ludi=33513999-76ea-11ee-b26b-0674b1233ce2-23253; _cs_c=0; _hp2_id.1215457233=%7B%22userId%22%3A%224099756662114896%22%2C%22pageviewId%22%3A%22605567542308427%22%2C%22sessionId%22%3A%223089545390150217%22%2C%22identity%22%3A%22X1-ZUrg6lfja7in7t_2dooi%22%2C%22trackerVersion%22%3A%224.0%22%2C%22identityField%22%3Anull%2C%22isIdentified%22%3A1%7D; _cs_id=3b1636b4-1685-afdb-eb75-3f5af3fbffb6.1698645875.1.1698645896.1698645875.1.1732809875688; _gid=GA1.2.1472286222.1701817112; FSsampler=1760860852; tfpsi=7e59099f-8c32-41a7-ac9a-294d7037ee55; _clck=tmmp43%7C2%7Cfha%7C0%7C1397; JSESSIONID=255156BC955E4076F669DBFD6430E7BD; zgsession=1|61641e8f-67b7-4fbe-b260-58e725ee8bdd; ZILLOW_SID=1|AAAAAVVbFRIBVVsVEuEenLSriJdP2ThGP8lHI4lctbQmUWBcEEX4drMmMq7FZLhyPZ9F0LW%2BZ67s88IsIXOlQ3%2FSb6JGKUHZYg; AWSALB=bIf3eTZbttQSYS0x5IMaCIHGSH2k7P2kbqJh6ZRDTlkM8OSfzubVGjnnKkZJJeWVXGcSCMkkd5L4wGtYhIbTsszMCQ1j+zFTrNu8bnEqymYvbtvx3WH+tNhRw8S/; AWSALBCORS=bIf3eTZbttQSYS0x5IMaCIHGSH2k7P2kbqJh6ZRDTlkM8OSfzubVGjnnKkZJJeWVXGcSCMkkd5L4wGtYhIbTsszMCQ1j+zFTrNu8bnEqymYvbtvx3WH+tNhRw8S/; _gat=1; _pxff_cc=U2FtZVNpdGU9TGF4Ow==; pxcts=e5171303-93c2-11ee-8fe6-3a9b5c9da70a; _pxff_cfp=1; _pxff_bsco=1; DoubleClickSession=true; _px3=8dd10ae75a04e2343a62f4d19a34de922a089472fb8cb29f52fe0c82cb2c2f99:gT/z5c19GWq+jC0xwNLMLM6WaGuU7KC4x5/pwTMI0s48MWnGPSzrp4F6NSRmQ5HhwNgCbCTtxV4n4aNQiu4x7Q==:1000:uGNmKdWiI3ZMyrx/DkxHxKsdNMvc0whIoZER45zxlYmx1TUqkd7/CfvFOFBbj1PsZTHVDBFEANL++u/8jfw+E4I1WhjDq8S3ZwigpUWjsvok8yrfXwCXQQ7SdoZfA6kuIvq5Qfx1jzKgsj9DBDQcYusnNCdQHyPK59aFI1HjKrLfeOKuSBplc6/r323PRUivO77Vl/9++R/X7lgNOnf0+TTZzoCYZ92RY/vNWPNpg2E=; _uetsid=d0b272a093c111eea442354d7df671f6; _uetvid=8b55237076af11ee94718b632ddb8344; __gads=ID=0c91ea0489b35baf:T=1698620682:RT=1701817578:S=ALNI_Ma9ZynSBEfz4TNDFg7CcPq19Nm9AQ; __gpi=UID=000009ff6f93d04b:T=1698620682:RT=1701817578:S=ALNI_MZQ0YGs8VkLBtuAB5ScLxqP0iAPyA; search=6|1704409631527%7Crect%3D42.57109575299352%2C-70.65343683433534%2C42.022580254676%2C-71.60100763511659%26rid%3D44269%26disp%3Dmap%26mdm%3Dauto%26p%3D1%26z%3D1%26listPriceActive%3D1%26fs%3D1%26fr%3D0%26mmm%3D0%26rs%3D0%26ah%3D0%26singlestory%3D0%26housing-connector%3D0%26abo%3D0%26garage%3D0%26pool%3D0%26ac%3D0%26waterfront%3D0%26finished%3D0%26unfinished%3D0%26cityview%3D0%26mountainview%3D0%26parkview%3D0%26waterview%3D0%26hoadata%3D1%26zillow-owned%3D0%263dhome%3D0%26featuredMultiFamilyBuilding%3D0%26commuteMode%3Ddriving%26commuteTimeOfDay%3Dnow%09%0944269%09%7B%22isList%22%3Atrue%2C%22isMap%22%3Atrue%7D%09%09%09%09%09; _clsk=gmkkqi%7C1701817632025%7C7%7C0%7Cj.clarity.ms%2Fcollect',
                'origin': 'https://www.zillow.com',
                'referer': 'https://www.zillow.com/boston-ma/?searchQueryState=%7B%22pagination%22%3A%7B%7D%2C%22isMapVisible%22%3Atrue%2C%22mapBounds%22%3A%7B%22west%22%3A-71.60100763511659%2C%22east%22%3A-70.65343683433534%2C%22south%22%3A42.16270187515638%2C%22north%22%3A42.43188091148111%7D%2C%22regionSelection%22%3A%5B%7B%22regionId%22%3A44269%2C%22regionType%22%3A6%7D%5D%2C%22filterState%22%3A%7B%22ah%22%3A%7B%22value%22%3Atrue%7D%2C%22sort%22%3A%7B%22value%22%3A%22globalrelevanceex%22%7D%7D%2C%22isListVisible%22%3Atrue%7D',
                'sec-ch-ua': '"Google Chrome";v="119", "Chromium";v="119", "Not?A_Brand";v="24"',
                'sec-ch-ua-mobile': '?0',
                'sec-ch-ua-platform': '"macOS"',
                'sec-fetch-dest': 'empty',
                'sec-fetch-mode': 'cors',
                'sec-fetch-site': 'same-origin',
                'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36'
              }
            }
          );
           //console.log("response is = ", (response.data.cat1.searchResults.listResults[0]));
           //console.log("response is = ", (response.data.cat1.searchResults.mapResults[0]));
           let photoData = response.data.cat1.searchResults.listResults;
           let data = response.data.cat1.searchResults.mapResults;
           let result = [];
           let apartment = 0;
           let house=0;
           console.log();
           for(let i=0; i<data.length;i++) {
            
            if(data[i]?.hdpData?.homeInfo?.homeType!="CONDO") {
              if(data[i]?.hdpData?.homeInfo?.homeType){
                if(house!=5) {

                  //get feature and policy
                  let s = (response.data.cat1.searchResults.mapResults[5]).detailUrl.split('/');
                  let bKey=s[s.length-2];
                  let resp = await featPolicy.getfeaturesPolicies(bKey);

                  result.push({
                    streetAddress: data[i].hdpData.homeInfo.streetAddress,
                    streetName: data[i].hdpData.homeInfo.streetAddress,
                    zipcode: data[i].hdpData.homeInfo.zipcode,
                    city: data[i].hdpData.homeInfo.city,
                    state: data[i].hdpData.homeInfo.state,
                    latitude: data[i].hdpData.homeInfo.latitude,
                    longitude: data[i].hdpData.homeInfo.longitude,
                    price: data[i].hdpData.homeInfo.price,
                    listing_type: data[i].hdpData.homeInfo.homeStatus,
                    home_type: "House",//data[i].hdpData.homeInfo.homeType,
                    zpid: data[i].hdpData.homeInfo.zpid,
                    area: data[i].hdpData.homeInfo.livingArea,
                    bedrooms: data[i].hdpData.homeInfo.bedrooms,
                    bathrooms: data[i].hdpData.homeInfo.bathrooms,
                    brokerName: data[i].brokerName,
                    photos: photoData[i]?.carouselPhotos.map(obj => Object.values(obj)),
                    features:resp.features,
                    policies: resp.policies
                    // unit: data[i].hdpData.homeInfo.unit,
                    // floor: Math.floor(Math.random() * 10) + 1,
                    // block: Math.floor(Math.random() * 10) + 1
                  });
                  house++;
                }
              }
            }
            else {
              if(apartment!=5) {

                //get feature and policy
                let s = (response.data.cat1.searchResults.mapResults[5]).detailUrl.split('/');
                let bKey=s[s.length-2];
                let resp = await featPolicy.getfeaturesPolicies(bKey);

                result.push({
                  streetAddress: data[i].hdpData.homeInfo.streetAddress,
                  streetName: data[i].hdpData.homeInfo.streetAddress,
                  zipcode: data[i].hdpData.homeInfo.zipcode,
                  city: data[i].hdpData.homeInfo.city,
                  state: data[i].hdpData.homeInfo.state,
                  latitude: data[i].hdpData.homeInfo.latitude,
                  longitude: data[i].hdpData.homeInfo.longitude,
                  price: data[i].hdpData.homeInfo.price,
                  listing_type: data[i].hdpData.homeInfo.homeStatus,
                  home_type: "Apartment",//data[i].hdpData.homeInfo.homeType,
                  zpid: data[i].hdpData.homeInfo.zpid,
                  area: data[i].hdpData.homeInfo.livingArea,
                  bedrooms: data[i].hdpData.homeInfo.bedrooms,
                  bathrooms: data[i].hdpData.homeInfo.bathrooms,
                  unit: data[i].hdpData.homeInfo.unit,
                  floor: Math.floor(Math.random() * 10) + 1,
                  block: Math.floor(Math.random() * 10) + 1,
                  brokerName: data[i].brokerName,
                  photos: photoData[i]?.carouselPhotos.map(obj => Object.values(obj)),
                  features:resp.features,
                  policies: resp.policies
                });
                apartment++;
              }
            }
           }

           console.log(result);
          return result;
    } catch(e){
        console.error("error in getting Sale Listings", e);
        throw(e);
    }
}


module.exports.getSaleListings();
