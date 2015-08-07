require 'digest'
require 'active_support'
require 'active_support/core_ext'

class Event

  fields = %w(kind title location leaders start finish description lat lon prior gcal_id)
  FIELDS = fields.map(&:to_sym)

  attr_accessor *FIELDS
  attr_reader :compare_event, :opts, :hash_opts

  def initialize(opts = {}, compare_event = nil)
    @opts          = opts
    @compare_event = compare_event
    @hash_opts     = opts.to_hash.with_indifferent_access
    FIELDS.each {|f| instance_variable_set "@#{f}", hash_opts.fetch(f, "TBD")}
  end

  # ----- instance methods -----

  def hash
    @hash ||= Digest::SHA256.hexdigest(signature).reverse[0..5].reverse
  end
  alias_method :id, :hash

  private

  # Duplicate events are hashed with the gcal_id to make them unique. When
  # everything is functioning correctly duplicate records shouldn't exist but
  # they may creep in during testing.  Try deleting gcal_test.yaml and run sync
  def signature
    base_signature ||= [title, location, start].join(' / ')
    if compare_event.present? && base_signature == compare_event.base_signature
      [base_signature, opts[:gcal_id]].join(" / ")            # extend signature
    else
      base_signature
    end
  end
end
