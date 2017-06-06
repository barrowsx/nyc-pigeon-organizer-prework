def nyc_pigeon_organizer(data)
  names = data.map {|key, value| value.values}.flatten.uniq
  new_hash = names.each_with_object({}) do |name, h|
    h[name] = Hash[data.keys.map{|x| [x, []]}]
  end
  data.keys.each_with_object(new_hash) do |type, struct|
    names.each do |pigeon|
      data[type].keys.each do |trait|
        if data[type][trait].include?(pigeon)
          struct[pigeon][type] << trait.to_s
        end
      end
    end
  end
end
