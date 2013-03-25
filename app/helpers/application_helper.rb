module ApplicationHelper
  def sidebar_items
    items = []
    items = [
      [
        {:path => products_path, :name => 'Products'},
        {:path => ad_venders_path, :name => 'Ad Venders'},
        {:path => artworks_path, :name => 'Artworks'},
        {:path => resolutions_path, :name => 'Resolutions'}
      ]
    ]
    items[topbar_index]
  end

  def top_bar_items
    [
      {:path => products_path, :name => 'Ad Network'}
    ]
  end

  def active_top_bar?(index)
    return 'active' if controller_names[index].include? controller_path
  end

  def active_side_bar?(index)
    return 'active' if controller_path == 'artwork_distributions' and  controller_names[topbar_index][index] == 'ad_venders'
    return 'active' if controller_names[topbar_index][index] == controller_path
  end

  def controller_names
    [
      ['products', 'ad_venders', 'artworks', 'resolutions', 'artwork_distributions'],
      ['analytic_sums']
    ]
  end

  def topbar_index
    controller_names.each_with_index do |names, i|
      return i if names.include? controller_path
    end
  end

  def resolution_list
    Resolution.all.map(&:resolution)
  end
end
