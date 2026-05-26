var quizzModel = require("../models/quizzModel");
/*var aquarioModel = require("../models/aquarioModel");*/

function guardar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var resultado = req.body.resultadoServer;
    var usuario = req.body.usuarioServer;
    var valores = req.body.listaServer
    
    
   

    // Faça as validações dos valores
    if (usuario == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (resultado == undefined) {
        res.status(400).send("Seu resultado está undefined!");
    } else if (valores == undefined){
        res.status(400).send("Seus valores está undefined!");
    }
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

module.exports = {
    autenticar,
    cadastrar
}