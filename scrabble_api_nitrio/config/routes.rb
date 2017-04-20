Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get   '/score_word/:word' => 'words#score_word', as: 'words_score_word'
end
