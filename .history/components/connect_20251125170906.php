<?php
/**
 * Database Connection
 * Uses environment variables from .env file
 */

// Load environment configuration
require_once __DIR__ . '/config.php';

// Get database configuration from environment
$db_host = env('DB_HOST', 'localhost');
$db_name = env('DB_NAME', 'eleas_v3');
$db_user = env('DB_USER', 'root');
$db_password = env('DB_PASSWORD', '');
$db_charset = env('DB_CHARSET', 'utf8mb4');

// Create DSN (Data Source Name)
$dsn = "mysql:host=$db_host;dbname=$db_name;charset=$db_charset";

// PDO options for better security and error handling
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

// Establish PDO connection
try {
    $conn = new PDO($dsn, $db_user, $db_password, $options);
    
    // Optional: Set timezone (if needed)
    $timezone = env('APP_TIMEZONE', 'Asia/Kuala_Lumpur');
    $conn->exec("SET time_zone = '+08:00'");
    
} catch (PDOException $e) {
    // In production, log this error instead of displaying it
    if (env('APP_DEBUG', true)) {
        die("Database Connection Failed: " . $e->getMessage());
    } else {
        error_log("Database Connection Failed: " . $e->getMessage());
        die("Database connection error. Please contact the administrator.");
    }
}
?>
