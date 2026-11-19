
const formulario = document.getElementById("formLogin");

formulario.addEventListener("submit", function(event) {

    event.preventDefault();

    const email = document.getElementById("email").value;
    const senha = document.getElementById("senha").value;

    const mensagem = document.getElementById("mensagem");

    if (email === "" || senha === "") {

        mensagem.textContent = "Preencha todos os campos!";
        return;

    }

    mensagem.style.color = "#23845c";
    mensagem.textContent = "Interface validada!";

    setTimeout(function() {
        window.location.href = "painel.html";
    }, 700);

});
