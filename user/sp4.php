<?php
// user/sp4.php  – Author: Mert Ünaldı
include __DIR__ . '/../common/db_connect.php';

$rows = [];
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $n   = (int)$_POST['n'];
    $res = $mysqli->query("CALL top_rated_movies($n)");
    $rows = $res ? $res->fetch_all(MYSQLI_ASSOC) : [];
    $res->close();
    while ($mysqli->more_results()) { $mysqli->next_result(); }
}
?>
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><title>top_rated_movies</title></head>
<body>
  <h1>top_rated_movies by Mert Ünaldı</h1>
  <form method="post">
    <label>Top N: <input name="n" type="number" min="1" value="5" required></label>
    <button type="submit">Run</button>
  </form>

  <?php if ($rows): ?>
    <h2>Results</h2>
    <table border="1" cellpadding="4">
      <tr><?php foreach(array_keys($rows[0]) as $c) echo "<th>$c</th>"; ?></tr>
      <?php foreach($rows as $r): ?>
        <tr><?php foreach($r as $v) echo "<td>".htmlspecialchars($v)."</td>"; ?></tr>
      <?php endforeach; ?>
    </table>
  <?php endif; ?>

  <p><a href="index.php">← Back Home</a></p>
</body>
</html>
