//função usada para realizar a busca e montar a tabela de itens de produtos a serem add
const listar = () => {
  
    //instanciando objeto do XMLHttpRequest
    let xhr = new XMLHttpRequest();
   
    //caminho da servlet  e atributo
    xhr.open('GET', 'BuscarListaOrcamentosAjax?situacao=' + 1);
   
    //configurações do Request
    xhr.onload = function () {
        let tbody = document.querySelector("#tbodyOrcamentos");
        tbody.textContent = "";
      
        //se tudo ocorrer bem como proceder
        if (xhr.status === 200) {
            let orcamentos = xhr.responseText;
          
            //transforma a resposta de String com formato JSON para objeto JSON
            orcamentos = JSON.parse(orcamentos);

            for (let i = 0; i < orcamentos.length; i++) {
                let tr = document.createElement("tr");

                let tdId = document.createElement("td");
                tdId.textContent = orcamentos[i].id;
                tr.appendChild(tdId);

                let tdCliente = document.createElement("td");
                tdCliente.textContent = orcamentos[i].nomeCliente;
                tr.appendChild(tdCliente);

                let tdDataInsercao = document.createElement("td");
                tdDataInsercao.textContent = orcamentos[i].dataInsercao;
                tr.appendChild(tdDataInsercao);

          
                let tdFerramentas = document.createElement("td");

                let imgExcluir = document.createElement("img");               
                imgExcluir.setAttribute("src", "img/excluir.png");
                imgExcluir.setAttribute("alt", "excluir");   
                imgExcluir.setAttribute("title", "excluir");          
                imgExcluir.setAttribute("id", "btn-exc-" + orcamentos[i].id);

                tdFerramentas.appendChild(imgExcluir);
                
                let a = document.createElement("a");
                a.setAttribute("href","ControllerFactory?acao=AlterarOrcamento&id="+orcamentos[i].id);
                let imgVer = document.createElement("img");
                imgVer.setAttribute("src", "img/editar.png");
                imgVer.setAttribute("alt", "ver orcamento");
                imgVer.setAttribute("title", "ver orcamento");   
                a.appendChild(imgVer); 
                tdFerramentas.appendChild(a);
                
                let aAprovar = document.createElement("a");
                aAprovar.setAttribute("href","#");
                let imgAp = document.createElement("img"); 
                imgAp.setAttribute("id", "btn-ap-" + orcamentos[i].id);
                imgAp.setAttribute("src", "img/ok.png");
                imgAp.setAttribute("class", "btn-ap" + orcamentos[i].id);
                imgAp.setAttribute("alt", "Aprovar orcamento");
                imgAp.setAttribute("title", "Aprovar orcamento");   
                aAprovar.appendChild(imgAp); 
                tdFerramentas.appendChild(aAprovar);
                
                let aPagar = document.createElement("a");
                aPagar.setAttribute("href","ControllerFactory?acao=GerenciarPagamento&id="+orcamentos[i].id);
                let imgPagar = document.createElement("img"); 
                imgPagar.setAttribute("id", "btn-ap-" + orcamentos[i].id);
                imgPagar.setAttribute("src", "img/coin.png");
                imgPagar.setAttribute("class", "btn-ap" + orcamentos[i].id);
                imgPagar.setAttribute("alt", "Inserir Pagamento");
                imgPagar.setAttribute("title", "Inserir Pagamento");   
                aPagar.appendChild(imgPagar); 
                tdFerramentas.appendChild(aPagar);
               
                
                
                
                tr.appendChild(tdFerramentas);
                
                
                

                tbody.appendChild(tr);
                
                 document.querySelector("#btn-ap-" + orcamentos[i].id).addEventListener("click", (e) => {
                    if (confirm("Tem certeza que deseja aprovar o orçamento de id=" + orcamentos[i].id)) {
                        let xhr = new XMLHttpRequest();  
                            xhr.open('POST', 'AprovarOrcamentoAjax?id='+ orcamentos[i].id);
                            xhr.onload = function() {
                                if (xhr.status === 200) {
                                alert("o orçamento foi aprovado");
                                window.location.href = "orcamentoListar.jsp";
                                } 

                                else {
                                    alert('Request failed.  Returned status of ' + xhr.status);
                                }
                            };
                            xhr.send();                       
                    }
                });
                

                document.querySelector("#btn-exc-" + orcamentos[i].id).addEventListener("click", (e) => {
                    if (confirm("Tem certeza que deseja excluir o orçamento de id=" + orcamentos[i].id)) {
                     
                        let xhr = new XMLHttpRequest();
                        idOrc = e.target.id.slice(8, e.target.id.length); //recorta o id do css #btn-exc-(?)   
                        xhr.open("GET", "AlterarOrcamentoAjax" + '?situacao=' + idOrc);    
                        
                        alert(createRequisitionAjax("GET", "ExcluirOrcamentoAjax",idOrc));
            
                    }
                });
                
            }
        } else {
            alert('Request failed.  Returned status of ' + xhr.status);
        }
        console.log(xhr.responseText);
    };

    //executa o request    
    xhr.send();
};


const createRequisitionAjax = (metodo, url, strParams) => {
    let xhr = new XMLHttpRequest();
    xhr.open(metodo, url + '?situacao=' + strParams);
    let retorno = "";
    xhr.onload = function () {
        //se tudo ocorrer bem como proceder
        if (xhr.status === 200) {
            listar(); 
            retorno = "xhr.responseText";
           
        } else {
            alert('Request failed.  Returned status of ' + xhr.status);
            console.log(xhr.status);
        }
    };  
   //executa o request   
   xhr.send();
   return retorno;
   
};
 

 listar();
