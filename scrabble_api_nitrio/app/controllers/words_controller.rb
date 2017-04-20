class WordsController < ApplicationController

  # Gets score for a word.  GET /score_word/:word
  #
  # Returns a json response.
  def score_word
    result = Word.score_word params[:word]
    # TODO: to move this to a JSON proper view.
    return render json: result
  end

end
