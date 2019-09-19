

document.querySelector("#cep").addEventListener("change",function(e){
fetch("https://viacep.com.br/ws/"+e.target.value+"/json/")
  .then(response => {
    return response.json()
  })
  .then(data => {
   document.querySelector("#rua").value = data.logradouro; 
   document.querySelector("#bairro").value = data.bairro;
   document.querySelector("#cidade").value = data.localidade;
   document.querySelector("#uf").value = data.uf;
   document.querySelector("#complemento").value = data.complemento;
  })
  .catch(err => {
   alert('cep não encontrado');
  })   

  });