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
router.use('/open-pades-express', require('./open-pades-express'));
router.use('/open-pades-restpki', require('./open-pades-restpki'));
router.use('/pades-signature-express', require('./pades-signature-express'));
router.use('/pades-signature-restpki', require('./pades-signature-restpki'));
router.use('/upload', require('./upload'));
router.use('/server-files', require('./server-files'));
router.use('/xml-nfe-signature-restpki', require('./xml-nfe-signature-restpki'));
router.use('/xml-signature-restpki', require('./xml-signature-restpki'));
router.use('/printer-version-pades-restpki', require('./printer-version-pades-restpki'));
router.use('/check-pades-restpki', require('./check-pades-restpki'));

module.exports = router;