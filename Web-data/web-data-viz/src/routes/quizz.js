var express = require("express");
var router = express.Router();

var quizzController = require("../controllers/quizzController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/guardar", function (req, res) {
    quizzController.guardar(req, res);
})


module.exports = router;


