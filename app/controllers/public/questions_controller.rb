# -*- encoding : utf-8 -*-
class Public::QuestionsController < ApplicationController
  layout "public"

  def create
    @question = Question.new(params[:question])
    if @question.save
      redirect_to root_path, notice: "Ваш вопрос отправлен."
    else
      render "new"
    end
  end
end
