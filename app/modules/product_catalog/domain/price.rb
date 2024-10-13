module ProductCatalog
  module Domain
    class Price < DddEasy::Entity
      ALLOWED_CURRENCIES = %w[gbp eur pln]

      attr_reader :product_id, :amount, :currency, :effective_date

      def validate
        raise InvalidPriceError, "Price must be greater than zero" if amount <= 0
        raise InvalidCurrencyError, "Currency \"#{currency.upcase}\" is not allowed" unless ALLOWED_CURRENCIES.include?(currency.downcase)
      end
    end
  end
end
