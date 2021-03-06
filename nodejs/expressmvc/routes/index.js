const express = require('express');

let router = express.Router();

/**
 * Define routes.
 */
router.use('/', require('./home'));
router.use('/authentication-restpki', require('./authentication-restpki'));
router.use('/batch-pades-signature-express', require('./batch-pades-signature-express'));
router.use('/cades-signature-restpki', require('./cades-signature-restpki'));
router.use('/download', require('./download'));
router.use('/pades-signature-express', require('./pades-signature-express'));
router.use('/pades-signature-restpki', require('./pades-signature-restpki'));
router.use('/upload', require('./upload'));

module.exports = router;