// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require bootstrap
//= require_tree .

// function entendimentoAsyncrono(){
//   alert("001")

//   fetch('http://localhost:3000/contatos.json')
//   .then(response => {
//     return response.json()
//   })
//   .then(data => {
//     alert("002")

//     fetch('http://localhost:3000/contatos.json')
//     .then(response => {
//       return response.json()
//     })
//     .then(novo_dado => {

//       fetch('http://localhost:3000/contatos.json')
//       .then(response => {
//         return response.json()
//       })
//       .then(terceiro_dado => {
//         alert("003")
//         // Callback - manipular os dados retornados aqui
//         console.log(data); // Exemplo: exibindo os dados no console
//         console.log(novo_dado); // Exemplo: exibindo os dados no console
//         console.log(terceiro_dado); // Exemplo: exibindo os dados no console
//         alert("004")
//       })
//       .catch(error => {
//         // Callback - manipular erros aqui
//         console.error(error);
//       });


//       // Callback - manipular os dados retornados aqui
//       console.log(dado); // Exemplo: exibindo os dados no console
//       console.log(novo_dado); // Exemplo: exibindo os dados no console

//       alert("005")
//     })
//     .catch(error => {
//       // Callback - manipular erros aqui
//       console.error(error);
//     });



//     alert("006")

//     console.log(data); // Exemplo: exibindo os dados no console
//   })
//   .catch(error => {
//     // Callback - manipular erros aqui
//     console.error(error);
//   });


//   alert("007")

// }



// async function entendimentoAsyncronoAwait(){
//   alert("1")
//   data = await fetch('http://localhost:3000/contatos.json')
//   alert("2")
//   data2 = await fetch('http://localhost:3000/contatos.json')
//   alert("3")
//   data3 = await fetch('http://localhost:3000/contatos.json')
//   alert("4")

// }

// // entendimentoAsyncrono();
// entendimentoAsyncronoAwait();



const excluir = async (url) => {
    if(confirm("Confirma ?")){
        try { 
            const token = document.querySelector("meta[name='csrf-token']").content;
            const urlWithToken = `${url}?authenticity_token=${encodeURIComponent(token)}`;
            const response = await fetch(urlWithToken, { method: 'DELETE' });
            if (response.ok) {
                window.location.reload()
            } else {
                alert('Erro ao excluir o contato.');
            }
        } catch (error) {
            alert('Ocorreu um erro na requisição.' + error.message);
        }
    }
}


const atualizar = async (event) => {
    try {
      event.preventDefault();
      const form = event.target
  
      const url = form.action;
      // const formData = new FormData(form);
  
      // const body = {};
      // formData.forEach((value, key) => {
      //   body[key] = value;
      // });

      // debugger

      const body = {};
      const inputs = form.querySelectorAll('input, textarea');
      inputs.forEach(input => {
        const key = input.name;
        const value = input.value;
        body[key] = value;
      });

      const response = await fetch(url, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(body)
      });
  
      if (response.ok) {
        console.log('Contato atualizado com sucesso.');
        window.location.href = "/contatos"
      } else {
        alert('Erro ao atualizar o contato.');
      }
    } catch (error) {
      alert('Ocorreu um erro na requisição.' + error.message);
    }
};
  
const validarForm = function(event){
  const form = event.target

  inputEmail = form.querySelector('input[name="contato[email]"]')
  if(inputEmail.value.indexOf(".com.br") === -1){
    alert("Email está inválido, precisa ter .com.br")
    inputEmail.focus();
    return false;
  }

  return true;
}


document.addEventListener('DOMContentLoaded', () =>{
  const campoBusca = document.querySelector(".autocomplete-nome-aluno");
  if(campoBusca){
    campoBusca.onkeyup = async (e) =>{
      const valorDigitado = campoBusca.value;

      let divBuscaAutoComplete = document.querySelector(".divBuscaAutoComplete");
      if(!divBuscaAutoComplete){
        const divBuscaAutoComplete = document.createElement("div");
        divBuscaAutoComplete.setAttribute("class", "divBuscaAutoComplete");
        campoBusca.parentNode.append(divBuscaAutoComplete);
      }

      divBuscaAutoComplete = document.querySelector(".divBuscaAutoComplete");

      const response = await fetch(`/alunos.json?nome=${valorDigitado}`);
      if (!response.ok) {
        console.log('Erro ao carregar os dados dos alunos.');
        return;
      }

      const alunosData = await response.json();

      divBuscaAutoComplete.innerHTML = `
        <ul>
          ${ 
            alunosData.map((aluno) => { return `<li><a href='/alunos?nome=${aluno.nome}'>${aluno.nome}</a></li>` }).join("")
          }
        </ul>
      `;
    }
  }

});


