
/* este arquivo trata do primeiro estado de um or�amento (Gerar)
 * conforme o campo busca � alterado � criada uma solicita��o ajax ao back-end que 
 * devolve uma lista de objetos em javascript, que por sua vez monta uma tabela
 * onde � poss�vel que o usu�rio adicione itens e quantidades ao or�amento final
 * � possivel excluir um item da tabela e alterar suas quantidades
 * a cada altera��o, o total geral � recalculado.
 */

const q = document.querySelector('#q');
const tabelabusca =  document.querySelector("#table");
const divTabela =  document.querySelector("#itens");
const tableContent = document.querySelector("#tbody");
const btnGerarOrcamento = document.querySelector("#btn-gerar-orcamento");

//fun��o usada para realizar a busca e montar a tabela de itens de produtos a serem add
const listar = ()=>{
    //instanciando objeto do XMLHttpRequest
    let xhr = new XMLHttpRequest();
    
    //caminho da servlet  e atributo
    xhr.open('GET', 'BuscarItensOrcamentoAjax?id='+q.value);
    
   //configura��es do Request
    xhr.onload = function() {
        
        //se tudo ocorrer bem
        if (xhr.status === 200) {
            
        //recupera os produtos
         let produtos = xhr.responseText;
         
         //transforma a resposta de String com formato JSON para objeto JSON
         produtos= JSON.parse(produtos);
         
         //torna a tabela de itens vis�vel
         divTabela.style.display = "block";
         divTabela.style.border = "8px solid #fff"
        
         //limpa o conte�do da tabela para n�o duplicar buscas
         tableContent.textContent=""; 
         //monta os itens em uma tabela
         for(let i = 0; i< produtos.length; i++){
             
                //linha
                const tr = document.createElement("tr");
                
                //colunas
                const tdId =  document.createElement("td");
                const tdNome =  document.createElement("td"); 
                const tdQt =  document.createElement("td");
                const tdButton =  document.createElement("td");
                
                //cria os elementos e seta as lacunas com seus respectivos atributos
                const campoQt = document.createElement("input");
                campoQt.setAttribute("type","text");
                campoQt.setAttribute("id", "qt-"+produtos[i].id);
                campoQt.value = 1; //Quantidade default 1
                campoQt.style.width= "50px";
                campoQt.style.margin= "5px";
                
                const buttonAdd =  document.createElement("input");
                buttonAdd.setAttribute("type","button");
                buttonAdd.setAttribute("value"," + ");
                buttonAdd.style.width = "30px";
                buttonAdd.style.background = "lightgreen";
                
                tdId.textContent = produtos[i].id;
                tdNome.textContent = produtos[i].nome;
                tdQt.appendChild(campoQt);
                tdButton.appendChild(buttonAdd);
                
                tr.appendChild(tdId);
                tr.appendChild(tdNome);
                tr.appendChild(tdQt);
                tr.appendChild(tdButton);
                
                tableContent.appendChild(tr);
                
                buttonAdd.addEventListener("click",(e)=>{
                //verifica se quantidade digitada � um numero   
                if(!isNaN(parseFloat(campoQt.value))){  
                      if(campoQt.value < 0.0000001){
                          alert("Quantidade precisa ser um numero positivo");
                      }else{
                          addPedido(produtos[i].id,produtos[i].nome, produtos[i].preco, campoQt.value);   
                      }
            }else{alert("Quantidade precisa ser um numero positivo");}
                });
                             
         }
        }
        else {
            alert('Request failed.  Returned status of ' + xhr.status);
        }
    };
    xhr.send(); 
    
};

//calcula o total geral // essa fun��o � chamada sempre que for preciso recalcular o total geral
const calculaTotal = ()=>{  
               let totais = document.querySelectorAll(".tdtotal");
               let ttt=0;
               for(let i = 0; i< totais.length; i++){
                     ttt += parseFloat(totais[i].textContent);
               }
               document.querySelector("#total-orcamento").value = ttt.toFixed(2);
               console.log(ttt); 
};

