# -*- encoding : utf-8 -*-
module Devise
  module Hooks
    # A small warden proxy so we can remember, forget and
    # sign out users from hooks.
    class Proxy #:nodoc:
      include Devise::Controllers::Rememberable
      include Devise::Controllers::SignInOut

      attr_reader :warden
      delegate :cookies, :env, :to => :warden

      def initialize(warden)
        @warden = warden
      end

      def session
        warden.request.session
      end
    end
  end
end
