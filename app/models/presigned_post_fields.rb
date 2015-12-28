class PresignedPostFields
  def initialize(fields)
    @fields = fields
  end

  def id
  end

  def key
    @fields['key']
  end

  def success_action_status
    @fields['success_action_status']
  end

  def acl
    @fields['acl']
  end

  def policy
    @fields['policy']
  end

  def x_amz_credential
    @fields['x-amz-credential']
  end

  def x_amz_algorithm
    @fields['x-amz-algorithm']
  end

  def x_amz_date
    @fields['x-amz-date']
  end

  def x_amz_signature
    @fields['x-amz-signature']
  end
end
