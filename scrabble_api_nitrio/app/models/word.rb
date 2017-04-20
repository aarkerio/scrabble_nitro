# coding: utf-8
# frozen_string_literal: true
require 'ffi/aspell'

# MIGRATION: bin/rails g model Word word:string valid:boolean score:integer
# TODO: we must do a velocity test to verify if is better to save the formed hash in the DB
class Word < ApplicationRecord

  validates :word, presence: true

  #  Public. Build a JSON response.
  #
  #  word  - The String to be evaluated.
  #
  # Returns a Hash object.
  def self.score_word(word)
    begin
      error_hash = { "word": word, "valid":false, "score":0 }
      speller = FFI::Aspell::Speller.new('en_US')
      if speller.correct?(word)
         score = get_value(word)
      else
         return error_hash
      end
      speller.close
      { "word":word, "valid":true, "score":score }
    rescue StandardError => error
      logger.info error
      return error_hash
    end
  end

  private

  # Private: build a Scrabble score.
  #
  # word  - The String to be evaluated.
  #
  # Returns Integer.
  def self.get_value(word)
    letterSet = [
                  { 1  => "aeioulnrst" },
                  { 2  => "dg" },
                  { 3  => "bcmp" },
                  { 4  => "fhvwy" },
                  { 5  => "k" },
                  { 8  => "jx" },
                  { 10 => "qz" }
                ]
    characters = word.chars.to_a
    score = 0
    characters.each do |w|
       letterSet.each do |lett|
         key, value = lett.first
         score = score + key  unless value.scan(w).empty?
       end
    end
    score
  end
end
