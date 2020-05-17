# Error module to handle errors globally
# include Error::ErrorHandler in application_controller.rb
#

module Error
  module ErrorHandler

    def self.included(klass)
      klass.class_eval do
        rescue_from ActiveRecord::RecordNotFound do |e|
          respond(:record_not_found, 404, e.to_s)
        end
        rescue_from StandardError do |e|
          respond(:standard_error, 500, e.to_s)
        end
      end
    end

    private
    def respond(err, status, message)
      render text: message,  status: status, error: err
    end
  end
end
