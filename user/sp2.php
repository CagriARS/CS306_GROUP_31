<?php
// user/sp2.php  – Author: Mustafa Ata Yılmaz
include __DIR__ . '/../common/db_connect.php';

$rows = [];
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = $mysqli->real_escape_string($_POST['title']);
    $res   = $mysqli->query("CALL average_rating_for_movie('$title')");
    $rows  = $res ? $res->fetch_all(MYSQLI_ASSOC) : [];
    $res->close();
    while ($mysqli->more_results()) { $mysqli->next_result(); }
}
?>
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><title>average_rating_for_movie</title></head>
<body>
  <h1>average_rating_for_movie by: Mustafa Ata Yılmaz</h1>
  
  <form method="post">
    <label>Movie title: <input name="title" required></label>
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
