group :red_green_refactor, halt_on_fail: true do
  guard :rspec, cmd: 'rspec' do
    watch(/(.+)\.rb/) { 'spec' }
  end
  guard :rubocop do
    watch(/(.+)\.rb/)
  end
end
