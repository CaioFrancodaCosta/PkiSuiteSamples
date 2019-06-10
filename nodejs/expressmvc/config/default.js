/**
 * This module contains the default application settings.
 */
module.exports = {

	// ==========================================================================
	// Application Settings
	// ==========================================================================
	debug: true,
	protocol: 'http',
	sessionSecret: 'keyboard cat',

	// Server HTTP port.
	port: process.env.PORT || '3000',

	// Application Environment.
	environment: 'default',

	// Trust in Lacuna Test PKI (for development purposes only!)
	trustLacunaTestRoot: true,
	// THIS SHOULD NEVER BE USED ON A PRODUCTION ENVIRONMENT!

	// --------------------------------------------------------------------------
	// REST PKI
	// --------------------------------------------------------------------------
	restPki: {
		// ========================================================
		//     >>>> PASTE YOUR REST PKI ACCESS TOKEN BELOW <<<<
		// ========================================================
		accessToken: 'NVXSO6IOSm3gH63iDTcJ8deTvDKiiZnM0t8CG3HkabskKXX1713SMCxwWUDUScKkKgtpMfdmls6VYflYUKNmjozbnKJcjVS1HH3LsArtgJK7D4wa3BwO_Xm1l7r26UTDJHlG9Js2JYr5M0wbO_lH2FGri-g3-MCj0dPA4Ufo3O1PFJNTRmTL-EtEPdPaFT_zp2jd2ZmsP5ohJmhNZgBM16_UBJ5ASgBk_WREmfRlG33eQZ6vVSSoUgCMZvz8v7LolWyRyQodgKcesuvRRvVgd745drLupS3PCgMsI1u11bPrTQcYXMldb37fRHYMU-na1sIHkbwG6adZ2j7D6cdjO4Tn6hBTlAGRQy6XB7IXPMQy-cyRdxhCZxP7G1h80iPlHO4Io3pJcZ3mWUXuox3LCzWogi9jutyeYPu9TJItabBrQz7z2hHG5WqKqEPhM1b5Z_YvEQ3nAJhWjxH5DTsroVsvl6d2JySfckvkRj8U6deA3M_7xN3NH5O4AYXRS0hsOGgOrw',
		// This is a TRIAL token. It will be expired at 31/07/2019.
		// If the REST PKI sample doesn't work, please contact our support by email: suporte@lacunasoftware.com

		// In order to use this sample on a "on premises" installation of
		// REST PKI, fill the field below with the URL address of your REST PKI
		// installation (with the trailing '/' character).
		endpoint: 'https://pki.rest/'
	},

	// --------------------------------------------------------------------------
	// PKI Express
	// --------------------------------------------------------------------------
	pkiExpress: {
		// List of custom trusted roots. In this sample, we will get the
		// certificate files on resources/ static folder.
		trustedRoots: [],

		// Offline mode. Set this, if you want PKI Express to run on offline mode.
		// This mode is useful when there is no network available.
		offline: false
	},

	// --------------------------------------------------------------------------
	// Web PKI
	// --------------------------------------------------------------------------
	webPki: {
		// Base64-encoded binary license for the Web PKI. This value is passed to
		// Web PKI component's constructor on JavaScript.
		license: null
	}
};