# -*- encoding : utf-8 -*-
module ActiveAdmin
  module ViewHelpers
    module SidebarHelper

      def skip_sidebar!
        @skip_sidebar = true
      end

      def skip_sidebar?
        @skip_sidebar == true
      end

    end
  end
end
