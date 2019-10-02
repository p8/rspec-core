require 'aruba/cucumber'

<<<<<<< HEAD
Before do
  # Force ids to be printed unquoted for consistency
  set_environment_variable('SHELL', '/usr/bin/bash')

  if RUBY_PLATFORM =~ /java/ || defined?(Rubinius)
    @aruba_timeout_seconds = 120
  else
    @aruba_timeout_seconds = 10
  end
end

Aruba.configure do |config|
  config.before(:command) do |cmd|
    set_environment_variable('JRUBY_OPTS', "-X-C #{ENV['JRUBY_OPTS']}") # disable JIT since these processes are so short lived
  end
end if RUBY_PLATFORM == 'java'

Aruba.configure do |config|
  config.before(:command) do |cmd|
    set_environment_variable('RBXOPT', "-Xint=true #{ENV['RBXOPT']}") # disable JIT since these processes are so short lived
  end
end if defined?(Rubinius)

module ArubaHelpers
  def all_output
    all_commands.map { |c| c.output }.join("\n")
  end
end

World(ArubaHelpers)
=======
Aruba.configure do |config|
  if RUBY_PLATFORM =~ /java/ || defined?(Rubinius)
    config.exit_timeout = 60
  else
    config.exit_timeout = 10
  end
end

Before do
  if RUBY_PLATFORM == 'java'
    # disable JIT since these processes are so short lived
    set_environment_variable('JRUBY_OPTS', "-X-C #{ENV['JRUBY_OPTS']}")
  end

  if defined?(Rubinius)
    # disable JIT since these processes are so short lived
    set_environment_variable('RBXOPT', "-Xint=true #{ENV['RBXOPT']}")
  end
end
>>>>>>> rspec-expectations/master
