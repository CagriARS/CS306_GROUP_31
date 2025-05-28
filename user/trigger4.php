<?php
// user/trigger4.php  – Author: Mert Unaldı
include __DIR__ . '/../common/db_connect.php';

$message = '';
$log     = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        if (isset($_POST['clear'])) {
            // Handle clear data request FIRST
            $mysqli->query("DELETE FROM Belongs WHERE MovieID = 1 AND GenreID = 2");
            $mysqli->query("DELETE FROM BelongsLog WHERE MovieID = 1 AND GenreID = 2"); // Also clear logs
            $message = "Data cleared successfully";
        } elseif (isset($_POST['first'])) {
            // First insertion - should succeed
            $sql = "INSERT INTO Belongs (MovieID, GenreID) VALUES (1, 2)";
            $action = "First insert (1,2)";
        } else {
            // Duplicate insertion - should trigger the error
            $sql = "INSERT INTO Belongs (MovieID, GenreID) VALUES (1, 2)";
            $action = "Duplicate insert (1,2)";
        }
        
        // Only execute SQL if it's not a clear operation
        if (isset($sql)) {
            $ok = @$mysqli->query($sql);
            if (!$ok) {
                // Check if it's our custom trigger error
                if (strpos($mysqli->error, 'already assigned') !== false) {
                    throw new Exception('Trigger fired: This genre is already assigned to the movie.');
                }
                throw new Exception('Database error: ' . $mysqli->error);
            }
            $message = "Operation succeeded: $action";
        }
    } catch (Exception $e) {
        $message = $e->getMessage();
    }
    
    // Check if BelongsLog table exists and show logs
    $res = @$mysqli->query("SELECT * FROM BelongsLog ORDER BY LogID DESC LIMIT 10");
    $log = $res ? $res->fetch_all(MYSQLI_ASSOC) : [];
}

// Let's also show current Belongs table content
$belongsData = [];
$res = @$mysqli->query("SELECT * FROM Belongs ORDER BY MovieID, GenreID");
if ($res) {
    $belongsData = $res->fetch_all(MYSQLI_ASSOC);
}
?>
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><title>Test trg_before_belongs_insert</title></head>
<body>
  <h1>Test trg_before_belongs_insert by Mert Ünaldı</h1>
  
  <p><strong>Instructions:</strong></p>
  <ol>
    <li>Click "Insert (1,2)" first - should succeed</li>
    <li>Click "Insert Duplicate (1,2)" - should trigger error</li>
    <li>Use "Clear Data" to reset and test again</li>
  </ol>

  <form method="post">
    <button name="first" type="submit">Insert (1,2)</button>
    <button name="dup" type="submit">Insert Duplicate (1,2)</button>
  </form>
  
  <form method="post" style="margin-top: 10px;">
    <button name="clear" type="submit" style="background-color: #ff6b6b; color: white;">Clear Data</button>
  </form>

  <?php if ($message): ?>
    <p style="color:<?= strpos($message, 'succeeded') !== false || strpos($message, 'cleared') !== false ? 'green' : 'red' ?>;">
      <?= htmlspecialchars($message) ?>
    </p>
  <?php endif; ?>

  <?php if ($belongsData): ?>
    <h2>Current Belongs Table Data</h2>
    <table border="1" cellpadding="4">
      <tr><th>MovieID</th><th>GenreID</th></tr>
      <?php foreach ($belongsData as $row): ?>
        <tr><td><?= $row['MovieID'] ?></td><td><?= $row['GenreID'] ?></td></tr>
      <?php endforeach; ?>
    </table>
  <?php else: ?>
    <p><em>Belongs table is empty</em></p>
  <?php endif; ?>

  <?php if ($log): ?>
    <h2>BelongsLog</h2>
    <table border="1" cellpadding="4">
      <tr><?php foreach (array_keys($log[0]) as $col) echo "<th>$col</th>"; ?></tr>
      <?php foreach ($log as $row): ?>
        <tr><?php foreach ($row as $val) echo "<td>$val</td>"; ?></tr>
      <?php endforeach; ?>
    </table>
  <?php endif; ?>

  <p><a href="index.php">← Back Home</a></p>
</body>
</html>