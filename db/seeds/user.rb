unless User.exists?
  p 'Import User.........'
  User.create(email: 'tamle.dev@outlook.com', password: '123456', name: 'Tam Le')
end
