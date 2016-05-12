<?php
$a = new swoole_server($ip, $port, SWOOLE_BASE, SWOOLE_SOCK_TCP);
$a->addListener($host, $port, $type = SWOOLE_SOCK_TCP);
$a->listen($host, $port, $type = SWOOLE_SOCK_TCP);
$a->addProcess($process);


 ?>
