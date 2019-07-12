const fetch = require("node-fetch");
var url = "https://exceed.superposition.pknn.dev/data/boobo_login";
var db_url = "https://exceed.superposition.pknn.dev/data/boobo_db";

function sign_up(Email, password, watch_id, Phone, Type) {
  fetch(db_url)
  .then(function(res){
    return res.json()
  })
  .then(function(res){
    res[watch_id] = {}
    fetch(db_url,{
      method : "POST",
      body: JSON.stringify({ data: res}),
      headers: {
        "Content-Type": "application/json"
      }
    })
  })
  fetch(url)
    .then(function(res) {
      return res.json();
    })
    .then(function(res) {
      res[watch_id] = {
        password: password,
        email : Email,
        Phone_num: Phone,
        Type: Type
      };
      fetch(url, {
        method: "POST",
        body: JSON.stringify({ data: res }),
        headers: {
          "Content-Type": "application/json"
        }
      })
        .then(res => console.log("Success"))
        .catch(err => console.log("Error occure", err));
    });
}

function sign_in(watch_id, password){
  fetch(url)
  .then(function(res){
    return res.json()
  })
  .then(function(res){
    if(res[watch_id]['password'] == password){
      console.log("Password Correct")
      return true
    }
    else{
      console.log("Password Wrong")
      return false
    }
  })
  .catch(function(err){
    console.log('Something Wrong')
    console.log(err)
  })
}

sign_up('ex2@gmail.com','',"345","000000000",'Children')