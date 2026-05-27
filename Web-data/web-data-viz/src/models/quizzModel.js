var database = require("../database/config")

function guardar(usuario, resultado, valores) {

    console.log("Salvando quiz");

    var instrucaoSql = `
        INSERT INTO Quiz (fkUsuario, fkTipoResultado)
        VALUES (${usuario}, ${resultado});
    `;

    console.log(instrucaoSql);

    return database.executar(instrucaoSql)

    .then(function(respostaQuiz){

        let idQuiz = respostaQuiz.insertId;

        let promessas = [];

        for(let i = 0; i < valores.length; i++){

            let pontos = valores[i];

            let fkTipo = i + 1;

            let instrucaoResultado = `
                INSERT INTO ResultadoQuiz
                (fkQuiz, fkTipo, pontuacao)
                VALUES
                (${idQuiz}, ${fkTipo}, ${pontos});
            `;

            console.log(instrucaoResultado);

            promessas.push(
                database.executar(instrucaoResultado)
            );
        }

        return Promise.all(promessas);

    });

}

module.exports = {
    guardar
};