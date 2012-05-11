# maxwell daemon library
$:.unshift File.join File.dirname(__FILE__), 'maxwell'
%w[base daemon].each {|l| require l}
