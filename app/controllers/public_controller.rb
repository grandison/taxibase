# -*- encoding : utf-8 -*-
class PublicController < ApplicationController
  layout "public"
  def regulations
  end

  def contacts
    @question = Question.new
  end
end
