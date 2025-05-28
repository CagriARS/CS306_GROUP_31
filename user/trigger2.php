<?php
// user/trigger2.php  – Author: Mustafa Ata Yılmaz
include __DIR__ . '/../common/db_connect.php';

$message = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        if (isset($_POST['ok'])) {
            $sql = "
              INSERT INTO Movie (Title, ReleaseYear, Duration)
              VALUES ('Short Movie', 2025, 120)
            ";
        } else {
            $sql = "
              INSERT INTO Movie (Title, ReleaseYear, Duration)
              VALUES ('Long Movie', 2025, 400)
            ";
        }
        $ok = @$mysqli->query($sql);
        if (!$ok) {
            if (strpos($mysqli->error, 'duration') !== false) {
                throw new Exception('You cannot exceed 300 minutes.');
            }
            throw new Exception('Database error: ' . $mysqli->error);
        }
        $message = 'Operation succeeded.';
    } catch (Exception $e) {
        $message = $e->getMessage();
    }
}
?>
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><title>Test trg_before_movie_insert</title></head>
<body>
  <h1>Test trg_before_movie_insert by Mustafa Ata Yılmaz</h1>

  <form method="post">
    <button name="ok"    type="submit">Insert 120 min → OK</button>
    <button name="error" type="submit">Insert 400 min → ERROR</button>
  </form>

  <?php if ($message): ?>
    <p style="color:<?= $message === 'Operation succeeded.' ? 'green' : 'red' ?>;">
      <?= htmlspecialchars($message) ?>
    </p>
  <?php endif; ?>

  <p><a href="index.php">← Back Home</a></p>
</body>
</html>
