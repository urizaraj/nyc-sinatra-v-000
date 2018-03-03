class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all.order(:name)
    haml :'figures/index'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])

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
    @titles = @figure.titles.order(:name).join(', ')
    haml :'figures/show'
  end
end
