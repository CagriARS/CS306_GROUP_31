<?php
// admin/index.php
include __DIR__ . '/../common/mongo_connect.php';

// Fetch all tickets, newest first
$cursor = $tickets->find([], ['sort' => ['created_at' => -1]]);
?>
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><title>Admin: All Support Tickets</title></head>
<body>
  <h1>Admin: All Support Tickets</h1>
  <table border="1" cellpadding="4">
    <tr>
      <th>ID</th>
      <th>Username</th>
      <th>Created At</th>
      <th>Status</th>
      <th>Message</th>
    </tr>
    <?php foreach ($cursor as $t): ?>
    <tr>
      <td><a href="ticket_detail.php?id=<?= $t['_id'] ?>"><?= $t['_id'] ?></a></td>
      <td><?= htmlspecialchars($t['username']) ?></td>
      <td><?= htmlspecialchars($t['created_at']) ?></td>
      <td><?= $t['status'] ? 'Open' : 'Resolved' ?></td>
      <td><?= htmlspecialchars($t['message']) ?></td>
    </tr>
    <?php endforeach; ?>
  </table>
  <p><a href="../user/index.php">← Back to User Home</a></p>
</body>
</html>