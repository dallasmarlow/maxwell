# maxwell daemon library
$:.unshift File.join File.dirname(__FILE__), 'maxwell'
%w[james].each {|l| require l}
