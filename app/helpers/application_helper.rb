module ApplicationHelper

  def cloud_of_tags(tags, classes)
    max = tags.sort_by{|e| e.count}.last
    tags.each do |t|
      index = t.count.to_f / max.count * (classes.size - 1)
      yield(t, classes[index.round])
    end
  end
end
