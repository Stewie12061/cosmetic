class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def is_storage_from_disk?
    ActiveStorage::Blob.service.class.name.include?('Disk')
  end

  def storage_local_path(key = nil)
    return ActiveStorage::Blob.service.send(:path_for, key) unless key.nil?
  end

  def storage_public_path(key = nil)
    ActiveStorage::Blob.service.send(:object_for, key).public_url unless key.nil?
  end
end
