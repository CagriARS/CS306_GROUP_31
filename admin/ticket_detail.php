<?php
// admin/ticket_detail.php
include __DIR__ . '/../common/mongo_connect.php';
use MongoDB\BSON\ObjectId;

$id = $_GET['id'] ?? '';
$msg = '';

if ($id) {
    $ticket = $tickets->findOne(['_id' => new ObjectId($id)]);
} else {
    die('Missing ticket ID');
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['resolve'])) {
        // Mark resolved
        $tickets->updateOne(
            ['_id' => new ObjectId($id)],
            ['$set' => ['status' => false]]
        );
        $msg = 'Ticket marked as resolved.';
    } elseif (!empty($_POST['admin_comment'])) {
        // Add admin comment
        $tickets->updateOne(
            ['_id' => new ObjectId($id)],
            ['$push' => ['comments' => [
                'text'       => '[ADMIN] ' . $_POST['admin_comment'],
                'created_at' => date('c')
            ]]]
        );
        $msg = 'Admin comment added.';
    }
    // Refresh ticket
    $ticket = $tickets->findOne(['_id' => new ObjectId($id)]);
}
?>
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><title>Admin: Ticket <?= htmlspecialchars($id) ?></title></head>
<body>
  <h1>Ticket Details (Admin)</h1>
  <?php if (!isset($ticket)): ?>
    <p>Invalid ticket ID.</p>
  <?php else: ?>
    <p><strong>User:</strong> <?= htmlspecialchars($ticket['username']) ?></p>
    <p><strong>Created At:</strong> <?= htmlspecialchars($ticket['created_at']) ?></p>
    <p><strong>Status:</strong> <?= $ticket['status'] ? 'Open' : 'Resolved' ?></p>
    <p><strong>Message:</strong><br><?= nl2br(htmlspecialchars($ticket['message'])) ?></p>

    <h2>Comments</h2>
    <?php if (empty($ticket['comments'])): ?>
      <p>No comments yet.</p>
    <?php else: ?>
      <ul>
        <?php foreach ($ticket['comments'] as $c): ?>
          <li>[<?= htmlspecialchars($c['created_at']) ?>] <?= htmlspecialchars($c['text']) ?></li>
        <?php endforeach; ?>
      </ul>
    <?php endif; ?>

    <?php if ($msg): ?>
      <p><em><?= htmlspecialchars($msg) ?></em></p>
    <?php endif; ?>

    <h3>Post Admin Comment</h3>
    <form method="post">
      <textarea name="admin_comment" rows="3" cols="50" required></textarea><br>
      <button type="submit">Add Admin Comment</button>
      <button type="submit" name="resolve" value="1" style="margin-left:1em;">Mark Resolved</button>
    </form>

    <p><a href="index.php">← Back to All Tickets</a></p>
  <?php endif; ?>
</body>
</html>
