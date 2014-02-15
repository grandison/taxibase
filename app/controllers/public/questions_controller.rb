# -*- encoding : utf-8 -*-
class Public::QuestionsController < ApplicationController
  def create
    @question = Question.create(params[:question])
    redirect_to root_path
  end
end
