require 'rest_pki'

module Util
  include ActiveSupport::Concern

  # region REST PKI

  def get_rest_pki_client

    # Retrieve your token and endpoint values from the "application.rb"
    # configuration.
    access_token = Rails.configuration.lacuna['rest_pki']['access_token']
    endpoint = Rails.configuration.lacuna['rest_pki']['endpoint']

    # Throw exception if token is not set (this check is here just for the sake
    # of new comers, you can remove it).
    if access_token.include? ' API '
      raise 'The API access token was not set! Hint: to run this sample you must generate an API access token on the REST PKI website and paste it on the file config/application.rb'
    end

    if endpoint.nil? or endpoint.length == 0
      endpoint = 'https://pki.rest/'
    end

    RestPki::RestPkiClient.new(endpoint, access_token)
  end

  # This method is called by all pages to determine the security context to be
  # used.
  #
  # Security contexts dictate witch root certification authorities are trusted
  # during certificate validation. In your API calls, you can use one of the
  # standard security contexts or reference one of your custom contexts.
  def get_security_context_id

    if Rails.configuration.lacuna['trust_lacuna_test_root']

      # Lacuna Test PKI (for development purposes only!)
      #
      # This security context trusts ICP-Brasil certificates as well as
      # certificates on Lacuna Software's test PKI. Use it to accept the test
      # certificates provided by Lacuna Software.
      #
      # THIS SHOULD NEVER BE USED ON A PRODUCTION ENVIRONMENT!
      return '803517ad-3bbc-4169-b085-60053a8f6dbf'
      # Notice for On Premises users: this security context might not exist on
      # your installation, if you encounter an error please contact developer
      # support.
    end

    # In production, accepting only certificates from ICP-Brasil
    RestPki::StandardSecurityContexts::PKI_BRAZIL
  end

  # endregion

  # region PKI Express

  def set_pki_defaults(operator)

    # Set the operator to trust in a custom trusted root, you need to inform the
    # operator class. We will add each trusted root from configuration file. In
    # this sample, we assumed that all trusted roots are in the private/
    # folder. You are free to pass any path.
    trusted_roots = Rails.configuration.lacuna['pki_express']['trusted_roots']
    trusted_roots&.each do |root|
      operator.add_trusted_root(get_resource_path(root))
    end

    # Set operator to "OFFLINE MODE" (default: false):
    operator.offline = Rails.configuration.lacuna['pki_express']['offline']

    # Set the operator to use a timestamp authority when performing an timestamp
    # operation. In this sample, we will use the REST PKI by default to emit a
    # timestamp. It only be filled if the REST PKI was provided.
    rest_pki_access_token = Rails.configuration.lacuna['rest_pki']['access_token']
    unless rest_pki_access_token&.include? ' ACCESS TOKEN '

      # Get an instance of the TimestampAuthority class, responsible to inform
      # the url and authentication logic to be used when contacting and
      # timestamp authority.
      authority = PkiExpress::TimestampAuthority.new('https://pki.rest/tsp/a402df41-8559-47b2-a05c-be555bf66310')

      # Set authentication strategy. In the case of REST PKI, is using a bearer
      # token.
      authority.set_oauth_token_authentication(Rails.configuration.lacuna['rest_pki']['access_token'])

      # Add authority to be used by the operator.
      operator.timestamp_authority = authority
    end

    # Set the operator to trust Lacuna Test Root (for development purposes
    # only!). Use this to accept the test certificate provide by Lacuna
    # Software.
    operator.trust_lacuna_test_root = Rails.configuration.lacuna['trust_lacuna_test_root']
    # THIS SHOULD NEVER BE USED ON PRODUCTION ENVIRONMENT!
  end

  # endregion

  def set_expired_page_headers
    now = DateTime.now
    expires = now - 3600.second
    headers['Expires'] = expires.strftime('%a, %d %b %Y %H:%M:%S GMT')
    headers['Last-Modified'] = now.strftime('%a, %d %b %Y %H:%M:%S GMT')
    headers['Cache-Control'] = 'private, no-store, max-age=0, no-cache, must-revalidate, post-check=0, pre-check=0'
    headers['Pragma'] = 'no-cache'
  end
end