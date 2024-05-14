<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Inicia componente Acbr
$nfe = new ACBrNFe();
// echo $nfe->Nome . " " . $nfe->Versao;

$nfe->ConfigGravarValor('Principal', 'LogNivel', '4'); // 4 - Paranoico;
$nfe->ConfigGravarValor('Principal', 'LogPath', '/var/www/html/'); // esta pasta requer permissoes de escrita para o usuario www-data do php
echo $nfe->GerarChave(41, 94360516, 65, 3, 63, 1, '14/05/2024', '81062952000131');

$reflectionClass = new ReflectionClass($nfe);

foreach ($reflectionClass->getMethods() as $method) {
    echo $method->getName() . PHP_EOL;
}
