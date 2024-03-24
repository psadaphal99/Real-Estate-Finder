const axios = require("axios");

let config = {
  'zpid': '2054092481',
  'pageType': 'BDP',
  'isInstantTourEnabled': false,
  'isCachedInstantTourAvailability': true,
  'tourTypes': []
}

module.exports.getBrokerInfo= async (zpid)=>{
    try{
      config.zpid=zpid;
        const response = await axios.post(
            'https://www.zillow.com/rentals/api/rcf/v1/rcf',
            config,
            {
              headers: {
                'authority': 'www.zillow.com',
                'accept': 'application/json, text/plain, */*',
                'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
                'content-type': 'application/json;charset=UTF-8',
                'cookie': 'x-amz-continuous-deployment-state=AYABeGIBk1dVJVdvF9DJ1HVXiQMAPgACAAFEAB1kM2Jsa2Q0azB3azlvai5jbG91ZGZyb250Lm5ldAABRwAVRzA3MjU1NjcyMVRZRFY4RDcyVlpWAAEAAkNEABpDb29raWUAAACAAAAADLHIVqxwZqoRYXQmlQAwH2MOxcEi9%2F7guOumeWWj%2FSKnWm3hc+yn3Z720rh3bUUNDEQ88A0KQfeklR%2FzfP9NAgAAAAAMAAQAAAAAAAAAAAAAAAAAAEDkhrS82QNBa1eNW1UeteP%2F%2F%2F%2F%2FAAAAAQAAAAAAAAAAAAAAAQAAAAz%2FB4e48afipJAfMedQiN85b9xTtBkrysc+3rOT; zguid=24|%241c07ad5a-013a-414c-8de0-e6dd3f1927f3; zjs_anonymous_id=%221c07ad5a-013a-414c-8de0-e6dd3f1927f3%22; zg_anonymous_id=%22b12cfb56-8683-4de0-bc96-03c0bb46b9e2%22; _ga=GA1.2.2117336386.1698620681; _gid=GA1.2.1145363842.1698620681; _pxvid=8a6278d6-76af-11ee-94ad-2a6c7c036f86; _gcl_au=1.1.563082542.1698620682; _fbp=fb.1.1698620682482.689885454; __pdst=b6c851a3d9c743e4ba822047439655b9; _pin_unauth=dWlkPVlXSmhNamt6TVRNdE9EZzNNeTAwTkRBMExUazNaR1F0TkRFeU9UUTJOR1F5WkRFMQ; FSsampler=365776305; _clck=tmmp43|2|fga|0|1397; userid=X|3|702ce64ad44f3ad1%7C10%7CXtSO4hXgdJm8kSC_So0CCsRaWJ87cVMdTbGo5u_zpuQ%3D; loginmemento=1|1972a1db38f6333a857fe88b13c63eea181707c7780c2c7715bd6c0324d3d2a1; zjs_user_id=%22X1-ZUrg6lfja7in7t_2dooi%22; _derived_epik=dj0yJnU9Z1dfSjRLakF1VzBqNjdmR1NWeFlwVVpuTFNvUUpxeTgmbj12WlVCZ0J6MTJNNFYtNE9KYzF4VDNRJm09NCZ0PUFBQUFBR1VfTUN3JnJtPTQmcnQ9QUFBQUFHVV9NQ3cmc3A9NA; JSESSIONID=73B4D4CFA08928C3F430D4DF389DE8CD; zgsession=1|efef4e47-6948-4bcb-b988-9f4171fc3e77; ZILLOW_SID=1|AAAAAVVbFRIBVVsVEsBTl3xVT9%2F1j66vVhs63Bf2wzCFWYOGx4cft4oiIGfNsiXLgrN0uS1d8NgbR%2FEidYRdW5O8eHqFDZDjbA; pxcts=294cadf6-76e4-11ee-a732-dbcc0058e49f; DoubleClickSession=true; tfpsi=2107d288-d483-4466-a065-c4e03b7f01b7; x-amz-continuous-deployment-state=AYABeM90Z6fLwcH4iD0z+MLCa+cAPgACAAFEAB1kM2Jsa2Q0azB3azlvai5jbG91ZGZyb250Lm5ldAABRwAVRzA3MjU1NjcyMVRZRFY4RDcyVlpWAAEAAkNEABpDb29raWUAAACAAAAADH00Xill4YMTr6Qp%2FwAwarMeC9H3zz0d6ilt%2FaR6T12OCobQ3n4xb4pX7dIwHc3JYPt0zRO340Nme+YXv4C+AgAAAAAMAAQAAAAAAAAAAAAAAAAAAAKrukGSzbDTZDylOiBco4D%2F%2F%2F%2F%2FAAAAAQAAAAAAAAAAAAAAAQAAAAwe6sFEkdDVIlqKJYqBqqLti2f9GcRT0yatL3qaf9GcRT0yatL3qQ==; _pxff_cc=U2FtZVNpdGU9TGF4Ow==; _pxff_cfp=1; _pxff_bsco=1; _gat=1; _uetsid=8b55103076af11ee8224075cce13fa43; _uetvid=8b55237076af11ee94718b632ddb8344; _px3=fae4d4c5010b49c73bb5af492110a7d2e6349293455a5b58f71acf49356f83f3:Ca2ubgj8dHQKDYrwPJ3lAKKvvpMKv/XrlIR6T4Yqin74I0pnzxyKf6VGxTwFJONYVe1srLIqoGbxn5qDyJsoFA==:1000:U/2/ETNI27CwdBBJ3M9BOgLRsqEbgM3NQl6DO2FDYSzymFCwiMQf+S1ADxBGT8arTW2X4gjxr9vrnoEJ0Z2X+7vRgOXufcMMiQYW+04Oaxcaj8YqmUgsDRK9tu18pJKxc2S/p74W7ToKHxjC2KimJtPtaSK0WKFIPgDZ8j2Wqa2ym9FSprcFSKL2pw8Yn7ZOFA72M0zvy3286xE+l7lou445jNWdth3x+oPXBgyL/aQ=; _clsk=rw3anj|1698643633501|22|0|p.clarity.ms/collect; __gads=ID=0c91ea0489b35baf:T=1698620682:RT=1698643633:S=ALNI_Ma9ZynSBEfz4TNDFg7CcPq19Nm9AQ; __gpi=UID=000009ff6f93d04b:T=1698620682:RT=1698643633:S=ALNI_MZQ0YGs8VkLBtuAB5ScLxqP0iAPyA; search=6|1701235641646%7Crect%3D42.44784305739558%252C-70.57383959960939%252C42.17873240804135%252C-71.52141040039064%26rid%3D44269%26bldg%3D63tcgr%26disp%3Dallunits%26mdm%3Dauto%26sort%3Dpriorityscore%26listPriceActive%3D1%26fs%3D0%26fr%3D1%26mmm%3D0%26rs%3D0%26ah%3D0%26singlestory%3D0%26housing-connector%3D0%26abo%3D0%26pool%3D0%26ac%3D0%26waterfront%3D0%26finished%3D0%26unfinished%3D0%26cityview%3D0%26mountainview%3D0%26parkview%3D0%26waterview%3D0%263dhome%3D0%26featuredMultiFamilyBuilding%3D0%26excludeNullAvailabilityDates%3D0%26commuteMode%3Ddriving%26commuteTimeOfDay%3Dnow%09%0944269%09%7B%22isList%22%3Atrue%2C%22isMap%22%3Atrue%7D%09%09%09%09%09; AWSALB=TNQFNau2aR6DIVbmdbgoYbsPLjPqlP/4wASq3SG4qhTJZ4N2m7R9a8OvO8QvmIV+6GPwR9K/Fz2fxzfse+9MOEwivKzMdr/olukmIp4AN/VHJL9z3I0lVj8GbGWR; AWSALBCORS=TNQFNau2aR6DIVbmdbgoYbsPLjPqlP/4wASq3SG4qhTJZ4N2m7R9a8OvO8QvmIV+6GPwR9K/Fz2fxzfse+9MOEwivKzMdr/olukmIp4AN/VHJL9z3I0lVj8GbGWR',
                'origin': 'https://www.zillow.com',
                'referer': 'https://www.zillow.com/apartments/brighton-ma/kilsyth-court-apartments/63tcgr/',
                'sec-ch-ua': '"Chromium";v="118", "Google Chrome";v="118", "Not=A?Brand";v="99"',
                'sec-ch-ua-mobile': '?0',
                'sec-ch-ua-platform': '"macOS"',
                'sec-fetch-dest': 'empty',
                'sec-fetch-mode': 'cors',
                'sec-fetch-site': 'same-origin',
                'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36'
              }
            }
          );

          let brokerInfo=response.data.propertyInfo.agentInfo;
          //console.log("response = ", brokerInfo);
          return brokerInfo;

    } catch(e){
        console.error("error = ",  e);
    }
}

module.exports.getBrokerInfo("2054092481");