const addPedido = (id,nome,preco, qt)=>{ 
    let orcamento = document.querySelector("#tabela-orcamento"); 
    orcamento.style.display= "block";
    
    let tbody = document.querySelector("#itens-orcamento");
    
    let elemento = document.querySelectorAll(".tr-"+id);

    if (elemento.length<1){
            let tr = document.createElement("tr");
            tr.setAttribute("class","tr-"+id);

            let tdid= document.createElement("td");
            tdid.textContent = id;

            let tdnome= document.createElement("td");
            tdnome.textContent = nome;
            
            let btnExcluir = document.createElement("input");
            btnExcluir.setAttribute("class","btnExcluir-"+id);
            btnExcluir.setAttribute("type","button");
            btnExcluir.setAttribute("alt","Excluir");
            btnExcluir.setAttribute("title","Excluir");
            btnExcluir.setAttribute("value","x");
            btnExcluir.style.width = "30px"
            btnExcluir.style.color = "white";
            btnExcluir.style.background = "#333"; 
            btnExcluir.style.paddingLeft = "3px";
            btnExcluir.style.paddingRight = "3px";

            let tdpreco= document.createElement("td");
            tdpreco.textContent = preco;
            
            let tdqt= document.createElement("td");
            tdqt.style.textAlign = "center";
            let campoQt= document.createElement("input");
            campoQt.style.width= "50px";
            campoQt.style.margin= "5px";
            campoQt.style.fontSize= "20px";
            campoQt.setAttribute("class","tdqt-"+id);
            campoQt.setAttribute("id","item-orc");
            campoQt.value = qt;
            tdqt.appendChild(campoQt);

            let tdop= document.createElement("td");
            tdop.style.textAlign = "center";
            tdop.appendChild(btnExcluir);
            
            let tdtotal= document.createElement("td");
            tdtotal.setAttribute("id","tdtotal-"+id);
            tdtotal.setAttribute("class","tdtotal");
            tdtotal.textContent = (preco * parseInt(qt)).toFixed(2);  
            
            tr.appendChild(tdid);
            tr.appendChild(tdnome);
            tr.appendChild(tdpreco);
            tr.appendChild(tdqt);
            tr.appendChild(tdtotal);
            tr.appendChild(tdop);
            //insere intens na tabela de or�amento
            tbody.prepend(tr);
            //evento excluir item;
            btnExcluir.addEventListener("click",()=>{tbody.removeChild(tr); calculaTotal();});
            //evento atualizar pre�o ao alterar quantidade
            campoQt.addEventListener("keyup",()=>{ tdtotal.textContent = (parseFloat(preco) * parseInt(campoQt.value)).toFixed(2);
                calculaTotal();
            });
            
            orcamento.style.float= "left";
    }else{
         let tdqt = document.querySelector(".tdqt-"+id);
         let tdtt = document.querySelector("#tdtotal-"+id);
         tdqt.value = parseInt(tdqt.value)+parseInt(qt);
         tdtt.textContent = (parseInt(tdqt.value) * preco).toFixed(2); 
    }
    calculaTotal();
};

q.addEventListener("keyup",(e)=>{listar();});
q.addEventListener("mouseover",(e)=>{listar();});
q.addEventListener("mouseout",(e)=>{divTabela.style.display = "none";});
divTabela.addEventListener("mouseover",(e)=>{ divTabela.style.display = "block";});
divTabela.addEventListener("mouseout",(e)=>{ divTabela.style.display = "none";});

btnGerarOrcamento.addEventListener("click",()=>{
   
   var request = new XMLHttpRequest();
   let itens = document.querySelectorAll("#item-orc");

   let cliente = document.querySelector("#cliente").value;
   let datainicio = document.querySelector("#datainicio").value;
   let dataprevista = document.querySelector("#dataprevista").value; 
   let descricao = document.querySelector("#descricao").value;
         
   let strItens = "";
   request.onload = function() {
       
         if (request.status === 200){  
            alert(request.responseText);
            window.location.href = "orcamentoListar.jsp";
       
       }else{
            alert("erro ao cadastrar");
       } 
         
   };

 for(let i = 0; i< itens.length; i++){
       let idItem = itens[i].getAttribute("class");
       idItem = idItem.slice(5,idItem.length);
       strItens +=  idItem + ":" + itens[i].value + ";";    
   } 
   
   strItens = strItens.slice(0, -1);
   
   request.open('POST', 'GerarOrcamentoAjax?itens='+strItens+","+cliente+","+datainicio+","+dataprevista+","+descricao);
   console.log(strItens);  

   request.send();
});




const cliente = document.querySelector("#cliente");

cliente.addEventListener("change",()=>{
    console.log(cliente.value);
     var request = new XMLHttpRequest();
     
     request.onload = function() {
       
         if (request.status === 200){  
           let cli =  request.responseText.split("|");
           let nome = cli[0];
           let sobrenome = cli[1];
           let campoNome = document.querySelector("#nomeCli");
           campoNome.textContent = `Cliente: ${nome} ${sobrenome}`; 

       }else{
            alert("Id cliente deve ser numero");
       } 
         
   };
   
   request.open('POST', 'BuscarClienteAjax?cliente='+cliente.value);
  
   request.send();
});


  


