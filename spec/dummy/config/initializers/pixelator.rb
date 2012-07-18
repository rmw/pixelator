#TODO: rename to Pixelator.data
PIXEL_DATA = HashWithIndifferentAccess.new
PIXEL_DATA[:pixels] = YAML.load_file(File.join(Rails.root, "config", "pixels.yml")).with_indifferent_access
PIXEL_DATA[:pixels].each do |k,v|
  if v.is_a?(Array)
    v.map! do |a|
      a['snippet'] = URI.escape(a['snippet'])
      a
    end
  end
end

#add contextual data that the pixelator might need
#  such as google analytics ...
PIXEL_DATA[:context] = { google_analytics: 'GA_ACCOUNT' }.with_indifferent_access
