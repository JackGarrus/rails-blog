class ArticlesController < ApplicationController
  def index
    @articles = Article.all # @article instance variable, so it's accessible from the view
  end

  def show#action
    #By default, the show action will render app/views/articles/show.html.erb, which I have to create
    @article = Article.find(params[:id])
  end

  def new #instanzia un nuovo articolo ma non lo salva
    # By default, the new action will render app/views/articles/new.html.erb, which we will create next.
    # Quindi ogni action renderizza una view analoga
    @article = Article.new
  end

  def create
    @article = Article.new(title: "...", body: "...")

    if(@article.save) 
      redirect_to @article
    else 
      render :new, status: :unprocessable_entity # 422, quindi siamo noi backenders che settiamo il tipo di status di errore, 
      # e non lo fa in automatico il browser come pensavo
    end
  end
end
