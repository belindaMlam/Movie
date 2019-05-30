/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateForm(){
    var title = document.forms["form"]["title"].value;
    var genre = document.forms["form"]["genre"].value;
    var price = document.forms["form"]["price"].value;
    var number = document.forms["form"]["number"].value;
    if(title === "" ||genre === "" || price ===""|| number ===""){
        alert("All details must be filled out.");
        return false;
        
    }else{
        return true;
    }
}

