<?php
// user/trigger3.php  – Author: Selin Lara Adalı
include __DIR__ . '/../common/db_connect.php';

$message = '';
$history = [];
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $ok = @$mysqli->query("UPDATE Review SET RatingScore = 9.0 WHERE ReviewID = 1");
        if (!$ok) {
            throw new Exception('Database error: ' . $mysqli->error);
        }
    } catch (Exception $e) {
        $message = $e->getMessage();
    }

    $res     = $mysqli->query("SELECT * FROM RatingHistory ORDER BY HistoryID DESC");
    $history = $res ? $res->fetch_all(MYSQLI_ASSOC) : [];
}
?>
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><title>Test trg_after_rating_update</title></head>
<body>
  <h1>Test trg_after_rating_update by Selin Lara Adalı</h1>

  <form method="post">
    <button type="submit">UPDATE ReviewID 1 → 9.0</button>
  </form>

  <?php if ($message): ?>
    <p style="color:red;"><?= htmlspecialchars($message) ?></p>
  <?php endif; ?>

  <?php if ($history): ?>
    <h2>RatingHistory</h2>
    <table border="1" cellpadding="4">
      <tr><?php foreach (array_keys($history[0]) as $col) echo "<th>$col</th>"; ?></tr>
      <?php foreach ($history as $row): ?>
        <tr><?php foreach ($row as $val) echo "<td>$val</td>"; ?></tr>
      <?php endforeach; ?>
    </table>
  <?php endif; ?>

  <p><a href="index.php">← Back Home</a></p>
</body>
</html>
