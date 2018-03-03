class LandmarksController < ApplicationController
  get '/landmarks/new' do
    haml :'landmarks/new'
  end

  get '/landmarks' do
    @landmarks = Landmark.all.order(:name)
    haml :'landmarks/index'
  end

  post '/landmarks' do
    Landmark.create(params[:landmark])
    redirect '/landmarks'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    haml :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    haml :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    Landmark.find(params[:id]).update(params[:landmark])
    redirect "/landmarks/#{params[:id]}"
  end
end
