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
function buscarResultados(usuario){

    let instrucaoSql = `
    
             SELECT
            Tipo.nome,
            ResultadoQuiz.pontuacao,

            (
                SELECT COUNT(idQuiz)
                FROM Quiz
                WHERE fkUsuario = ${usuario}
            ) AS quantidadeQuiz

        FROM ResultadoQuiz

        JOIN Tipo
            ON ResultadoQuiz.fkTipo = Tipo.idTipo

        JOIN Quiz
            ON ResultadoQuiz.fkQuiz = Quiz.idQuiz

        WHERE Quiz.idQuiz = (

            SELECT MAX(idQuiz)
            FROM Quiz
            WHERE fkUsuario = ${usuario}

        );


    `;

    console.log(instrucaoSql);

    return database.executar(instrucaoSql);

}


module.exports = {
    guardar,
    buscarResultados
};