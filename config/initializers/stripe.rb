Rails.configuration.stripe = {
  :publishable_key => 'pk_test_QdfeXLuGE3VQ73icXw0SOQnX003tUyyHid',
  :secret_key      => 'sk_test_xX8qySOpVnOyNziRK1SlaxG200LhtZZEzB'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]