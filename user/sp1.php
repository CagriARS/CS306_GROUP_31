<?php
// user/sp1.php  – Author: Çağrı Arslantürk
include __DIR__ . '/../common/db_connect.php';

$rows = [];
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $genre = $mysqli->real_escape_string($_POST['genre']);
    $res   = $mysqli->query("CALL get_movies_by_genre('$genre')");
    $rows  = $res ? $res->fetch_all(MYSQLI_ASSOC) : [];
    $res->close();
    while ($mysqli->more_results()) { $mysqli->next_result(); }
}
?>
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><title>get_movies_by_genre</title></head>
<body>
  <h1>get_movies_by_genre by Çağrı Arslantürk</h1>
  <form method="post">
    <label>Genre name: <input name="genre" required></label>
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
