const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.newCloudFunction = functions
  .region("europe-central2")
  .https.onCall((data, context) => {
    if (!context.auth.uid) {
      return;
    }
    const id = data.id;
    // Write your code below!

    // Write your code above!
  });
