class Api::V1::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: %i[show update]

  load_and_authorize_resource
  check_authorization

  def create
    article = Article.new(article_params)

    if article.save
      render json: article, status: :ok
    else
      render json: article.errors, status: :unprocessable_entity
    end    
  end

  def show
    render json: @article, status: :ok
  end

  def update
    if @article.update(article_params)
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(
      :title,
      :text,
      :user_id
    )    
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
