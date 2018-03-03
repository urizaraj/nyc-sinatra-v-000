class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all.order(:name)
    haml :'figures/index'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    unless params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      figure.update(landmark: landmark)
    unless param[:title][:name].empty?
      title = Title.create(params[:title])
      figure.update(title: title)
    redirect '/figures'
  end

  get '/figures/new' do
    @landmarks = Landmark.all.order(:name)
    @titles = Title.all.order(:name)
    haml :'figures/new'
  end
end
