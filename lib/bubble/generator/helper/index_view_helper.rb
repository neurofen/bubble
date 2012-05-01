include VIEW::HELPER

class Index

  def create_page_from title, all_makes
    ["#{title}.html", index_display_data_from(all_makes)]
  end

  private
    def index_display_data_from all_makes
      DisplayData.new('index', create_index_navigation_using(all_makes), [])
    end

    def create_index_navigation_using all_makes
      navigation = []
      all_makes.each do |make|
        navigation.push([make, "#{string2hex(make)}.html"])
      end
      navigation
    end
end