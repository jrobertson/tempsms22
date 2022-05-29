Gem::Specification.new do |s|
  s.name = 'tempsms22'
  s.version = '0.1.2'
  s.summary = 'Scrapes the temporary SMS number from receive-smss.com.'
  s.authors = ['James Robertson']
  s.files = Dir["lib/tempsms22.rb"]
  s.add_runtime_dependency('nokorexi', '~> 0.7', '>=0.7.0')
  s.signing_key = '../privatekeys/tempsms22.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'digital.robertson@gmail.com'
  s.homepage = 'https://github.com/jrobertson/tempsms22'
end
