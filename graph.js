const fetch = require("node-fetch");

var url = "https://exceed.superposition.pknn.dev/data/boobo_hardware";
var db_url = "https://exceed.superposition.pknn.dev/data/boobo_db";
function data_transfer(watch_id) {
    fetch(url)
    .then(function(res) {
        return res.json();
    })
    .then(function(myjson) {
        if (myjson["isWear"] == "False") {
            console.log('took watch off')
            fetch(db_url)
            .then(function(res){
                return res.json()
            })
            .then(function(res){
                var date = new Date().toLocaleString()
                res[watch_id][date] = 'took off'
                fetch(db_url,{
                    method: "POST",
                    body: JSON.stringify({ data: res }),
                    headers: {
                        "Content-Type": "application/json"
                    }
                })
            })
        } 
        else if (myjson["isDanger"] == "True") {
            console.log('in Danger')
            fetch(db_url)
                .then(function (res) {
                    return res.json()
                })
                .then(function (res) {
                    var date = new Date().toLocaleString()
                    res[watch_id][date] = 'in Danger'
                    fetch(db_url, {
                        method: "POST",
                        body: JSON.stringify({ "data": res }),
                        headers: {
                            "Content-Type": "application/json"
                        }
                    }) 
                })
            }
        })
    }

data_transfer(345)

