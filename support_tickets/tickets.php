<?php
// support_tickets/tickets.php
// Author: (your name here, if you’d like)
include __DIR__ . '/../common/mongo_connect.php';

$username = $_POST['username'] ?? '';
$message  = $_POST['message']  ?? '';

$insertedTicket = null;
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $username && $message) {
    $res = $tickets->insertOne([
        'username'   => $username,
        'message'    => $message,
        'created_at' => date('c'),
        'status'     => true,
        'comments'   => []
    ]);
    $insertedTicket = $tickets->findOne(['_id' => $res->getInsertedId()]);
}

// Fetch this user’s tickets, newest first (only if not just submitted)
$myTickets = [];
if (!$insertedTicket && $username) {
    $cursor    = $tickets->find(
        ['username' => $username],
        ['sort' => ['created_at' => -1]]
    );
    $myTickets = $cursor->toArray();
}
?>
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><title>Submit a Support Ticket</title></head>
<body>
  <h1>Submit a Support Ticket</h1>

  <?php if ($insertedTicket): ?>
    <h2>Your Ticket Has Been Submitted</h2>
    <table border="1" cellpadding="4">
      <tr>
        <th>ID</th><th>Created At</th><th>Status</th><th>Message</th>
      </tr>
      <tr>
        <td><?= $insertedTicket['_id'] ?></td>
        <td><?= $insertedTicket['created_at'] ?></td>
        <td><?= $insertedTicket['status'] ? 'Open' : 'Resolved' ?></td>
        <td><?= htmlspecialchars($insertedTicket['message']) ?></td>
      </tr>
    </table>
    <p><a href="tickets.php">← Submit Another Ticket</a></p>
    <p><a href="../user/index.php">← Return to Main Page</a></p>

  <?php else: // show form + history only if not just submitted ?>
    <form method="post">
      <label>Username:<br>
        <input name="username" value="<?= htmlspecialchars($username) ?>" required>
      </label><br><br>
      <label>Message:<br>
        <textarea name="message" rows="5" cols="50" required><?= htmlspecialchars($message) ?></textarea>
      </label><br><br>
      <button type="submit">Submit Ticket</button>
    </form>

    <?php if ($myTickets): ?>
      <h2>Your Previous Tickets</h2>
      <table border="1" cellpadding="4">
        <tr><th>ID</th><th>Created At</th><th>Status</th><th>Message</th></tr>
        <?php foreach ($myTickets as $t): ?>
          <tr>
            <td><a href="ticket_detail.php?id=<?= $t['_id'] ?>"><?= $t['_id'] ?></a></td>
            <td><?= $t['created_at'] ?></td>
            <td><?= $t['status'] ? 'Open' : 'Resolved' ?></td>
            <td><?= htmlspecialchars($t['message']) ?></td>
          </tr>
        <?php endforeach; ?>
      </table>
    <?php endif; ?>

    <p><a href="../user/index.php">← Back to Main Page</a></p>
  <?php endif; ?>
</body>
</html>
