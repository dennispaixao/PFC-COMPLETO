
/* este arquivo trata do primeiro estado de um orçamento (Gerar)
 * conforme o campo busca é alterado é criada uma solicitação ajax ao back-end que 
 * devolve uma lista de objetos em javascript, que por sua vez monta uma tabela
 * onde é possível que o usuário adicione itens e quantidades ao orçamento final
 * é possivel excluir um item da tabela e alterar suas quantidades
 * a cada alteração, o total geral é recalculado.
 */

const q = document.querySelector('#q');
const tabelabusca =  document.querySelector("#table");
const divTabela =  document.querySelector("#itens");
const tableContent = document.querySelector("#tbody");
const btnCadastrarProduto = document.querySelector("#cadastrarProduto");

//função usada para realizar a busca e montar a tabela de itens de produtos a serem add
const listar = ()=>{
    //instanciando objeto do XMLHttpRequest
    let xhr = new XMLHttpRequest();
    //caminho da servlet  e atributo
    xhr.open('GET', 'BuscarMateriaisAjax?id='+q.value);
   //configurações do Request
    xhr.onload = function() {
        
        //se tudo ocorrer bem
        if (xhr.status === 200) {
            
        //recupera os produtos
         let produtos = xhr.responseText;

         console.log(produtos);
         //transforma a resposta de String com formato JSON para objeto JSON
         produtos= JSON.parse(produtos);
         
         //torna a tabela de itens visível
         divTabela.style.display = "block";
         divTabela.style.background = "#ddd"
         divTabela.style.height = "200px"
         //limpa o conteúdo da tabela para não duplicar buscas
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
                //verifica se quantidade digitada é um numero   
                if(!isNaN(parseFloat(campoQt.value))){  
                      if(campoQt.value < 0.0000001){
                          alert("Quantidade precisa ser um numero positivo");
                      }else{
                          addPedido(produtos[i].id,produtos[i].nome, produtos[i].fornecedor, campoQt.value,);   
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

const addPedido = (id,nome,fornecedor, qt)=>{ 
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

            let tdfornecedor= document.createElement("td");
            tdfornecedor.textContent = fornecedor;
            
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
            
            tr.appendChild(tdid);
            tr.appendChild(tdnome);
            tr.appendChild(tdfornecedor);
            tr.appendChild(tdqt);
            tr.appendChild(tdop);
            //insere intens na tabela de orçamento
            tbody.prepend(tr);
            //evento excluir item;
            btnExcluir.addEventListener("click",()=>{tbody.removeChild(tr);});
            //evento atualizar preço ao alterar quantidade
         
            
            orcamento.style.float= "left";
    }else{
         let tdqt = document.querySelector(".tdqt-"+id);
         tdqt.value = parseInt(tdqt.value)+parseInt(qt); 
    }

};

q.addEventListener("keyup",(e)=>{listar();});
q.addEventListener("mouseover",(e)=>{listar();});
q.addEventListener("mouseout",(e)=>{divTabela.style.display = "none";});
divTabela.addEventListener("mouseover",(e)=>{ divTabela.style.display = "block";});
divTabela.addEventListener("mouseout",(e)=>{ divTabela.style.display = "none";});

btnCadastrarProduto.addEventListener("click",()=>{
    
   var request = new XMLHttpRequest();
   let itens = document.querySelectorAll("#item-orc");
   let nome = document.querySelector("#nome").value;
   let descricao = document.querySelector("#descricao").value;
   let preco = document.querySelector("#preco").value;
   let peso = document.querySelector("#peso").value;
   let largura = document.querySelector("#largura").value;
   let altura = document.querySelector("#altura").value;
   let espessura = document.querySelector("#espessura").value;
   
   let strItens = "";  
   for(let i = 0; i< itens.length; i++){
       let idItem = itens[i].getAttribute("class");
       idItem = idItem.slice(5,idItem.length);
       itens[i].value = itens[i].value.replace(",",".");
       strItens +=  idItem + ":" + itens[i].value + ";";    
   }  
    
   strItens = strItens.slice(0, -1); //PARA RETIRAR O ULTIMO;
   
   request.onload = function() {
         if (request.status === 200){  
            alert(request.responseText);
   
       }else{
            alert("erro ao cadastrar");
       } 
         
   };
   request.open('POST', 'CadastrarProdutoAjax?itens='+strItens+","+nome+","+descricao+","+preco+","+peso+","+largura+","+altura+","+espessura);
   request.send();  

});







  
