<?php
// user/trigger5.php  – Author: Kemal Efe Kolaylı
include __DIR__ . '/../common/db_connect.php';

$message = '';
$review  = null;
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $ok = @$mysqli->query("
          INSERT INTO Review (MovieID, ReviewText, ReviewDate, RatingScore)
          VALUES (1, 'Auto-default test', CURDATE(), 8.0)
        ");
        if (!$ok) throw new Exception('Database error: ' . $mysqli->error);
        $id     = $mysqli->insert_id;
        $message = "Inserted ReviewID $id";
        $res    = $mysqli->query("SELECT * FROM Review WHERE ReviewID = $id");
        $review = $res->fetch_assoc();
    } catch (Exception $e) {
        $message = $e->getMessage();
    }
}
?>
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><title>Test trg_before_review_insert</title></head>
<body>
  <h1>Test trg_before_review_insert by Kemal Efe Kolaylı</h1>

  <form method="post">
    <button type="submit">Insert Review without RatingID</button>
  </form>

  <?php if ($message): ?>
    <p style="color:<?= strpos($message, 'Inserted')===0 ? 'green' : 'red' ?>">
      <?= htmlspecialchars($message) ?>
    </p>
  <?php endif; ?>

  <?php if ($review): ?>
    <h2>Inserted Review Row</h2>
    <table border="1" cellpadding="4">
      <tr><?php foreach (array_keys($review) as $col) echo "<th>$col</th>"; ?></tr>
      <tr><?php foreach ($review as $val) echo "<td>".htmlspecialchars($val)."</td>"; ?></tr>
    </table>
  <?php endif; ?>

  <p><a href="index.php">← Back Home</a></p>
</body>
</html>
