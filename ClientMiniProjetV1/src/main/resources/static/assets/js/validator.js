const form = document.getElementById('form'); 
const username = document.getElementById('username'); 
const password = document.getElementById('loginPassword'); 
const password2 = document.getElementById('password2'); 

function showError(input, message){
    const formControl = input.parentElement;
    formControl.className = 'input-group error';
    const smallvalue = formControl.querySelector('small'); 
    smallvalue.innerText = message ;         
}
// show input success message 
function showSuccess(input){ 
    const formControl = input.parentElement;
    formControl.className = 'input-group success';
}
function checkPasswords(input1 , input2){ 
    if(input1.value === input2.value) { 
        showSuccess(input2);
        return true ;
    }else showError(input2 , 'Passwords do not match !! ') ; 
          return false ; 
}
function checklength(input , min , max){
    let num = input.value.length ; 
    if(num === 0){showError(input , ' * required');
      return false ; 
}
     if(num > min && num <= max ){showSuccess(input);
    return true ; 
}   
}
form.addEventListener('submit', function(e) { 
    e.preventDefault(); 
checkPasswords(password,password2); 
checklength(username , 5 , 14);
checklength(password , 6 , 30);
});

/*
const password = document.getElementById("password"); 
				const password2 = document.getElementById("password2");
                const form = document.getElementById("form");
				function checkPasswords(input1,input2){
					const  error =  document.getElementById("error");
					const  control = error.parentElement;
					control.className = 'alert alert-danger col-xs-offset-1 col-xs-10';
					const h1value = control.querySelector('h1'); 
                     if(input1.value === input2.value) { 
					h1value.innerText = 'message';
                    }else h1value.innerText = 'message222'; 
}    
form.addEventListener('submit', function(e){
	e.preventDefault();
	checkPasswords(password,password2);
}); 
*/