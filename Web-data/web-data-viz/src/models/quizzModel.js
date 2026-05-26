var database = require("../database/config")

// function autenticar(email, senha) {
//     console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
//     var instrucaoSql = `
//         SELECT id, nome, email FROM usuario WHERE email = '${email}' AND senha = '${senha}';
//     `;
//     console.log("Executando a instrução SQL: \n" + instrucaoSql);
//     return database.executar(instrucaoSql);
// }

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function guardar(usuario, resultado, valores) {
    console.log("Salvando quiz");
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO Quiz (fkUsuario, fkTipo)
        VALUES (${usuario}, ${resultado});`;

    console.log(instrucaoSql);

    return database.executar(instrucaoSql).then(function(respostaQuiz){
        let idQuiz = respostaQuiz.insertId;

        let  prometa = [];

        for(let i = 0; i < valores.lenght; i++){
            let pontos = valores[i]

            let fkTipo = i + 1;

            let instrucaoResultado = `
            INSERT INTO ResultadoQuiz (
            fkQuiz, fkTipo, pontuacao) VALUES
            (${idQuiz}, ${fkTipo}, ${pontos});`;

            console.log(instrucaoResultado);

            prometa.push(
                database.executar(instrucaoResultado)
            );
        }
        return Promise.all(prometa);
    });

}

module.exports = {
    guardar
};