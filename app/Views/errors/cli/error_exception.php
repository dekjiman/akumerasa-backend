<?php

/**
 * @var \CodeIgniter\Error\Exceptions\ErrorException $exception
 */

use CodeIgniter\CLI\CLI;

CLI::newLine();
CLI::error('ERROR');
CLI::newLine();

CLI::write('Type: ' . get_class($exception));
CLI::write('Message: ' . $exception->getMessage());
CLI::newLine();
CLI::write('File: ' . $exception->getFile());
CLI::write('Line: ' . $exception->getLine());
CLI::newLine();
CLI::write('Backtrace:');
foreach ($exception->getTrace() as $i => $trace) {
    $argsStr = '';
    if (isset($trace['args']) && is_array($trace['args'])) {
        $argsStr = implode(', ', array_map(function ($arg) {
            if (is_object($arg)) return get_class($arg);
            if (is_null($arg)) return 'null';
            if (is_array($arg)) return '[...]';
            return (string) $arg;
        }, $trace['args']));
    }
    CLI::write('  ' . ($i + 1) . '. ' . ($trace['function'] ?? '') . '(' . $argsStr . ') called at [' . ($trace['file'] ?? '') . ':' . ($trace['line'] ?? '') . ']');
}
CLI::newLine();
