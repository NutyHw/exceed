const fetch = require("node-fetch");
var url = "https://exceed.superposition.pknn.dev/data/boobo_hardware";
var db_url = "https://exceed.superposition.pknn.dev/data/boobo_db";
async function data_transfer(watch_id) {
    res = await fetch(url)
    EVENT = await res.json()
    res = await fetch(db_url)
    data = await res.json()

    if(EVENT['isWear'] == "False"){
        var date = new Date().toLocaleString()
        data[watch_id][date] = 'took off'
        fetch(db_url,{
            method : "POST",
            headers : {
                "Content-Type" : "application/json"
            },
            body : JSON.stringify({"data" : data})
        })
        .then(res => console.log('success'))
        .catch(err => console.log('Something occure'))
    }
    else if(EVENT['isDanger'] == 'True'){
        var date = new Date().toLocaleString()
        data[watch_id][date] = 'in Danger'
        fetch(db_url, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ "data": data })
        })
            .then(res => console.log('success'))
            .catch(err => console.log('Something occure')) 
    }
}



