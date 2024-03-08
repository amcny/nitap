const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onUserDeleted = functions.auth.user().onDelete(async (user) => {
  let firestore = admin.firestore();
  let userRef = firestore.doc("user_id/" + user.uid);
  await firestore.collection("user_id").doc(user.uid).delete();
  await firestore
    .collection("attendance")
    .where("user", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(`Deleting document ${doc.id} from collection attendance`);
        await doc.ref.delete();
      }
    });
  await firestore
    .collection("marks")
    .where("user", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(`Deleting document ${doc.id} from collection marks`);
        await doc.ref.delete();
      }
    });
});
