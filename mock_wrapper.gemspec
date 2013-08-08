Gem::Specification.new do |s|
  s.name        = 'mock_wrapper'
  s.version     = '0.0.1'
  s.date        = '2013-08-08'
  s.summary     = "mock_wrapper-#{s.version}"
  s.description = "A simple wrapper for the command line mock chroot tool"
  s.authors     = ["Pedro Brochado"]
  s.email       = 'brochadopedro@gmail.com'
  s.homepage    = 'https://github.com/PedroBrochado/mock_wrapper'
  s.license     = 'MIT'

  s.add_development_dependency 'cucumber', '>= 1.1.1'
  s.add_development_dependency 'aruba', '>= 0.5.3'

  s.files            = `git ls-files`.split("\n")
end