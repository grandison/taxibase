# -*- encoding : utf-8 -*-
module ActiveAdmin

  class Resource
    module Pagination

      # The default number of records to display per page
      attr_accessor :per_page

      # Enable / disable pagination (defaults to true)
      attr_accessor :paginate

      def initialize(*args)
        super
        @paginate = true
        @per_page = namespace.default_per_page
      end
    end
  end
end
