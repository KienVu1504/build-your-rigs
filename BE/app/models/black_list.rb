class BlackList < ActiveHash::Base
  fields :id, :word
  create id: 1, word: 'fuck'
  create id: 2, word: 'pussy'
  create id: 3, word: 'dkm'
end
