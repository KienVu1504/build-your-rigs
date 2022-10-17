class BlackList < ActiveHash::Base
  fields :body
  create id: 1, body: 'fuck'
  create id: 2, body: 'pussy'
  create id: 3, body: 'dkm'
end
