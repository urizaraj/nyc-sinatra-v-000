class FiguresController < ApplicationController
  helpers do
    def check_new(figure, params)
      unless params[:landmark][:name].empty?
        landmark = Landmark.create(params[:landmark])
        figure.landmarks << landmark
        figure.save
      end

      unless params[:title][:name].empty?
        title = Title.create(params[:title])
        figure.titles << title
        figure.save
      end
    end
  end

  get '/figures' do
    @figures = Figure.all.order(:name)
    haml :'figures/index'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    check_new(figure, params)
    redirect '/figures'
  end

  get '/figures/new' do
    @landmarks = Landmark.all.order(:name)
    @titles = Title.all.order(:name)
    haml :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @landmarks = @figure.landmarks.order(:name)
    @titles = @figure.titles.order(:name).map(&:name).join(', ')
    haml :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all.order(:name)
    @titles = Title.all.order(:name)
    haml :'figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    check_new(figure, params)
    redirect "/figures/#{figure.id}"
  end
end
