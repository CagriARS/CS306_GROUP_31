<?php
// support_tickets/ticket_detail.php
include __DIR__ . '/../common/mongo_connect.php';
use MongoDB\BSON\ObjectId;

// 1) Get the ticket ID from the URL
$id      = $_GET['id'] ?? '';
$comment = $_POST['comment'] ?? '';
$ticket  = null;

// 2) Load the ticket document
if ($id) {
    $ticket = $tickets->findOne(['_id' => new ObjectId($id)]);
}

// 3) If comment form was submitted, append to comments
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $ticket && $comment) {
    $tickets->updateOne(
        ['_id' => $ticket['_id']],
        ['$push' => ['comments' => [
            'text'       => $comment,
            'created_at' => date('c')
        ]]]
    );
    // Re-fetch the ticket
    $ticket = $tickets->findOne(['_id' => $ticket['_id']]);
}
?>
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><title>Ticket <?= htmlspecialchars($id) ?></title></head>
<body>
  <?php if (!$ticket): ?>
    <p><strong>Invalid ticket ID.</strong></p>
    <?php exit; ?>
  <?php endif; ?>

  <h1>Ticket Details (ID: <?= $ticket['_id'] ?>)</h1>
  <p><strong>User:</strong> <?= htmlspecialchars($ticket['username']) ?></p>
  <p><strong>Created:</strong> <?= $ticket['created_at'] ?></p>
  <p><strong>Status:</strong> <?= $ticket['status'] ? 'Open' : 'Resolved' ?></p>
  <p><strong>Message:</strong> <?= nl2br(htmlspecialchars($ticket['message'])) ?></p>

  <h2>Comments</h2>
  <?php if (empty($ticket['comments'])): ?>
    <p>No comments yet.</p>
  <?php else: ?>
    <ul>
    <?php foreach ($ticket['comments'] as $c): ?>
      <li>[<?= $c['created_at'] ?>] <?= htmlspecialchars($c['text']) ?></li>
    <?php endforeach; ?>
    </ul>
  <?php endif; ?>

  <h3>Add a Comment</h3>
  <form method="post">
    <textarea name="comment" rows="3" cols="50" required></textarea><br><br>
    <button type="submit">Post Comment</button>
  </form>

  <p><a href="tickets.php">← Back to Tickets</a></p>
</body>
</html>
