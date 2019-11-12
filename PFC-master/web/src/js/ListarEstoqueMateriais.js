
let search = location.search.toString();
let id = search.split('=');
id = id[1];
let link;
switch(id){  
    
    case "1": link = 'ListarEstoqueMateriaisGeral.js'; break; 
    case "2": link = 'ListarEstoqueMateriaisAbaixo.js'; break; 
    case "3": link = 'ListarEstoqueMateriaisRazoavel.js'; break; 
    default: link = 'ListarEstoqueMateriaisGeral.js';

}



document.writeln("<script type='text/javascript' src='src/js/"+link+"'></script>");
