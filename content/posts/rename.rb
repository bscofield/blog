files = Dir.glob('*.html')
files.each do |f|
  new_name = f.downcase.sub(/^\d{4}-\d{2}-\d{2}-/, '')

  `mv #{f} #{new_name}` if new_name != f
end
