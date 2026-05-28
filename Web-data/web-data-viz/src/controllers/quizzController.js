var quizzModel = require("../models/quizzModel");
/*var aquarioModel = require("../models/aquarioModel");*/

function guardar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var usuario = req.body.usuarioServer;
    var resultado = req.body.resultadoServer;
    var valores = req.body.listaServer   

    // Faça as validações dos valores
    if (usuario == undefined) {
        res.status(400).send("Seu id está undefined!");
    } else if (resultado == undefined) {
        res.status(400).send("Seu resultado está undefined!");
    } else if (valores == undefined){
        res.status(400).send("Seus valores está undefined!");
    } else
    {

        // Passe os valores comzparâmetro e vá para o arquivo quizzModel.js
        quizzModel.guardar(usuario, resultado, valores)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o Quiz! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function buscarResultados(req, res){

    let usuario = req.params.idUsuario;

    quizzModel.buscarResultados(usuario)

    .then(function(resultado){

        res.json(resultado);

    }).catch(function(erro){

        console.log(erro);

        res.status(500).json(erro.sqlMessage);

    });

}

module.exports = {
    guardar,
    buscarResultados
}