<?php
// user/trigger1.php  – Author: Çağrı Arslantürk
include __DIR__ . '/../common/db_connect.php';

$message = '';
$logs    = [];
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $sql = "
          INSERT INTO Review (MovieID, ReviewText, ReviewDate, RatingScore)
          VALUES (1, 'Test review via PHP', CURDATE(), 7.5)
        ";
        $ok = @$mysqli->query($sql);
        if (!$ok) {
            throw new Exception('Database error: ' . $mysqli->error);
        }
    } catch (Exception $e) {
        $message = $e->getMessage();
    }

    $res  = $mysqli->query("SELECT * FROM ReviewLog ORDER BY LogID DESC");
    $logs = $res ? $res->fetch_all(MYSQLI_ASSOC) : [];
}
?>
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><title>Test trg_after_review_insert</title></head>
<body>
  <h1>Test trg_after_review_insert by Çağrı Arslantürk</h1>

  <form method="post">
    <button type="submit">Insert Review → Log It</button>
  </form>

  <?php if ($message): ?>
    <p style="color:red;"><?= htmlspecialchars($message) ?></p>
  <?php endif; ?>

  <?php if ($logs): ?>
    <h2>ReviewLog</h2>
    <table border="1" cellpadding="4">
      <tr><?php foreach (array_keys($logs[0]) as $col) echo "<th>$col</th>"; ?></tr>
      <?php foreach ($logs as $row): ?>
        <tr><?php foreach ($row as $val) echo "<td>$val</td>"; ?></tr>
      <?php endforeach; ?>
    </table>
  <?php endif; ?>

  <p><a href="index.php">← Back Home</a></p>
</body>
</html>
