const admin = require("firebase-admin/app");
admin.initializeApp();

const newCloudFunction = require("./new_cloud_function.js");
exports.newCloudFunction = newCloudFunction.newCloudFunction;
