require 'pry'

pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

#def nyc_pigeon_organizer(data)
#   pigeon_list = {}
#   data.each do |attribute, info_hash|
#     info_hash.each do |phenotype, name_arr|
#       name_arr.each do |name|
#         if !pigeon_list[name]
#           pigeon_list[name] = {}
#         end
#         if !pigeon_list[name][attribute]
#           pigeon_list[name].merge!({attribute => [phenotype.to_s]})
#         else
#           pigeon_list[name][attribute].push(phenotype.to_s)
#         end
#       end
#     end
#   end
#   pigeon_list
# end
#
# nyc_pigeon_organizer(data)


def nyc_pigeon_organizer(pigeon_data)
  pigeon_names = []
  pigeon_list = {}
  pigeon_names << pigeon_data[:gender].values
  pigeon_names = pigeon_names.flatten
  pigeon_names.each{|name| pigeon_list[name] = {}}
  pigeon_list.each do |name, chars|
    pigeon_data.each do |data_kind, char_hash|
      pigeon_list[name][data_kind] = []
      char_hash.each do |pheno, names_with_pheno|
        if names_with_pheno.include?(name)
          pigeon_list[name][data_kind] << pheno.to_s
        end
      end
    end
  end
  pigeon_list
end
