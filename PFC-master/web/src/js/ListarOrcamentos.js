
let search = location.search.toString();
let id = search.split('=');
id = id[1];
let link;
let iniciados= document.querySelector("#iniciados");
let producao= document.querySelector("#producao");
let entrega= document.querySelector("#entrega");
let finalizados= document.querySelector("#finalizados");
switch(id){  
    
    case "1": link = 'ListarOrcamentosAprovados.js';
         iniciados.style.color = "yellow";
         iniciados.style.textShadow= "3px 3px 3px #333"
        
        break; 
        
    case "2": link = 'ListarOrcamentosProducao.js';
          producao.style.color = "yellow";   
          producao.style.textShadow= "3px 3px 3px #333"
        
        break; 
        
    case "3": link = 'ListarOrcamentosEntrega.js';
          entrega.style.color = "yellow";
          entrega.style.textShadow= "3px 3px 3px #333"
        
        break; 
        
    case "4": link = 'ListarOrcamentosFinalizados.js';
         finalizados.style.color = "yellow";
         finalizados.style.textShadow= "3px 3px 3px #333"
        break; 
        
    default: link = 'ListarOrcamentosAprovados.js';
        iniciados.style.color = "yellow";
        iniciados.style.textShadow= "3px 3px 3px #333"
      

}

document.writeln("<script type='text/javascript' src='src/js/"+link+"'></script>");
