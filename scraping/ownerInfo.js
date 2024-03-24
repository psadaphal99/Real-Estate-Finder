const axios = require('axios');
let data = JSON.stringify({
  "resource_id": "1000d81c-5bb5-49e8-a9ab-44cd042f1db2",
  "limit": 100,
  "q": ""
});

let config = {
  method: 'post',
  maxBodyLength: Infinity,
  url: 'https://data.boston.gov/api/3/action/datastore_search',
  headers: { 
    'Content-Type': 'application/json', 
    'Cookie': '__cf_bm=VdGodFEoeiWUwBFUfmgmkTSrPMOjawpmFZzC8BnayDU-1701927246-0-AXjG7vhHon0uD4WUl8gFtuIhgk4V+G57BOG2punxvmfSLkGzJ9QzQLhiRLNZu/ed30kur/bijjd23T5/G9PHVLk='
  },
  data : data
};

let result = [];

module.exports.makeRequest = async (config)=>{
  try {
    const response = await axios.request(config);
    //console.log((response.data.result.records));
    let owners = response.data.result.records;
    let total = response.data.result.total;
    let offset =0;
    owners.forEach(element => {
        result.push({name: element.OWNER,
          state_id: element.GIS_ID,
          PID: element.PID,
          ID: element.BLDG_VALUE+element.LAND_VALUE
        });
        console.log(element.ST_NAME + " " + element.ST_NUM);
    });

    offset+=100;
    if(offset==total){
      return
    }
    let url = 'https://data.boston.gov/api/3/action/datastore_search';
    let query = `?offset=${offset}&resource_id=1000d81c-5bb5-49e8-a9ab-44cd042f1db2`;
    config.url=url+query;
    module.exports.makeRequest(config);
    console.log(result.length);
    return result;
  }
  catch (error) {
    console.log(error);
  }
}

module.exports.makeRequest(config);
