if ENV["COVERAGE"]
  puts 'SimpleCov running with Rcov and Summary formatter'
  require 'simplecov-rcov'
  class SimpleCov::Formatter::MergedFormatter
    def format(result)
      SimpleCov::Formatter::RcovFormatter.new.format(result)
      SimpleCov::Formatter::SummaryFormatter.new.format(result)
    end
  end

  SimpleCov.formatter = SimpleCov::Formatter::MergedFormatter
  SimpleCov.coverage_dir('log/coverage')
  SimpleCov.minimum_coverage 95
end
